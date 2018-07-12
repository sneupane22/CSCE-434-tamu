/* File: ast_decl.cc
 * -----------------
 * Implementation of Decl node classes.
 */
#include "ast_decl.h"
#include "ast_type.h"
#include "ast_stmt.h"
#include "errors.h"
#include "hashtable.h"
         
Decl::Decl(Identifier *n) : Node(*n->GetLocation()) {
    Assert(n != NULL);
    (id=n)->SetParent(this); 
}

VarDecl::VarDecl(Identifier *n, Type *t) : Decl(n) {
    Assert(n != NULL && t != NULL);
    (type=t)->SetParent(this);
}

void VarDecl::Check(Hashtable <Decl*> *global_Scope,
                    Hashtable <Decl*> *previous_Scope,
                    Hashtable <Decl*> *current_Scope) {
    if (this == NULL)
        return;

    /* (1) We check that the type is defined previously*/
    type -> Check(global_Scope, previous_Scope, current_Scope);

    /* (2) We check that the variable is not declared previously*/
    char* name = this->GetName();
    Decl* p_decl;

    /* if we are in the outside level / global level */
    if (current_Scope == NULL) {
        PROGRAM -> CheckSpecific(name);
        p_decl = global_Scope -> Lookup(name);
        if (p_decl != NULL) {
            ReportError::DeclConflict(this, p_decl);
        }
        else 
            global_Scope -> Enter(name, this);
    }
    
    else { /* otherwise, just check the current scope */
        p_decl = current_Scope -> Lookup(name);
        if (p_decl != NULL)
            ReportError::DeclConflict(this, p_decl);
        else
            current_Scope -> Enter(name, this);
    }
}


ClassDecl::ClassDecl(Identifier *n, NamedType *ex, List<NamedType*> *imp, List<Decl*> *m) : Decl(n) {
    // extends can be NULL, impl & mem may be empty lists but cannot be NULL
    Assert(n != NULL && imp != NULL && m != NULL);     
    extends = ex;
    if (extends) extends->SetParent(this);
    else extends = NULL;
    (implements=imp)->SetParentAll(this);
    (members=m)->SetParentAll(this);
    Scope = new Hashtable<Decl*>;
}

void ClassDecl::Check(Hashtable <Decl*> *global_Scope,
                      Hashtable <Decl*> *previous_Scope,
                      Hashtable <Decl*> *current_Scope) {

    /* Check that the class does not exists */
    char* name = id -> GetName();
    Decl* d_tmp = global_Scope -> Lookup(name);
    NamedType* n_tmp;
    Hashtable <Decl*> *extend_Scope    = new Hashtable <Decl*>;
    Hashtable <Decl*> *implement_Scope = new Hashtable <Decl*>;
    
    if (d_tmp != NULL) {
        ReportError::DeclConflict(this, d_tmp);
    }
    else {
        global_Scope -> Enter(name, this);
    }

    /* make sure that extends exists */
    
    if (extends != NULL) {
        name = extends -> GetName();
        PROGRAM -> CheckSpecific(name);
        d_tmp = global_Scope -> Lookup(name);
        ClassDecl* c_tmp = dynamic_cast<ClassDecl*> (d_tmp);
        
        if (d_tmp == NULL || c_tmp == NULL) {
            ReportError::IdentifierNotDeclared(extends -> GetIdentifier(), LookingForClass);
        }
        else {
            extend_Scope -> Combine(c_tmp -> GetScope());
            Scope -> Combine(c_tmp -> GetScope());
        }
    }

    /* make sure that interfaces exist */
    
    for (int i = 0; i < implements -> NumElements(); i++) {
        n_tmp = implements -> Nth(i);
        name  = n_tmp -> GetName();
        PROGRAM -> CheckSpecific(name);
        d_tmp = global_Scope -> Lookup(name);
        InterfaceDecl* i_tmp = dynamic_cast <InterfaceDecl*> (d_tmp);
        if (d_tmp == NULL || i_tmp == NULL) {
            ReportError::IdentifierNotDeclared(n_tmp -> GetIdentifier(), LookingForInterface);
        }
        else {
            implement_Scope -> Combine (i_tmp -> GetScope());
        }
    }
    
    /* Check that all variables are valid */

    for (int i = 0; i < members -> NumElements(); i++) {
        name = members -> Nth(i) -> GetName();
        Decl* member_tmp = members -> Nth(i);
        VarDecl* v_tmp = dynamic_cast <VarDecl*> (member_tmp);
        if (v_tmp != NULL) {
            if (extends != NULL){
                d_tmp = extend_Scope -> Lookup(name);
                if (d_tmp != NULL) {
                    ReportError::DeclConflict(member_tmp, d_tmp);
                    continue;
                }
            }
            if (Scope -> Lookup(name) != NULL) {
                ReportError::DeclConflict(member_tmp, Scope -> Lookup(name));
                continue;
            }
            v_tmp -> Check(global_Scope, previous_Scope, Scope);
        }
    }

    /* Check for functions now */
    for (int i = 0; i < members -> NumElements(); i++) {
        name = members -> Nth(i) -> GetName();
        Decl* member_tmp = members -> Nth(i);
        FnDecl* f_tmp =  dynamic_cast <FnDecl*> (member_tmp);
        FnDecl* extend_f;
        if (f_tmp != NULL) {
            if (extends != NULL) {
                d_tmp = extend_Scope -> Lookup(name);
                if (d_tmp != NULL) {
                    extend_f = dynamic_cast <FnDecl*> (d_tmp);
                    if ((extend_f != NULL) && (extend_f -> IsEquivalentTo(f_tmp) == 0)){
                        ReportError::OverrideMismatch(member_tmp);
                        continue;
                    }
                    else 
                        Scope -> Remove(name, d_tmp);
                }
            }
            
            member_tmp -> Check(global_Scope, previous_Scope, Scope);
        }
    }

    for (int i = 0; i < implements -> NumElements(); i++) {
        name  =  implements -> Nth(i) -> GetName();
        InterfaceDecl* i_tmp = dynamic_cast <InterfaceDecl*> (global_Scope -> Lookup(name));
        if (i_tmp == NULL)
            continue;
        List <Decl*> *m_tmp = i_tmp -> GetMembers();
        for (int j = 0; j < m_tmp -> NumElements(); j++) {
            FnDecl* f_tmp = dynamic_cast <FnDecl*> (m_tmp -> Nth(j));
            if (f_tmp != NULL) {
                FnDecl* f = dynamic_cast <FnDecl*> (Scope -> Lookup(f_tmp -> GetName()));
                if (f == NULL) {
                    ReportError::InterfaceNotImplemented(this, implements -> Nth(i));
                    continue;
                }
                if (f_tmp -> IsEquivalentTo(f) != 1) {
                    ReportError::OverrideMismatch(f);
                    continue;
                }
            }
        }
    }
}


