/* File: ast_stmt.h
 * ----------------
 * The Stmt class and its subclasses are used to represent
 * statements in the parse tree.  For each statment in the
 * language (for, if, return, etc.) there is a corresponding
 * node class for that construct. 
 */


#ifndef _H_ast_stmt
#define _H_ast_stmt

#include "list.h"
#include "ast.h"
#include "codegen.h"

class Decl;
class VarDecl;
class Expr;
  
class Program : public Node
{
    protected:
        List<Decl*> *decls;
     
    public:
        Program(List<Decl*> *declList);
        void Check();
        Location* Emit();
};

class Stmt : public Node
{
    public:
        Stmt() : Node() {}
        Stmt(yyltype loc) : Node(loc) {}
};

class StmtBlock : public Stmt 
{
    protected:
        List<VarDecl*> *decls;
        List<Stmt*> *stmts;
        
    public:
        StmtBlock(List<VarDecl*> *variableDeclarations, List<Stmt*> *statements);
        void Check();
        Location* Emit(CodeGenerator*);
};

  
class ConditionalStmt : public Stmt
{
    protected:
        Expr *test;
        Stmt *body;
        char *OutLabel;
    public:
        ConditionalStmt(Expr *testExpr, Stmt *body);
        void Check();
        char* GetOutLabel() { return OutLabel; }
};

class LoopStmt : public ConditionalStmt 
{
    public:
        LoopStmt(Expr *testExpr, Stmt *body)
                : ConditionalStmt(testExpr, body) {}
};

class ForStmt : public LoopStmt 
{
    protected:
        Expr *init, *step;
  
    public:
        ForStmt(Expr *init, Expr *test, Expr *step, Stmt *body);
        void Check();
        Location* Emit(CodeGenerator*);
};

class WhileStmt : public LoopStmt 
{
    public:
        WhileStmt(Expr *test, Stmt *body) : LoopStmt(test, body) {}
        Location* Emit(CodeGenerator*);
};

class IfStmt : public ConditionalStmt 
{
    protected:
        Stmt *elseBody;
  
    public:
        IfStmt(Expr *test, Stmt *thenBody, Stmt *elseBody);
        Location* Emit(CodeGenerator*);
        void Check();
};

class BreakStmt : public Stmt 
{
    public:
        BreakStmt(yyltype loc) : Stmt(loc) {}
        Location* Emit(CodeGenerator*);
        void Check();
};

class ReturnStmt : public Stmt  
{
    protected:
        Expr *expr;
  
    public:
        ReturnStmt(yyltype loc, Expr *expr);
        void Check();
        Location* Emit(CodeGenerator*);
};

class PrintStmt : public Stmt
{
    protected:
        List<Expr*> *args;
    
    public:
        PrintStmt(List<Expr*> *arguments);
        void Check();
        Location* Emit(CodeGenerator*);
};

#endif
