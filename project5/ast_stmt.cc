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
#include "codegen.h"
#include <string>

Program::Program(List<Decl*> *d) {
        Assert(d != NULL);
        (decls=d)->SetParentAll(this);
}

void Program::Check() {
        nodeScope = new Scope();
        decls->DeclareAll(nodeScope);
        decls->CheckAll();
}

Location* Program::Emit()
{
        Decl* main = nodeScope->Lookup(std::string("main").c_str());
        if (main == NULL) {
                ReportError::NoMainFound();
                return NULL;
        }
        FnDecl* fnmain = dynamic_cast<FnDecl*> (main);
        if (fnmain == NULL) {
                ReportError::NoMainFound();
                return NULL;        
        }
        /*if (fnmain->GetReturnType() != Type::intType) {
                ReportError::NoMainFound();
                return 0;
                }*/
        CodeGenerator* codegen = new CodeGenerator();
        for (int i = 0; i < decls->NumElements(); i++) {
                decls->Nth(i)->Emit(codegen);
        }
        codegen->DoFinalCodeGen(); 
        return NULL;
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

Location* StmtBlock::Emit(CodeGenerator* codegen) {
        for (int i = 0; i < decls->NumElements(); i++)
                decls->Nth(i)->Emit(codegen);
        for (int i = 0; i < stmts->NumElements(); i++)
                stmts->Nth(i)->Emit(codegen);
        return NULL;
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

Location* WhileStmt::Emit(CodeGenerator* codegen)
{
        char* WhileLabel = codegen->NewLabel();
        codegen->GenLabel(WhileLabel);
        OutLabel = codegen->NewLabel();
        codegen->GenIfZ(test->Emit(codegen), OutLabel);
        body->Emit(codegen);
        codegen->GenLabel(WhileLabel);
        codegen->GenLabel(OutLabel);
        return NULL;
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

Location* ForStmt::Emit(CodeGenerator* codegen)
{
        char* ForLabel = codegen->NewLabel();
        OutLabel = codegen->NewLabel();
        init->Emit(codegen);
        codegen->GenLabel(ForLabel);
        codegen->GenIfZ(test->Emit(codegen), OutLabel);
        body->Emit(codegen);
        step->Emit(codegen);
        codegen->GenGoto(ForLabel);
        codegen->GenLabel(OutLabel);
        return NULL;
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

Location* IfStmt::Emit(CodeGenerator* codegen)
{
        Location* t = test->Emit(codegen);
        OutLabel = codegen->NewLabel();
        if (elseBody == NULL) {
                codegen->GenIfZ(t, OutLabel);
                body->Emit(codegen);
                codegen->GenGoto(OutLabel);
                codegen->GenLabel(OutLabel);
                return NULL;
        }
        else {
                char* ElseLabel = codegen->NewLabel();
                codegen->GenIfZ(t, ElseLabel);
                body->Emit(codegen);
                codegen->GenGoto(OutLabel);
                codegen->GenLabel(ElseLabel);
                elseBody->Emit(codegen);
                codegen->GenLabel(OutLabel);
                return NULL;
        }
}

void BreakStmt::Check() {
        LoopStmt* l = this -> GetLoop();
        if (!l)
                ReportError::BreakOutsideLoop(this);
}

Location* BreakStmt::Emit(CodeGenerator* codegen)
{
        LoopStmt* l = GetLoop();
        if (l == NULL)
                return NULL;
        codegen->GenGoto(l->GetOutLabel()); 
        return NULL;
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

Location* ReturnStmt::Emit(CodeGenerator* codegen)
{
        if (expr == NULL) {
                codegen->GenReturn();
                return 0;
        }
        codegen->GenReturn(expr->Emit(codegen));
        return 0;
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

Location* PrintStmt::Emit(CodeGenerator* codegen)
{
        for (int i = 0; i < args->NumElements(); i++) {
                Expr *exp = args->Nth(i);
                Location* loc = exp->Emit(codegen);
                if (exp->GetType() == Type::intType)
                        codegen->GenBuiltInCall(PrintInt, loc);
                if (exp->GetType() == Type::stringType)
                        codegen->GenBuiltInCall(PrintString, loc);
                if (exp->GetType() == Type::boolType)
                        codegen->GenBuiltInCall(PrintBool, loc);
        }
        return NULL;
}
