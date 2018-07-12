/* File: parser.y
 * --------------
 * Yacc input file to generate the parser for the compiler.
 *
 * pp2: your job is to write a parser that will construct the parse tree
 *      and if no parse errors were found, print it.  The parser should 
 *      accept the language as described in specification, and as augmented 
 *      in the pp2 handout.
 */

%{
  
  /* Just like lex, the text within this first region delimited by %{ and %}
   * is assumed to be C/C++ code and will be copied verbatim to the y.tab.c
   * file ahead of the definitions of the yyparse() function. Add other header
   * file inclusions or C++ variable declarations/prototypes that are needed
   * by your code here.
   */
#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"
  
  void yyerror(const char *msg); // standard error-handling routine
  
  %}

/* The section before the first %% is the Definitions section of the yacc
 * input file. Here is where you declare tokens and types, add precedence
 * and associativity options, and so on.
 */
 
/* yylval 
 * ------
 * Here we define the type of the yylval global variable that is used by
 * the scanner to store attibute information about the token just scanned
 * and thus communicate that information to the parser. 
 *
 * pp2: You will need to add new fields to this union as you add different 
 *      attributes to your non-terminal symbols.
 */
%union {
  int integerConstant;
  bool boolConstant;
  char *stringConstant;
  double doubleConstant;
  char identifier[MaxIdentLen+1]; // +1 for terminating null
  Decl *decl;
  VarDecl *vardecl;
  FnDecl *fndecl;
  Type * type;
  NamedType  * namedtyped;
  Identifier * name;
  Expr* expr;
  LValue* lvalue;
  Call* call;
  StmtBlock* stmtblock;
  Stmt* stmt;
  ClassDecl* classdecl;
  InterfaceDecl* interfacedecl;
  SwitchStmt* switchstmt;
  CaseStmt* casestmt;
  DefaultStmt* defaultstmt;
  
  List<Decl*> *declList;
  List<Stmt*> *stmtList;
  List<VarDecl*> *varList;
  List<Expr*> *exprList;
  List<NamedType*> *namedtypeList;
  List<CaseStmt*> *casestmtList;
}


/* Tokens
 * ------
 * Here we tell yacc about all the token types that we are using.
 * Yacc will assign unique numbers to these and export the #define
 * in the generated y.tab.h header file.
 */
%token   T_Void T_Bool T_Int T_Double T_String T_Class 
%token   T_LessEqual T_GreaterEqual T_Equal T_NotEqual T_Dims T_Colon
%token   T_And T_Or T_Null T_Extends T_This T_Interface T_Implements
%token   T_While T_For T_If T_Else T_Return T_Break
%token   T_New T_NewArray T_Print T_ReadInteger T_ReadLine
%token   T_Switch T_Case T_Default T_Increment T_Decrement

%token   <identifier> T_Identifier
%token   <stringConstant> T_StringConstant 
%token   <integerConstant> T_IntConstant
%token   <doubleConstant> T_DoubleConstant
%token   <boolConstant> T_BoolConstant


 /* Non-terminal types
  * ------------------
  * In order for yacc to assign/access the correct field of $$, $1, we
  * must to declare which field is appropriate for the non-terminal.
  * As an example, this first type declaration establishes that the DeclList
  * non-terminal uses the field named "declList" in the yylval union. This
  * means that when we are setting $$ for a reduction for DeclList ore reading
  * $n which corresponds to a DeclList nonterminal we are accessing the field
  * of the union named "declList" which is of type List<Decl*>.
  * pp2: You'll need to add many of these of your own.
  */
%type <declList>  DeclList Fields PrototypeList
%type <classdecl> ClassDecl
%type <varList>   VariableDeclList
%type <varList>   Formals
%type <varList>   NonEmptyFormals
%type <exprList>  Actuals
%type <exprList>  NonEmptyActuals NonEmptyExprList
%type <stmtList>  StmtList
%type <stmtList>  NonEmptyStmtList
%type <namedtypeList> ImplementIdList NonEmptyImplementId
%type <casestmtList> CaseStmtList

