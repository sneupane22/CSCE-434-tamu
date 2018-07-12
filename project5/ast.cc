/* File: ast.cc
 * ------------
 */

#include "ast.h"
#include "ast_type.h"
#include "ast_decl.h"
#include <string.h> // strdup
#include <stdio.h>  // printf
#include "errors.h"
#include "scope.h"
#include "ast_stmt.h"

Node::Node(yyltype loc) {
        location = new yyltype(loc);
        parent = NULL;
        nodeScope = NULL;
}

Node::Node() {
        location = NULL;
        parent = NULL;
        nodeScope = NULL;
}

Decl *Node::FindDecl(Identifier *idToFind, lookup l) {
        Decl *mine = dynamic_cast <Decl*> (this);
        if (!nodeScope) PrepareScope();
        if (nodeScope && (mine = nodeScope->Lookup(idToFind)))
                return mine;
        if (l == kDeep && parent)
                return parent->FindDecl(idToFind, l);
        return NULL;
}

ClassDecl* Node::GetClass() {
        ClassDecl* c = dynamic_cast <ClassDecl*> (this);
        if (c != NULL) 
                return c;
        if (parent)
                return parent -> GetClass();
        return NULL;
}

FnDecl* Node::GetFunction() {
        FnDecl* f = dynamic_cast <FnDecl*> (this);
        if (f != NULL) 
                return f;
        if (parent)
                return parent -> GetFunction();
        return NULL;
}

LoopStmt* Node::GetLoop() {
        LoopStmt* l = dynamic_cast <LoopStmt*> (this);
        if (l != NULL) 
                return l;
        if (parent)
                return parent -> GetLoop();
        return NULL;
}

Identifier::Identifier(yyltype loc, const char *n) : Node(loc) {
        name = strdup(n);
        cached = NULL;
} 

