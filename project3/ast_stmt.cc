/* File: ast_stmt.cc
 * -----------------
 * Implementation of statement node classes.
 */
#include "ast_stmt.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_expr.h"
#include "hashtable.h"
#include "errors.h"
#include <vector>
#include <iostream>
#include <string>
using namespace std;

Program* PROGRAM = NULL;

Program::Program(List<Decl*> *d) {
    Assert(d != NULL);
    (decls=d)->SetParentAll(this);
    Scope = new Hashtable<Decl*>;
    isVisited = new vector<bool>;
    
    for (int i = 0; i < decls -> NumElements(); i++) {
        isVisited -> push_back(0);
    }

    PROGRAM = this;
}

void Program::Check() {
    /* Check each declaration and make sure it is unique*/
    for (int i = 0; i < decls->NumElements(); i++) {
        if (isVisited -> at(i) == 0) {
            isVisited -> at(i) = 1;
            decls -> Nth(i) -> Check(Scope, Scope, NULL);
        }
    }
}

void Program::CheckSpecific(char* d) {
    for (int i = 0; i < decls -> NumElements(); i++) {
        if (string(d) == string(decls -> Nth(i) -> GetName()) &&
            isVisited->at(i) == 0) {
            isVisited -> at(i) = 1;
            decls -> Nth(i) -> Check(Scope, Scope, NULL);
            break;
        }
    }
}

StmtBlock::StmtBlock(List<VarDecl*> *d, List<Stmt*> *s) {
    Assert(d != NULL && s != NULL);
    (decls=d)->SetParentAll(this);
    (stmts=s)->SetParentAll(this);
    Scope = new Hashtable <Decl*>;
}

void StmtBlock::Check(Hashtable <Decl*> *global_Scope,
                      Hashtable <Decl*> *previous_Scope,
                      Hashtable <Decl*> *current_Scope) {

    Hashtable <Decl*> *p_Scope = new Hashtable <Decl*>;
    p_Scope -> Combine (previous_Scope);
    p_Scope -> Combine (current_Scope);
    
    /* Check all variable Decls */
    for (int i = 0; i < decls -> NumElements(); i++) 
        decls -> Nth(i) -> Check(global_Scope, p_Scope, Scope);
    

    /* Check All Stmts */
    for (int i = 0; i < stmts -> NumElements(); i++) {
        stmts -> Nth(i) -> Check(global_Scope, p_Scope, Scope);
    }
}

ConditionalStmt::ConditionalStmt(Expr *t, Stmt *b) { 
    Assert(t != NULL && b != NULL);
    (test=t)->SetParent(this); 
    (body=b)->SetParent(this);
    Scope = new Hashtable <Decl*>;
}

void ConditionalStmt::Check(Hashtable <Decl*> *global_Scope,
                            Hashtable <Decl*> *previous_Scope,
                            Hashtable <Decl*> *current_Scope) {
    Hashtable <Decl*> *p_Scope = new Hashtable <Decl*>;
    p_Scope -> Combine (previous_Scope);
    p_Scope -> Combine (current_Scope);

    test -> Check(global_Scope, p_Scope, Scope);
    body -> Check(global_Scope, p_Scope, Scope);
}

ForStmt::ForStmt(Expr *i, Expr *t, Expr *s, Stmt *b): LoopStmt(t, b) { 
    Assert(i != NULL && t != NULL && s != NULL && b != NULL);
    (init=i)->SetParent(this);
    (step=s)->SetParent(this);
}

void ForStmt::Check(Hashtable <Decl*> *global_Scope,
                    Hashtable <Decl*> *previous_Scope,
                    Hashtable <Decl*> *current_Scope) {
    Hashtable <Decl*> *p_Scope = new Hashtable <Decl*>;
    p_Scope -> Combine (previous_Scope);
    p_Scope -> Combine (current_Scope);

    init -> Check(global_Scope, p_Scope, Scope);
    test -> Check(global_Scope, p_Scope, Scope);
    step -> Check(global_Scope, p_Scope, Scope);
    body -> Check(global_Scope, p_Scope, Scope);
}

IfStmt::IfStmt(Expr *t, Stmt *tb, Stmt *eb): ConditionalStmt(t, tb) { 
    Assert(t != NULL && tb != NULL); // else can be NULL
    elseBody = eb;
    if (elseBody) elseBody->SetParent(this);
}

void IfStmt::Check(Hashtable <Decl*> *global_Scope,
                   Hashtable <Decl*> *previous_Scope,
                   Hashtable <Decl*> *current_Scope) {
    Hashtable <Decl*> *p_Scope = new Hashtable <Decl*>;
    p_Scope -> Combine (previous_Scope);
    p_Scope -> Combine (current_Scope);

    test -> Check(global_Scope, p_Scope, Scope);
    body -> Check(global_Scope, p_Scope, Scope);
}


ReturnStmt::ReturnStmt(yyltype loc, Expr *e) : Stmt(loc) { 
    Assert(e != NULL);
    (expr=e)->SetParent(this);
}

void ReturnStmt::Check(Hashtable <Decl*> *global_Scope,
                       Hashtable <Decl*> *previous_Scope,
                       Hashtable <Decl*> *current_Scope) {
    expr -> Check(global_Scope, previous_Scope, current_Scope);
}
  
PrintStmt::PrintStmt(List<Expr*> *a) {    
    Assert(a != NULL);
    (args=a)->SetParentAll(this);
}

void PrintStmt::Check(Hashtable <Decl*> *global_Scope,
                      Hashtable <Decl*> *previous_Scope,
                      Hashtable <Decl*> *current_Scope){
    for (int i = 0; i < args -> NumElements(); i++)
        args -> Nth(i) -> Check(global_Scope, previous_Scope, current_Scope);
}
