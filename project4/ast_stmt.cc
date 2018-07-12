/* File: ast_stmt.cc
 * -----------------
 * Implementation of statement node classes.
 */
#include "ast_stmt.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_expr.h"
#include "scope.h"
#include "errors.h"

Program::Program(List<Decl*> *d) {
        Assert(d != NULL);
        (decls=d)->SetParentAll(this);
}

void Program::Check() {
        nodeScope = new Scope();
        decls->DeclareAll(nodeScope);
        decls->CheckAll();
}

StmtBlock::StmtBlock(List<VarDecl*> *d, List<Stmt*> *s) {
        Assert(d != NULL && s != NULL);
        (decls=d)->SetParentAll(this);
        (stmts=s)->SetParentAll(this);
}
void StmtBlock::Check() {
        nodeScope = new Scope();
        decls->DeclareAll(nodeScope);
        decls->CheckAll();
        stmts->CheckAll();
}

ConditionalStmt::ConditionalStmt(Expr *t, Stmt *b) { 
        Assert(t != NULL && b != NULL);
        (test=t)->SetParent(this); 
        (body=b)->SetParent(this);
}

void ConditionalStmt::Check() {
        test -> Check();
        if (test -> GetType() != Type::boolType)
                ReportError::TestNotBoolean(test);
        if (body)
                body->Check();
}

ForStmt::ForStmt(Expr *i, Expr *t, Expr *s, Stmt *b): LoopStmt(t, b) { 
        Assert(i != NULL && t != NULL && s != NULL && b != NULL);
        (init=i)->SetParent(this);
        (step=s)->SetParent(this);
}

void ForStmt::Check() {
        if (init)
                init -> Check();
        if (test) {
                test -> Check();
                if (test -> GetType() != Type::boolType)
                        ReportError::TestNotBoolean(test);
        }               
        if (step) 
                step -> Check();
        if (body)
                body -> Check();
}

IfStmt::IfStmt(Expr *t, Stmt *tb, Stmt *eb): ConditionalStmt(t, tb) { 
        Assert(t != NULL && tb != NULL); // else can be NULL
        elseBody = eb;
        if (elseBody) elseBody->SetParent(this);
}
void IfStmt::Check() {
        ConditionalStmt::Check();
        if (elseBody) elseBody->Check();
}

void BreakStmt::Check() {
        LoopStmt* l = this -> GetLoop();
        if (!l)
                ReportError::BreakOutsideLoop(this);
}

ReturnStmt::ReturnStmt(yyltype loc, Expr *e) : Stmt(loc) { 
        Assert(e != NULL);
        (expr=e)->SetParent(this);
}

void ReturnStmt::Check() {
        expr -> Check();
        EmptyExpr* empty = dynamic_cast <EmptyExpr*> (expr);
        if (empty) {
                FnDecl* f_tmp = this -> GetFunction();
                Type* ret = f_tmp -> GetReturnType();
                if (ret != Type::voidType) {
                        ReportError::ReturnMismatch(this,
                                                    expr -> GetType(),
                                                    f_tmp -> GetReturnType());   
                }
                return;
        }
                
        if (expr -> GetError())
                return;
        FnDecl* f_tmp = this -> GetFunction();
        
        if (!expr -> GetType() -> IsCompatible(f_tmp -> GetReturnType())) 
                ReportError::ReturnMismatch(this,
                                            expr -> GetType(),
                                            f_tmp -> GetReturnType());
}
  
PrintStmt::PrintStmt(List<Expr*> *a) {    
        Assert(a != NULL);
        (args=a)->SetParentAll(this);
}

void PrintStmt::Check() {
        for (int i = 0; i < args -> NumElements(); i++) {
                args ->Nth(i) -> Check();
                if (args -> Nth(i) -> GetError())
                        continue;
                if (!args -> Nth(i) -> GetType() -> IsPrintable())
                        ReportError::PrintArgMismatch(args -> Nth(i),
                                                      i+1,
                                                      args -> Nth(i) -> GetType());
        }
}

