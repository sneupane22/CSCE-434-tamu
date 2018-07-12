/* File: ast_type.h
 * ----------------
 * In our parse tree, Type nodes are used to represent and
 * store type information. The base Type class is used
 * for built-in types, the NamedType for classes and interfaces,
 * and the ArrayType for arrays of other types.  
 *
 * pp3: You will need to extend the Type classes to implement
 * the type system and rules for type equivalency and compatibility.
 */
 
#ifndef _H_ast_type
#define _H_ast_type

#include "ast.h"
#include "list.h"
#include "hashtable.h"
#include "ast_decl.h"
#include <iostream>


class Type : public Node 
{
  protected:
    char *typeName;

  public :
    static Type *intType, *doubleType, *boolType, *voidType,
                *nullType, *stringType, *errorType;

    Type(yyltype loc) : Node(loc) {}
    Type(const char *str);
    
    virtual void PrintToStream(std::ostream& out) { out << typeName; }
    friend std::ostream& operator<<(std::ostream& out, Type *t) { t->PrintToStream(out); return out; }
    virtual bool IsEquivalentTo(Type *other) { return this == other; }
    virtual void Check(Hashtable <Decl*> *global_Scope,
                       Hashtable <Decl*> *previous_Scope,
                       Hashtable <Decl*> *current_Scope) {}
    virtual char* GetName() {return typeName;}
};

class NamedType : public Type 
{
  protected:
    Identifier *id;
    
  public:
    NamedType(Identifier *i);
    
    void PrintToStream(std::ostream& out) { out << id; }
    Identifier* GetIdentifier () { return id; }
    char* GetName() {return id -> GetName();}
    void Check(Hashtable <Decl*> *global_Scope,
               Hashtable <Decl*> *previous_Scope,
               Hashtable <Decl*> *current_Scope);
};

class ArrayType : public Type 
{
  protected:
    Type *elemType;

  public:
    ArrayType(yyltype loc, Type *elemType);
    
    void PrintToStream(std::ostream& out) { out << elemType << "[]"; }
    void Check(Hashtable <Decl*> *global_Scope,
               Hashtable <Decl*> *previous_Scope,
               Hashtable <Decl*> *current_Scope);
    char* GetName() {return elemType -> GetName();}
};

 
#endif
