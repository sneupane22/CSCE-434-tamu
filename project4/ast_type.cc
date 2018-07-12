/* File: ast_type.cc
 * -----------------
 * Implementation of type node classes.
 */
#include "ast_type.h"
#include "ast_decl.h"
#include <string.h>

#include "errors.h"
 
/* Class constants
 * ---------------
 * These are public constants for the built-in base types (int, double, etc.)
 * They can be accessed with the syntax Type::intType. This allows you to
 * directly access them and share the built-in types where needed rather that
 * creates lots of copies.
 */

Type *Type::intType      = new Type("int");
Type *Type::doubleType   = new Type("double");
Type *Type::voidType     = new Type("void");
Type *Type::boolType     = new Type("bool");
Type *Type::nullType     = new Type("null");
Type *Type::stringType   = new Type("string");
Type *Type::errorType    = new Type("error"); 
Type *Type::readlineType = new Type("ReadLine");

Type::Type(const char *n) {
        Assert(n);
        typeName = strdup(n);
}

bool Type::IsEquivalentTo(Type *other) {
        return strcmp(typeName, other -> GetName()) == 0;
}

bool Type::IsPrintable()
{
        if (this == intType || this == boolType || this == stringType ||
            this == readlineType)
                return true;
        return false;
}

Type* Type::IsCompatible(Type* other) {
        if (this == readlineType &&
            (other == intType || other == doubleType || other == stringType))
                return other;
        if (other == readlineType &&
            (this == intType || this == doubleType || this == stringType))
                return this;
        if (dynamic_cast <NamedType*> (this) && other == nullType)
                return this;
        if (dynamic_cast <NamedType*> (other) && this == nullType)
                return other;
        if (IsEquivalentTo(other))
                return this;
        return NULL;
}
	
NamedType::NamedType(Identifier *i) : Type(*i->GetLocation()) {
        Assert(i != NULL);
        (id=i)->SetParent(this);
} 

void NamedType::Check() {
        if (!GetDeclForType()) {
                isError = true;
                ReportError::IdentifierNotDeclared(id, LookingForType);
        }
}
Decl *NamedType::GetDeclForType() {
        if (!cachedDecl && !isError) {
                Decl *declForName = FindDecl(id);
                if (declForName && (declForName->IsClassDecl() || declForName->IsInterfaceDecl())) 
                        cachedDecl = declForName;
        }
        return cachedDecl;
}

bool NamedType::IsInterface() {
        Decl *d = GetDeclForType();
        return (d && d->IsInterfaceDecl());
}

bool NamedType::IsClass() {
        Decl *d = GetDeclForType();
        return (d && d->IsClassDecl());
}

bool NamedType::IsEquivalentTo(Type *other) {
        NamedType *ot = dynamic_cast<NamedType*>(other);
        return ot && strcmp(id->GetName(), ot->id->GetName()) == 0;
}

bool NamedType::DoesExtends(NamedType* t, Hashtable <ClassDecl*> *hash)
{
        if (hash == NULL)
                hash = new Hashtable <ClassDecl*>;
        const char* name = t -> GetName();
        ClassDecl* c = dynamic_cast<ClassDecl*> (GetDeclForType());
        if (!c)
                return false;
        if (hash -> Lookup(c -> GetName()))
                return false;
        hash -> Enter (c -> GetName(), c);
        List<NamedType*> *imp = c -> GetImplements();
        for (int i = 0; i < imp -> NumElements(); i++) {
                const char* possible_name = imp -> Nth(i) -> GetName();
                if (strcmp(name, possible_name) == 0)
                        return true;
        }
        NamedType *ext = c -> GetExtends();
        if (!ext)
                return false;
        if (strcmp (ext -> GetName(), name) == 0)
                return true;
        return ext -> DoesExtends(t, hash);
        
}

ArrayType::ArrayType(yyltype loc, Type *et) : Type(loc) {
        Assert(et != NULL);
        (elemType=et)->SetParent(this);
        typeName = strdup((string(elemType -> GetName()) + "[]").c_str());
}

void ArrayType::Check() {
        elemType->Check();
}

bool ArrayType::IsEquivalentTo(Type *other) {
        ArrayType *o = dynamic_cast<ArrayType*>(other);
        return (o && elemType->IsEquivalentTo(o->elemType));
}

