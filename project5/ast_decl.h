/* File: ast_decl.h
 * ----------------
 * In our parse tree, Decl nodes are used to represent and
 g * manage declarations. There are 4 subclasses of the base class,
 * specialized for declarations of variables, functions, classes,
 * and interfaces.
 */

#ifndef _H_ast_decl
#define _H_ast_decl

#include "ast.h"
#include "list.h"
#include "codegen.h"

class Type;
class NamedType;
class Identifier;
class Stmt;
class FnDecl;
class InterfaceDecl;
class VarDecl;

class Decl : public Node 
{
    protected:
        Identifier *id;
  
    public:
        Decl(Identifier *name);
        friend std::ostream& operator<<(std::ostream& out, Decl *d) {
                return out << d->id;
        }
        Identifier *GetId() { return id; }
        const char *GetName() { return id->GetName(); }
        virtual bool ConflictsWithPrevious(Decl *prev);
        virtual bool IsVarDecl() { return false; }
        virtual bool IsClassDecl() { return false; }
        virtual bool IsInterfaceDecl() { return false; }
        virtual bool IsFnDecl() { return false; } 
        virtual bool IsMethodDecl() { return false; }
};

class VarDecl : public Decl 
{
    protected:
        Type *type;
    
    public:
        VarDecl(Identifier *name, Type *type);
        void Check();
        Type *GetDeclaredType() { return type; }
        bool IsVarDecl () {return true;}
};

class ClassDecl : public Decl 
{
    protected:
        List<Decl*> *members;
        NamedType *extends;
        List<NamedType*> *implements;
        NamedType *cType;
        List<InterfaceDecl*> *convImp;

    public:
        ClassDecl(Identifier *name, NamedType *extends, 
                  List<NamedType*> *implements, List<Decl*> *members);
        void Check();
        bool IsClassDecl() { return true; }
        Scope *PrepareScope();
        NamedType* GetType() {return cType;}
        Decl* GetDecl(Identifier*);
        /* Check if the class implements what it says it will implement */
        void ImplementCheck();
        /* Find if there is the given function exists. Return it. Otherwise, 
           Return NULL */
        FnDecl* FunctionIsFound (FnDecl*);
        List<NamedType*>* GetImplements () { return implements; }
        NamedType* GetExtends (){ return extends; }
        Location* Emit(CodeGenerator*);
};

class InterfaceDecl : public Decl 
{
    protected:
        List<Decl*> *members;
    
    public:
        InterfaceDecl(Identifier *name, List<Decl*> *members);
        void Check();
        bool IsInterfaceDecl() { return true; }
        List<Decl*>* GetMembers() {return members;}
        Scope *PrepareScope();
};

class FnDecl : public Decl 
{
    protected:
        List<VarDecl*> *formals;
        Type *returnType;
        Stmt *body;
    
    public:
        FnDecl(Identifier *name, Type *returnType, List<VarDecl*> *formals);
        void SetFunctionBody(Stmt *b);
        void Check();
        bool IsFnDecl() { return true; }
        bool IsMethodDecl();
        bool ConflictsWithPrevious(Decl *prev);
        bool MatchesPrototype(FnDecl *other);
        List<VarDecl*>* GetFormals() { return formals; }
        Type* GetReturnType() {return returnType; }
        const char* GetName() {return id -> GetName();}
        Location* Emit(CodeGenerator*);
};

#endif