%type <switchstmt> SwitchStmt
%type <casestmt> CaseStmt
%type <defaultstmt> DefaultStmt
%type <stmtblock> StmtBlock
%type <decl>      Decl Prototype
%type <vardecl>   VariableDecl
%type <vardecl>   Variable
%type <fndecl>    FnDecl;
%type <interfacedecl> InterfaceDecl
%type <type>      Type
%type <namedtyped> NamedType ExtendId ImplementId
%type <name>      Id
%type <expr>      Expr
%type <lvalue>    LValue
%type <call>      Call
%type <expr>      Constant OneExpr
%type <stmt>      Stmt
%type <stmt> IfStmt
%type <stmt> ForStmt
%type <stmt> WhileStmt
%type <stmt> BreakStmt
%type <stmt> ReturnStmt
%type <stmt> PrintStmt
%type <stmt> ElseStmt

%right '='
%left T_Or
%left T_And
%nonassoc T_Equal T_NotEqual
%nonassoc '<' '>' T_LessEqual T_GreaterEqual
%left '+' '-'
%nonassoc T_Increment T_Decrement
%left '*' '/' '%'
%nonassoc UMINUS '!' 
%nonassoc '.' '[' ']'
%left BRACK

%%
 /* Rules
  * -----
  * All productions and actions should be placed between the start and stop
  * %% markers which delimit the Rules section.
	 
  */
Program: DeclList   { 
                      @1; 
                      Program *program = new Program($1);
                      if (ReportError::NumErrors() == 0) 
                        program->Print(0);
                    }
       ;

DeclList: DeclList Decl { ($$=$1)->Append($2); }
        | Decl          { ($$ = new List<Decl*>)->Append($1); }
        ;

Decl: VariableDecl { $$ = $1;}
    | ClassDecl {$$ = $1;}
    | InterfaceDecl {$$ = $1;}
    | FnDecl { $$ = $1;}
    ;

/* Interface */

InterfaceDecl: T_Interface Id '{' PrototypeList '}' {$$ = new InterfaceDecl($2, $4);}
;

PrototypeList: PrototypeList Prototype { ($$ = $1) -> Append($2);}
| Prototype { ($$ = new List<Decl*>) -> Append($1); }
| { $$ = new List<Decl*> ;}
;

Prototype: Type Id '(' Formals ')' ';'   {$$ = new FnDecl($2, $1, $4);;}
      | T_Void Id '(' Formals ')' ';' {$$ = new FnDecl($2, Type::voidType, $4);}
      ;
; 

/* Class */

ClassDecl: T_Class Id ExtendId ImplementIdList '{' Fields '}' {$$ = new ClassDecl($2, $3, $4, $6);}
;

ExtendId: T_Extends NamedType {$$ =  $2;}
| {$$ = NULL;}
;

ImplementIdList: NonEmptyImplementId {$$ =$1;}
| {$$ = new List<NamedType*>; }
;

NonEmptyImplementId: NonEmptyImplementId ',' ImplementId { ($$ = $1) -> Append($3); }
| ImplementId { ($$ = new List<NamedType*>) -> Append($1); }
;

ImplementId: T_Implements NamedType {$$ = $2;}
;

Fields: Fields FnDecl { ($$ = $1) -> Append($2);}
| Fields VariableDecl { ($$ = $1) -> Append($2);}
| {$$ = new List<Decl*>; }
;

/* Function Declaration */

FnDecl: Type Id '(' Formals ')' StmtBlock   {$$ = new FnDecl($2, $1, $4); $$->SetFunctionBody($6);}
      | T_Void Id '(' Formals ')' StmtBlock {$$ = new FnDecl($2, Type::voidType, $4); $$->SetFunctionBody($6);}
      ;

Formals: NonEmptyFormals {$$ = $1;}
       | {$$ = new List<VarDecl*>;}
       ;

NonEmptyFormals: NonEmptyFormals ',' Variable {($$ = $1) -> Append($3);}
               | Variable                     { ($$ = new List<VarDecl*>) -> Append($1);}
;

/* Statements */

StmtBlock: '{' VariableDeclList StmtList '}' {$$ = new StmtBlock($2, $3);}
;

