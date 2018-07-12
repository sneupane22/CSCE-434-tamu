/* File: ast_type.cc
 * -----------------
 * Implementation of type node classes.
 */
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_stmt.h"
#include "errors.h"
#include <string.h>

 
/* Class constants
 * ---------------
 * These are public constants for the built-in base types (int, double, etc.)
 * They can be accessed with the syntax Type::intType. This allows you to
 * directly access them and share the built-in types where needed rather that
 * creates lots of copies.
 */

Type *Type::intType    = new Type("int");
Type *Type::doubleType = new Type("double");
Type *Type::voidType   = new Type("void");
Type *Type::boolType   = new Type("bool");
Type *Type::nullType   = new Type("null");
Type *Type::stringType = new Type("string");
Type *Type::errorType  = new Type("error"); 

Type::Type(const char *n) {
    Assert(n);
    typeName = strdup(n);
}
	
NamedType::NamedType(Identifier *i) : Type(*i->GetLocation()) {
    Assert(i != NULL);
    (id=i)->SetParent(this);
} 

void NamedType::Check(Hashtable <Decl*> *global_Scope,
                      Hashtable <Decl*> *previous_Scope,
                      Hashtable <Decl*> *current_Scope) {
    char* name = id -> GetName();
    PROGRAM -> CheckSpecific(name);
    Decl* d_tmp = global_Scope -> Lookup(name);
    if (d_tmp == NULL) {
        ReportError::IdentifierNotDeclared(id, LookingForType);
        return;
    }   
    ClassDecl* c_tmp = dynamic_cast <ClassDecl*> (d_tmp);
    InterfaceDecl* i_tmp = dynamic_cast <InterfaceDecl*> (d_tmp);
    if (c_tmp == NULL && i_tmp == NULL)
        ReportError::IdentifierNotDeclared(id, LookingForType);
}

ArrayType::ArrayType(yyltype loc, Type *et) : Type(loc) {
    Assert(et != NULL);
    (elemType=et)->SetParent(this);
}

void ArrayType::Check(Hashtable <Decl*> *global_Scope,
                      Hashtable <Decl*> *previous_Scope,
                      Hashtable <Decl*> *current_Scope) {
    elemType -> Check(global_Scope, previous_Scope, current_Scope);
}