InterfaceDecl::InterfaceDecl(Identifier *n, List<Decl*> *m) : Decl(n) {
    Assert(n != NULL && m != NULL);
    (members=m)->SetParentAll(this);
    Scope = new Hashtable <Decl*>;
}

void InterfaceDecl::Check(Hashtable <Decl*> *global_Scope,
                          Hashtable <Decl*> *previous_Scope,
                          Hashtable <Decl*> *current_Scope) {
    char* name = this -> GetName();
    Decl* d_tmp = global_Scope -> Lookup(name);
    if (d_tmp != NULL) {
        ReportError::DeclConflict(this, d_tmp);
        return;
    }
    
    global_Scope -> Enter(name, this);
    for (int i = 0; i < members -> NumElements(); i++) {
        members -> Nth(i) -> Check(global_Scope, previous_Scope, Scope);
    }
}
	
FnDecl::FnDecl(Identifier *n, Type *r, List<VarDecl*> *d) : Decl(n) {
    Assert(n != NULL && r!= NULL && d != NULL);
    (returnType=r)->SetParent(this);
    (formals=d)->SetParentAll(this);
    body = NULL;
    Scope = new Hashtable <Decl*>;
}

void FnDecl::SetFunctionBody(Stmt *b) { 
    (body=b)->SetParent(this);
}

void FnDecl::Check(Hashtable <Decl*> *global_Scope,
                   Hashtable <Decl*> *previous_Scope,
                   Hashtable <Decl*> *current_Scope) {

    Hashtable <Decl*> *p_Scope = new Hashtable <Decl*>;
    p_Scope -> Combine(previous_Scope);
    p_Scope -> Combine(current_Scope);

    char* name = this -> GetName();
    Decl* p_tmp;
    
    /* if i am in a class. we check that we don't have overlapped functions*/
    if (current_Scope != NULL) {
        p_tmp = current_Scope -> Lookup(name);
        if (p_tmp != NULL)
            ReportError::DeclConflict(this, p_tmp);
        else {
            current_Scope -> Enter(name, this);
        }
    }
    else {
        p_tmp = global_Scope -> Lookup(name);
        if (p_tmp != NULL)
            ReportError::DeclConflict(this, p_tmp);
        else
            global_Scope -> Enter(name, this);
    }
        
    /* Add formals to the scope. They cannot contradict a previous declaration */
    for (int i = 0; i < formals -> NumElements(); i++) {
        formals -> Nth(i) -> Check(global_Scope, p_Scope, Scope);
    }


    if (body != NULL)
        body -> Check(global_Scope, p_Scope, Scope);
    
}

bool FnDecl::IsEquivalentTo (FnDecl* f) {
    if (strcmp(this -> GetType() -> GetName() ,
               f -> GetType() -> GetName()) != 0)
        return false;
    if (this -> GetFormals() -> NumElements() != f -> GetFormals() -> NumElements())
      return false;
    for (int i = 0; i < this -> GetFormals() -> NumElements(); i++) {
        VarDecl* v1 = this -> GetFormals() -> Nth(i);
        VarDecl* v2 =    f -> GetFormals() -> Nth(i);
        char* n1 = v1 -> GetType() -> GetName();
        char* n2 = v2 -> GetType() -> GetName();
        if (strcmp(n1, n2) != 0) 
          return false;
    }
    return true;
}