StmtList: NonEmptyStmtList {$$ = $1;}
        |                  {$$ = new List<Stmt*>;}
        ;

NonEmptyStmtList: NonEmptyStmtList Stmt {($$ = $1) -> Append($2);}
                | Stmt                  { ($$ = new List<Stmt*>) -> Append($1);}
;


Stmt: OneExpr ';' {$$ = $1;}
| IfStmt       {$$ = $1;}
| WhileStmt    {$$ = $1;}
| ForStmt      {$$ = $1;}
| SwitchStmt   {$$ = $1;}
| BreakStmt    {$$ = $1;}
| ReturnStmt   {$$ = $1;}
| PrintStmt    {$$ = $1;}
| StmtBlock    {$$ = $1;}
;

IfStmt: T_If '(' Expr ')' Stmt ElseStmt {$$ = new IfStmt($3, $5, $6);}
;

ElseStmt: T_Else Stmt {$$ = $2;}
| {$$ = NULL; }
;

WhileStmt: T_While '(' Expr ')' Stmt {$$ = new WhileStmt($3, $5);}
;

ForStmt: T_For '(' OneExpr ';' Expr ';' OneExpr')' Stmt {$$ = new ForStmt($3, $5, $7, $9);}
;

SwitchStmt: T_Switch '(' Expr ')' '{' CaseStmtList DefaultStmt '}' {$$ = new SwitchStmt($3, $6, $7);}
;

CaseStmtList: CaseStmtList CaseStmt { ($$ = $1) -> Append($2);}
            | CaseStmt              {($$ = new List<CaseStmt*>) -> Append($1);}
;

CaseStmt: T_Case T_IntConstant T_Colon StmtList {$$ = new CaseStmt(new IntConstant(@2, $2), $4);}
;

DefaultStmt: T_Default T_Colon StmtList {$$ = new DefaultStmt($3);}
;

BreakStmt: T_Break ';' {$$ = new BreakStmt(Join(@1, @2));}
;

ReturnStmt: T_Return OneExpr ';' {$$ = new ReturnStmt(Join(@1, @3), $2);}
;

PrintStmt: T_Print '(' NonEmptyExprList ')' ';' {$$ = new PrintStmt($3);}
;
/* Expressions */

NonEmptyExprList: NonEmptyExprList ',' Expr { ($$ = $1) -> Append($3); }
| Expr { ($$ = new List<Expr*>) -> Append($1);}
;

OneExpr: Expr {$$ = $1;}
| {$$ = new EmptyExpr();}
;

Expr: LValue                       {$$ = $1;}
| Constant                         {$$ = $1;}
| Call                             {$$ = $1;}
| T_This                           {$$ = new This(@1);}
|'(' Expr ')' %prec BRACK          {$$ = $2;}
| LValue '=' Expr                  {$$ = new AssignExpr($1, new Operator(@2, "="), $3);}
| Expr '+' Expr                    {$$ = new ArithmeticExpr($1, new Operator(@2, "+"), $3);}
| Expr '-' Expr                    {$$ = new ArithmeticExpr($1, new Operator(@2, "-"), $3);}
| Expr '*' Expr                    {$$ = new ArithmeticExpr($1, new Operator(@2, "*"), $3);}
| Expr '/' Expr                    {$$ = new ArithmeticExpr($1, new Operator(@2, "/"), $3);}
| Expr '%' Expr                    {$$ = new ArithmeticExpr($1, new Operator(@2, "%"), $3);}
| '-' Expr  %prec UMINUS           {$$ = new ArithmeticExpr(new Operator(@1, "-"), $2);}
| Expr T_Increment                 {$$ = new PostfixExpr(new Operator(@2, "++"), $1);}
| Expr T_Decrement                 {$$ = new PostfixExpr(new Operator(@2, "--"), $1);}
| Expr '<' Expr                    {$$ = new RelationalExpr($1, new Operator(@2, "<"), $3);}
| Expr '>' Expr                    {$$ = new RelationalExpr($1, new Operator(@2, ">"), $3);}
| Expr T_LessEqual Expr            {$$ = new RelationalExpr($1, new Operator(@2, "<="), $3);}
| Expr T_GreaterEqual Expr         {$$ = new RelationalExpr($1, new Operator(@2, ">="), $3);}
| Expr T_Equal Expr                {$$ = new EqualityExpr($1, new Operator(@2, "=="), $3);}
| Expr T_NotEqual Expr             {$$ = new EqualityExpr($1, new Operator(@2, "!="), $3);}
| Expr T_And Expr                  {$$ = new LogicalExpr($1, new Operator(@2, "&&"), $3);}
| Expr T_Or Expr                   {$$ = new LogicalExpr($1, new Operator(@2, "||"), $3);}
| '!' Expr                         {$$ = new LogicalExpr(new Operator(@1, "!"), $2);}
| T_ReadInteger '(' ')'            {$$ = new ReadIntegerExpr(Join(@1, @3));}
| T_ReadLine '(' ')'               {$$ = new ReadLineExpr(Join(@1, @1));}
| T_New '(' NamedType ')'          {$$ = new NewExpr(Join(@1,@4), $3);}
| T_NewArray '(' Expr ',' Type ')' {$$ = new NewArrayExpr(Join(@1,@6), $3, $5);}
;

