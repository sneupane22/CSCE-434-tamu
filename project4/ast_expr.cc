/* File: ast_expr.cc
 * -----------------
 * Implementation of expression node classes.
 */
#include "ast_expr.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "errors.h"
#include "ast_type.h"
#include "utility.h"
#include <string>
using namespace std;

Expr::Expr(yyltype loc) : Stmt(loc) {}

bool Expr::GetError() {
        return (type == Type::errorType);
}

IntConstant::IntConstant(yyltype loc, int val) : Expr(loc) {
        value = val;
        (type = Type::intType) -> SetParent(this);
}

DoubleConstant::DoubleConstant(yyltype loc, double val) : Expr(loc) {
        value = val;
        (type = Type::doubleType) -> SetParent(this);
}

BoolConstant::BoolConstant(yyltype loc, bool val) : Expr(loc) {
        value = val;
        (type = Type::boolType) -> SetParent(this);
}

StringConstant::StringConstant(yyltype loc, const char *val) : Expr(loc) {
        Assert(val != NULL);
        value = strdup(val);
        (type = Type::stringType) -> SetParent(this);
}

NullConstant::NullConstant(yyltype loc) : Expr(loc) {
        (type = Type::nullType) -> SetParent(this);
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

bool CompoundExpr::SetError() {
        bool e = 0;
        if (left)
                e = left -> GetError();
        if (right)
                e = e || right -> GetError();
        return e;
}

void ArithmeticExpr::Check() {
        if (left)
                left -> Check();
        right -> Check();
        if (SetError()) {
                type = Type::errorType;
                return;
        }
        if (left) {
                if (strcmp(op->str(), "%") == 0) {
                        if (left -> GetType() != Type::intType || right -> GetType() != Type::intType) {
                                ReportError::IncompatibleOperands(op,
                                                                  left -> GetType(),
                                                                  right -> GetType());
                                type = Type::errorType;
                        }
                        type = Type::intType;
                        return;
                }
                Type* eq = left -> GetType() ->  IsCompatible(right -> GetType());
                if (!left -> IsNumerical() || !right -> IsNumerical() || !eq ) {
                        ReportError::IncompatibleOperands(op,
                                                          left -> GetType(),
                                                          right -> GetType());
                        type = Type::errorType;
                }
                else
                        type = eq;
                return;
        }
        if (!right -> IsNumerical()) {
                ReportError::IncompatibleOperand(op, right -> GetType());
                type = Type::errorType;
                return ;
        }
        type = right -> GetType();
}

void RelationalExpr::Check() {
        type = Type::boolType;
        left -> Check();
        right -> Check();
        if (SetError())
                return;
        Type* eq = left -> GetType() ->  IsCompatible(right -> GetType());
        if (!left -> IsNumerical() || !right -> IsNumerical() || !eq)
                ReportError::IncompatibleOperands(op, left -> GetType() ,
                                                  right -> GetType());
                return ;
}

void EqualityExpr::Check() {
        type = Type::boolType;
        left -> Check();
        right -> Check();
        if (SetError())
                return;
        Type* eq = left -> GetType() -> IsCompatible(right -> GetType());
        NamedType* t1 = dynamic_cast<NamedType*> (left -> GetType());
        NamedType* t2 = dynamic_cast<NamedType*> (right -> GetType());
        bool ext = 0;
        if (t1 && t2)
                ext = (t1 -> DoesExtends(t2, NULL) || t2 -> DoesExtends(t1, NULL));
        if (!eq && !ext) 
                ReportError::IncompatibleOperands(op, left -> GetType(), right -> GetType());
}

void LogicalExpr::Check() {
        type = Type::boolType;
        right -> Check();
        if (left) {
                left -> Check();
                if (SetError())
                        return;
                if ( left -> GetType() != Type::boolType || right -> GetType() != Type::boolType)
                        ReportError::IncompatibleOperands(op, left -> GetType(), right -> GetType());
                return;
        }
        if (SetError())
                return;
        if (right -> GetType() != Type::boolType)
                ReportError::IncompatibleOperand(op, right -> GetType());
}

void AssignExpr::Check() {
        left -> Check();
        right -> Check();
        if (SetError()) {
                type = Type::errorType;
                return;
        }
        Type* eq = left -> GetType() -> IsCompatible(right -> GetType());
        NamedType* t1 = dynamic_cast<NamedType*> (left -> GetType());
        NamedType* t2 = dynamic_cast<NamedType*> (right -> GetType());
        bool ext = 0;
        if (t1 && t2)
                ext = (t1 -> DoesExtends(t2) || t2 -> DoesExtends(t1));
        if (!eq && !ext) {
                ReportError::IncompatibleOperands (op, left -> GetType(), right -> GetType());
                type = Type::errorType;
                return;
        }
        type = eq;
}

This::This(yyltype loc) : Expr(loc) {}

void This::Check() {
        ClassDecl* def = GetClass();
        if (!def) {
                ReportError::ThisOutsideClassScope(this);
                type = Type::errorType;
                return;
        }
        type = def -> GetType();
}
  
ArrayAccess::ArrayAccess(yyltype loc, Expr *b, Expr *s) : LValue(loc) {
        (base=b)->SetParent(this); 
        (subscript=s)->SetParent(this);
}

void ArrayAccess::Check() {
        base -> Check();
        subscript -> Check();
        if (base -> GetError() || subscript -> GetError()) {
                type = Type::errorType;
                return;
        }
        if (base == NULL) {
                type = Type::errorType;
                return;
        }
        if (subscript -> GetType() != Type::intType) {
                type = Type::errorType;
                ReportError::SubscriptNotInteger(subscript);
                return ;
        }
        ArrayType* a_tmp = dynamic_cast <ArrayType*> (base -> GetType());
        if (!a_tmp) {
                type = Type::errorType;
                ReportError::BracketsOnNonArray(base);
                return ;
        }
        (type = a_tmp -> GetCoreType() ) -> SetParent(this);
}
     
FieldAccess::FieldAccess(Expr *b, Identifier *f) 
        : LValue(b? Join(b->GetLocation(), f->GetLocation()) : *f->GetLocation()) {
        Assert(f != NULL); // b can be be NULL (just means no explicit base)
        base = b; 
        if (base) base->SetParent(this); 
        (field=f)->SetParent(this);
        type = NULL;
}

void FieldAccess::Check()
{
        if (!base) {
                Decl *decl = this -> FindDecl(field);
                VarDecl* var = dynamic_cast <VarDecl*> (decl);
                if (var == NULL) {
                        ReportError::IdentifierNotDeclared
                                (field, LookingForVariable);
                        type = Type::errorType;
                }
                else 
                        type = var -> GetDeclaredType();
                return;
        }
        base -> Check();
        if (base -> GetError()) {
                type = Type::errorType;
                return;
        }
        NamedType* t_tmp = dynamic_cast <NamedType*> (base -> GetType());
        if (!t_tmp) {
                ReportError::FieldNotFoundInBase(field, base -> GetType());
                type = Type::errorType;
                return ;
        }
        ClassDecl* c_tmp = dynamic_cast <ClassDecl*> (t_tmp -> GetDeclForType());
        if (!c_tmp) {
                ReportError::FieldNotFoundInBase(field, base -> GetType());
                type = Type::errorType;
                return ;
        }
        ClassDecl* inside_class = this -> GetClass();
        VarDecl*   v_tmp = dynamic_cast <VarDecl*> (c_tmp -> GetDecl(field));
        if ((!inside_class || inside_class != c_tmp) && v_tmp) {
                ReportError::InaccessibleField(field, t_tmp);
                type = Type::errorType;
                return ;
        }
        if (!v_tmp) {
                ReportError::FieldNotFoundInBase(field, base -> GetType());
                type = Type::errorType;
                return ;
        }
        type = v_tmp -> GetDeclaredType();
}

Call::Call(yyltype loc, Expr *b, Identifier *f, List<Expr*> *a) : Expr(loc)  {
        Assert(f != NULL && a != NULL); // b can be be NULL (just means no explicit base)
        base = b;
        if (base) base->SetParent(this);
        (field=f)->SetParent(this);
        (actuals=a)->SetParentAll(this);
}

void Call::Check()
{
        bool bad_variables = 0;
        for (int i = 0; i < actuals -> NumElements(); i++) {
                actuals -> Nth(i) -> Check();
                bad_variables = bad_variables || actuals -> Nth(i) -> GetError();
        }
        if (!base) {
                FnDecl* f_tmp = dynamic_cast <FnDecl*>
                        (this -> FindDecl(field));
                if (!f_tmp) {
                        type = Type::errorType;
                        ReportError::IdentifierNotDeclared(field,
                                                           LookingForFunction);
                        return;
                }
                if (bad_variables) {
                        type = Type::errorType;
                        return;
                }
                if (!MatchFunction(f_tmp)) {
                        type = Type::errorType;
                        return;
                }
                type = f_tmp -> GetReturnType();
                return;
        }
        base -> Check();
        if (base -> GetError()) {
                type = Type::errorType;
                return;
        }
        if (strcmp("length", field->GetName()) == 0) {
                if (dynamic_cast <ArrayType*> (base -> GetType())) {
                        type = Type::intType;
                        return ;
                }
        }
        ClassDecl* c_tmp = NULL;
        FnDecl* f_tmp = NULL;
        NamedType* t_tmp = dynamic_cast <NamedType*> (base -> GetType());
        if (t_tmp)
                c_tmp = dynamic_cast <ClassDecl*> (t_tmp -> GetDeclForType());
        else {
                ReportError::FieldNotFoundInBase(field, base -> GetType());
                type = Type::errorType;
                return ;
        }
        if (c_tmp)
                f_tmp = dynamic_cast <FnDecl*> (c_tmp -> GetDecl(field));
        else {
                type = Type::errorType;
                return ;
        }
        if (!f_tmp) {
                ReportError::FieldNotFoundInBase(field, base -> GetType());
                type = Type::errorType;
                return ;
        }
        if (bad_variables) {
                type = Type::errorType;
                return ;
        }
        if (!MatchFunction(f_tmp)){
                type = Type::errorType;
                return ;
        }
        type = f_tmp -> GetReturnType();
}

bool Call::MatchFunction(FnDecl* f) {
        bool match = 1;
        List<VarDecl*> *formals = f -> GetFormals();
        if (formals -> NumElements() != actuals -> NumElements()) {
                ReportError::NumArgsMismatch(field,
                                             formals -> NumElements(),
                                             actuals -> NumElements());
                return false;
        }
        for (int i = 0; i < formals -> NumElements(); i++) {
                if (!formals -> Nth(i) -> GetDeclaredType() ->
                    IsCompatible (actuals -> Nth(i) -> GetType())) {
                        type = Type::errorType;
                        ReportError::ArgMismatch
                                (actuals -> Nth(i),
                                 i+1,
                                 actuals -> Nth(i) -> GetType(),
                                 formals -> Nth(i) -> GetDeclaredType());
                        match = 0;
                }
        }
        return match;
}

NewExpr::NewExpr(yyltype loc, NamedType *c) : Expr(loc) { 
        Assert(c != NULL);
        (cType=c)->SetParent(this);
}

void NewExpr::Check()
{
        ClassDecl* c = dynamic_cast <ClassDecl*> (cType -> GetDeclForType());
        if (!c) {
                ReportError::IdentifierNotDeclared(cType -> GetId(),LookingForClass);
                type = Type::errorType;
                return;
        }
        (type = cType) -> SetParent(this);
}

NewArrayExpr::NewArrayExpr(yyltype loc, Expr *sz, Type *et) : Expr(loc) {
        Assert(sz != NULL && et != NULL);
        (size=sz)->SetParent(this); 
        (elemType=et)->SetParent(this);
}

void NewArrayExpr::Check()
{
        if (!size)
                return;
        size -> Check();
        elemType -> Check();
        if ( size -> GetError()) {
                type = Type::errorType;
                return;
        }
                
        if (size -> GetType() != Type::intType) {
                ReportError::NewArraySizeNotInteger(size);
                type = Type::errorType;
                return;
        }
        type = new ArrayType(*location, elemType);
}
        
ReadIntegerExpr::ReadIntegerExpr (yyltype loc) : Expr(loc)
{
        (type = Type::intType) -> SetParent(this);
}

ReadLineExpr::ReadLineExpr (yyltype loc) : Expr(loc)
{
        (type = Type::readlineType) -> SetParent(this);
}
