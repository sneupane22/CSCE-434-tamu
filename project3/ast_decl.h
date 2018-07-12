/* File: ast_decl.h
 * ----------------
 * In our parse tree, Decl nodes are used to represent and
 * manage declarations. There are 4 subclasses of the base class,
 * specialized for declarations of variables, functions, classes,
 * and interfaces.
 *
 * pp3: You will need to extend the Decl classes to implement 
 * semantic processing including detection of declaration conflicts 
 * and managing scoping issues.
 */

#ifndef _H_ast_decl
#define _H_ast_decl

#include "ast.h"
#include "list.h"
#include "hashtable.h"

class Type;
class NamedType;
class Identifier;
class Stmt;

class Decl : public Node 
{
protected:
    Identifier *id;
    
public:
    Decl(Identifier *name);
    char* GetName () const {return id->GetName (); } 
    friend std::ostream& operator<<(std::ostream& out, Decl *d) { return out << d->id; }
    Identifier* GetIdentifier() {return id; }
    virtual void Check(Hashtable <Decl*> *global_Scope,
                       Hashtable <Decl*> *previous_Scope,
                       Hashtable <Decl*> *current_Scope) {}
};

class VarDecl : public Decl 
{
protected:
    Type *type;
    
public:
    VarDecl(Identifier *name, Type *type);
    Type* GetType() {return type;}
    void Check(Hashtable <Decl*> *global_Scope,
               Hashtable <Decl*> *previous_Scope,
               Hashtable <Decl*> *current_Scope);
};

class ClassDecl : public Decl 
{
protected:
    List<Decl*> *members;
    NamedType *extends;
    List<NamedType*> *implements;
    Hashtable <Decl*> *Scope;
public:
    ClassDecl(Identifier *name, NamedType *extends, 
              List<NamedType*> *implements, List<Decl*> *members);
    void Check(Hashtable <Decl*> *global_Scope,
               Hashtable <Decl*> *previous_Scope,
               Hashtable<Decl*> *current_Scope);
    Hashtable <Decl*>* GetScope () {return Scope; }
};

class InterfaceDecl : public Decl 
{
protected:
    List<Decl*> *members;
    Hashtable <Decl*> *Scope;
public:
    List<Decl*>* GetMembers () { return members; }
    InterfaceDecl(Identifier *name, List<Decl*> *members);
    void Check(Hashtable <Decl*> *global_Scope,
               Hashtable <Decl*> *previous_Scope,
               Hashtable <Decl*> *current_Scope);
    Hashtable <Decl*>* GetScope() {return Scope; }
};

class FnDecl : public Decl 
{
protected:
    List<VarDecl*> *formals;
    Type *returnType;
    Stmt *body;
    Hashtable<Decl*> *Scope;
    
public:
    FnDecl(Identifier *name, Type *returnType, List<VarDecl*> *formals);
    void SetFunctionBody(Stmt *b);
    Type* GetType() {return returnType; }
    List<VarDecl*> * GetFormals () {return formals; }
    void Check(Hashtable <Decl*> *global_Scope,
               Hashtable <Decl*> *previous_Scope,
               Hashtable <Decl*> *current_Scope);
    bool IsEquivalentTo (FnDecl*);
};

#endif
