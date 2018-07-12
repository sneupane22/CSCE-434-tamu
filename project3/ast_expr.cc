/* File: ast_expr.cc
 * -----------------
 * Implementation of expression node classes.
 */
#include "ast_expr.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "errors.h"
#include <string.h>

IntConstant::IntConstant(yyltype loc, int val) : Expr(loc) {
    value = val;
}

DoubleConstant::DoubleConstant(yyltype loc, double val) : Expr(loc) {
    value = val;
}

BoolConstant::BoolConstant(yyltype loc, bool val) : Expr(loc) {
    value = val;
}

StringConstant::StringConstant(yyltype loc, const char *val) : Expr(loc) {
    Assert(val != NULL);
    value = strdup(val);
}

Operator::Operator(yyltype loc, const char *tok) : Node(loc) {
    Assert(tok != NULL);
    strncpy(tokenString, tok, sizeof(tokenString));
}
CompoundExpr::CompoundExpr(Expr *l, Operator *o, Expr *r) 
  : Expr(Join(l->GetLocation(), r->GetLocation())) {
    Assert(l != NULL && o != NULL && r != NULL);
    (op=o)->SetParent(this);
    (left=l)->SetParent(this); 
    (right=r)->SetParent(this);
}

CompoundExpr::CompoundExpr(Operator *o, Expr *r) 
  : Expr(Join(o->GetLocation(), r->GetLocation())) {
    Assert(o != NULL && r != NULL);
    left = NULL; 
    (op=o)->SetParent(this);
    (right=r)->SetParent(this);
}

void CompoundExpr::Check(Hashtable <Decl*> *global_Scope,
                         Hashtable <Decl*> *previous_Scope,
                         Hashtable<Decl*> *current_Scope){
    if (left != NULL)
        left ->Check(global_Scope, previous_Scope, current_Scope);
    if (right != NULL)
        right -> Check(global_Scope, previous_Scope, current_Scope);
}
  
ArrayAccess::ArrayAccess(yyltype loc, Expr *b, Expr *s) : LValue(loc) {
    (base=b)->SetParent(this); 
    (subscript=s)->SetParent(this);
}

void ArrayAccess::Check(Hashtable <Decl*> *global_Scope,
                        Hashtable <Decl*> *previous_Scope,
                        Hashtable <Decl*> *current_Scope) {
    base -> Check(global_Scope, previous_Scope,  current_Scope);
    subscript -> Check(global_Scope, previous_Scope, current_Scope);
}
     
FieldAccess::FieldAccess(Expr *b, Identifier *f) 
  : LValue(b? Join(b->GetLocation(), f->GetLocation()) : *f->GetLocation()) {
    Assert(f != NULL); // b can be be NULL (just means no explicit base)
    base = b; 
    if (base) base->SetParent(this); 
    (field=f)->SetParent(this);
}

void FieldAccess::Check(Hashtable <Decl*> *global_Scope,
                        Hashtable <Decl*> *previous_Scope,
                        Hashtable <Decl*> *current_Scope) {
    char* name = field -> GetName();
    if (current_Scope != NULL) 
        if (current_Scope -> Lookup(name) != NULL)
            return;
    if (previous_Scope != NULL) 
        if (previous_Scope -> Lookup(name) != NULL)
            return;
    PROGRAM -> CheckSpecific(name);
    if (global_Scope -> Lookup(name) != NULL)
        return;
    ReportError::IdentifierNotDeclared(field, LookingForVariable);
}



Call::Call(yyltype loc, Expr *b, Identifier *f, List<Expr*> *a) : Expr(loc)  {
    Assert(f != NULL && a != NULL); // b can be be NULL (just means no explicit base)
    base = b;
    if (base) base->SetParent(this);
    (field=f)->SetParent(this);
    (actuals=a)->SetParentAll(this);
}

void Call::Check(Hashtable <Decl*> *global_Scope,
                 Hashtable <Decl*> *previous_Scope,
                 Hashtable <Decl*> *current_Scope) {    
}
 

NewExpr::NewExpr(yyltype loc, NamedType *c) : Expr(loc) { 
  Assert(c != NULL);
  (cType=c)->SetParent(this);
}


NewArrayExpr::NewArrayExpr(yyltype loc, Expr *sz, Type *et) : Expr(loc) {
    Assert(sz != NULL && et != NULL);
    (size=sz)->SetParent(this); 
    (elemType=et)->SetParent(this);
}

       
