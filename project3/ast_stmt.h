/* File: ast_stmt.h
 * ----------------
 * The Stmt class and its subclasses are used to represent
 * statements in the parse tree.  For each statment in the
 * language (for, if, return, etc.) there is a corresponding
 * node class for that construct. 
 *
 * pp3: You will need to extend the Stmt classes to implement
 * semantic analysis for rules pertaining to statements.
 */


#ifndef _H_ast_stmt
#define _H_ast_stmt

#include "list.h"
#include "ast.h"
#include "hashtable.h"
#include <vector>
using namespace std;

class Decl;
class VarDecl;
class Expr;
  
class Program : public Node
{
  protected:
    List<Decl*> *decls;
    Hashtable <Decl*> *Scope;
    vector <bool> *isVisited;
public:
    Program(List<Decl*> *declList);
    void Check();
    void CheckSpecific(char* d);
};

class Stmt : public Node
{
public:
    Stmt() : Node() {}
    Stmt(yyltype loc) : Node(loc) {}
    virtual void Check(Hashtable <Decl*> *global_Scope,
                       Hashtable <Decl*> *previous_Scope,
                       Hashtable<Decl*> *current_Scope) {}
    virtual ~Stmt(){}
};

class StmtBlock : public Stmt 
{
  protected:
    List<VarDecl*> *decls;
    List<Stmt*> *stmts;
    Hashtable <Decl*> *Scope;
  public:
    StmtBlock(List<VarDecl*> *variableDeclarations, List<Stmt*> *statements);
    void Check(Hashtable <Decl*> *global_Scope,
               Hashtable <Decl*> *previous_Scope,
               Hashtable<Decl*> *current_Scope);
};

  
class ConditionalStmt : public Stmt
{
  protected:
    Expr *test;
    Stmt *body;
    Hashtable <Decl*> *Scope;
  public:
    ConditionalStmt(Expr *testExpr, Stmt *body);
    virtual void Check(Hashtable <Decl*> *global_Scope,
                       Hashtable <Decl*> *previous_Scope,
                       Hashtable <Decl*> *current_Scope);
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
    void Check (Hashtable <Decl*> *global_Scope,
                Hashtable <Decl*> *previous_Scope,
                Hashtable <Decl*> *current_Scope);
};

class WhileStmt : public LoopStmt 
{
  public:
    WhileStmt(Expr *test, Stmt *body) : LoopStmt(test, body) {}
};

class IfStmt : public ConditionalStmt 
{
  protected:
    Stmt *elseBody;
  
  public:
    IfStmt(Expr *test, Stmt *thenBody, Stmt *elseBody);
    void Check (Hashtable <Decl*> *global_Scope,
                Hashtable <Decl*> *previous_Scope,
                Hashtable <Decl*> *current_Scope);
};

class BreakStmt : public Stmt 
{
  public:
    BreakStmt(yyltype loc) : Stmt(loc) {}
};

class ReturnStmt : public Stmt  
{
  protected:
    Expr *expr;
  
  public:
    ReturnStmt(yyltype loc, Expr *expr);
    void Check (Hashtable <Decl*> *global_Scope,
                Hashtable <Decl*> *previous_Scope,
                Hashtable <Decl*> *current_Scope);
};

class PrintStmt : public Stmt
{
  protected:
    List<Expr*> *args;
    
  public:
    PrintStmt(List<Expr*> *arguments);
    void Check (Hashtable <Decl*> *global_Scope,
                Hashtable <Decl*> *previous_Scope,
                Hashtable <Decl*> *current_Scope);
};

extern Program* PROGRAM;

#endif