LValue: Id                {$$ = new FieldAccess(NULL, $1);}
      | Expr '.' Id       {$$ = new FieldAccess($1, $3);}
      | Expr '[' Expr ']' {$$ = new ArrayAccess(Join(@1,@4), $1, $3);}
      ;

Call: Id '(' Actuals ')'          {$$ = new Call(Join(@1,@4), NULL, $1, $3);}
    | Expr '.' Id '(' Actuals ')' {$$ = new Call(Join(@1,@6), $1, $3, $5);}
    ;

/* Actuals */
Actuals: NonEmptyActuals {$$ = $1;}
       |                 {$$ = new List<Expr*>;}
       ;

NonEmptyActuals: NonEmptyActuals ',' Expr {($$ = $1) -> Append($3);}
               | Expr                     {($$ = new List<Expr*>) -> Append($1);}
               ;

/* Variables */

VariableDeclList: VariableDeclList VariableDecl { ($$ = $1) -> Append($2);}
                |                               { $$ = new List<VarDecl*>;}
                ;

VariableDecl: Variable ';' { $$ = $1;}
            ;

Variable: Type Id {$$ = new VarDecl($2, $1);}
        ;

/* Types, Identifiers, and Constants */

Type: T_Bool {$$ = Type::boolType;}
    | T_Int { $$ = Type::intType;}
    | T_Double {$$ = Type::doubleType;}
    | T_String {$$ = Type::stringType;}
    | NamedType  {$$ = $1;}
    | Type T_Dims {$$ = new ArrayType(yylloc, $1);}
    ;
NamedType: Id {$$ = new NamedType($1);}
         ;

Id: T_Identifier {$$ = new Identifier(@1, &$1[0]);}
;

Constant: T_StringConstant {$$ = new StringConstant (@1, $1); }
| T_IntConstant    {$$ = new IntConstant (@1, $1);}
| T_DoubleConstant {$$ = new DoubleConstant (@1, $1);}
| T_BoolConstant   {$$ = new BoolConstant (@1, $1);}
| T_Null           {$$ = new NullConstant (@1);}
;

%%

        /* The closing %% above marks the end of the Rules section and the beginning
         * of the User Subroutines section. All text from here to the end of the
         * file is copied verbatim to the end of the generated y.tab.c file.
         * This section is where you put definitions of helper functions.
         */

        /* Function: InitParser
         * --------------------
         * This function will be called before any calls to yyparse().  It is designed
         * to give you an opportunity to do anything that must be done to initialize
         * the parser (set global variables, configure starting state, etc.). One
         * thing it already does for you is assign the value of the global variable
         * yydebug that controls whether yacc prints debugging information about
         * parser actions (shift/reduce) and contents of state stack during parser.
         * If set to false, no information is printed. Setting it to true will give
         * you a running trail that might be helpful when debugging your parser.
         * Please be sure the variable is set to false when submitting your final
         * version.
         */
void InitParser()
{
  PrintDebug("parser", "Initializing parser");
  yydebug = false;
}
