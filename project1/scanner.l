/* File:  scanner.l
 * ----------------
 * Lex inupt file to generate the scanner for the compiler.
 */

%{

/* The text within this first region delimited by %{ and %} is assumed to
 * be C/C++ code and will be copied verbatim to the lex.yy.c file ahead
 * of the definitions of the yylex() function. Add other header file inclusions
 * or C++ variable declarations/prototypes that are needed by your code here.
 */

#include <string.h>
#include <iostream>
#include <sstream>
#include "scanner.h"
#include "utility.h" // for PrintDebug()
#include "errors.h"
using namespace std;

/* Global variable: yylval
 * -----------------------
 * This global variable is how we get attribute information about the token
 * just scanned to the client. The scanner sets the global variable
 * appropriately and since it's global the client can just read it.  In the
 * future, this variable will be declared for us in the y.tab.c file
 * produced by Yacc, but for now, we declare it manually.
 */
YYSTYPE yylval;  // manually declared for pp1, later Yacc provides

/* Global variable: yylloc
 * -----------------------
 * This global variable is how we get position information about the token
 * just scanned to the client. (Operates similarly to yylval above)
 */
struct yyltype yylloc; // manually dclared for pp1, later Yacc provides

/* Macro: YY_USER_ACTION 
 * ---------------------
 * This flex built-in macro can be defined to provide an action which is
 * always executed prior to any matched rule's action. Basically, it is
 * a way of having a piece of code common to all actions factored out to
 * this routine.  We already defined it for you and left the empty
 * function DoBeforeEachAction ready for your use as needed. It will
 * be called once for each pattern scanned from the file, before
 * executing its action.
 */
static void DoBeforeEachAction(); 
#define YY_USER_ACTION DoBeforeEachAction();

int nline = 1, ncol = 1;
string s;
%}

 /* The section before the first %% is the Definitions section of the lex
  * input file. Here is where you set options for the scanner, define lex
  * states, and can set up definitions to give names to regular expressions
  * as a simple substitution mechanism that allows for more readable
  * entries in the Rules section later. 
  */

digit [0-9]
letter [a-zA-Z]
quotation "\""

normalnumber     [0-9]+
hexnumber        ("0")([xX])({digit}|[a-f]|[A-F])+
intconstant      ({normalnumber}|{hexnumber})
float            {normalnumber}"."{digit}*
scientific       {float}("E")("+"|"-")?{normalnumber}
string           ("\"")([^\"\n])*("\"")
invalidstring    ("\"")([^\"\n])*$
identifier       {letter}([a-zA-Z0-9_])*
define           "#define"(.)*$
unmatcheddefine  "#"{letter}+

%x STRING

%%             /* BEGIN RULES SECTION */
 /* All patterns and actions should be placed between the start and stop
  * %% markers which delimit the Rules section. 
  */

" "       {ncol++;}
\n        {nline++; ncol = 1;}

"."  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'.'"); ncol = ncol + yyleng;}
"+"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'+'"); ncol = ncol + yyleng;}
"-"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'-'"); ncol = ncol + yyleng;}
"*"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'*'"); ncol = ncol + yyleng;}
"/"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'/'"); ncol = ncol + yyleng;}
"("  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'('"); ncol = ncol + yyleng;}
")"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "')'"); ncol = ncol + yyleng;}
"%"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'%'"); ncol = ncol + yyleng;}
"<"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'<'"); ncol = ncol + yyleng;}
">"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'>'"); ncol = ncol + yyleng;}
"<=" {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_LessEqual"); ncol = ncol + yyleng;}
">=" {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_GreaterEqual"); ncol = ncol + yyleng;}
"==" {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Equal"); ncol = ncol + yyleng;}
"="  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'='"); ncol = ncol + yyleng;}
"!=" {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_NotEqual"); ncol = ncol + yyleng;}
"&&" {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_And"); ncol = ncol + yyleng;}
"||" {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Or"); ncol = ncol + yyleng;}
"!"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'!'"); ncol = ncol + yyleng;}
";"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "';'"); ncol = ncol + yyleng;}
","  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "','"); ncol = ncol + yyleng;}
"["  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'['"); ncol = ncol + yyleng;}
"]"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "']'"); ncol = ncol + yyleng;}
"{"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'{'"); ncol = ncol + yyleng;}
"}"  {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "'}'"); ncol = ncol + yyleng;}

{quotation} { s = "\""; BEGIN(STRING); }
<STRING>{quotation} { s += string(yytext);
               char t[1024];
               strcpy(t, s.c_str());
               printf("%-12s line %d cols %d-%d is %s (value = %s)\n", t, nline, ncol, ncol+s.length()-1, "T_StringConstant", t);
               ncol += s.length();
               BEGIN(INITIAL);
}
<STRING>.   { s += string(yytext);}
<STRING>\n  { printf("\n*** Error line %d.\n", nline);
              cout << "*** Unterminated string constant: " << s <<"\n\n", s;
              nline++;
              BEGIN(INITIAL);}

{normalnumber}  {printf("%-12s line %d cols %d-%d is %s (value = %d)\n",
                                         yytext, nline, ncol, ncol+yyleng-1, "T_IntConstant", atoi(yytext));
                  ncol = ncol + yyleng;}
{hexnumber}     {int i = 0;
                 sscanf(yytext, "%x", &i);
                 printf("%-12s line %d cols %d-%d is %s (value = %d)\n",
                        yytext, nline, ncol, ncol+yyleng-1, "T_IntConstant", i);
                 ncol = ncol + yyleng;}
{float}         {istringstream os(yytext);
                 double d;
                 os >> d;
                 printf("%-12s line %d cols %d-%d is %s (value = %.10g)\n",
                        yytext, nline, ncol, ncol+yyleng-1, "T_DoubleConstant", d);
                 ncol = ncol + yyleng;}
{scientific}    {istringstream os(yytext);
                 double d;
                 os >> d;
                 printf("%-12s line %d cols %d-%d is %s (value = %.10g)\n",
                        yytext, nline, ncol, ncol+yyleng-1, "T_DoubleConstant", d);
                 ncol = ncol + yyleng;}

"true"         {printf("%-12s line %d cols %d-%d is %s (value = true)\n", yytext, nline, ncol, ncol+yyleng-1, "T_BoolConstant"); ncol = ncol + yyleng;}
"false"        {printf("%-12s line %d cols %d-%d is %s (value = false)\n", yytext, nline, ncol, ncol+yyleng-1, "T_BoolConstant"); ncol = ncol + yyleng;} 
"int"          {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Int"); ncol = ncol + yyleng;}
"double"       {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Double"); ncol = ncol + yyleng;}
"void"         {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Void"); ncol = ncol + yyleng;}
"bool"         {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_bool"); ncol = ncol + yyleng;}
"string"       {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_String"); ncol = ncol + yyleng;}
"class"        {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Class"); ncol = ncol + yyleng;}
"interface"    {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Interface"); ncol = ncol + yyleng;}
"null"         {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Null"); ncol = ncol + yyleng;}
"this"         {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_This"); ncol = ncol + yyleng;}
"extends"      {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Extends"); ncol = ncol + yyleng;}
"implements"   {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Implements"); ncol = ncol + yyleng;}
"for"          {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_For"); ncol = ncol + yyleng;}
"while"        {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_While"); ncol = ncol + yyleng;}
"if"           {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_If"); ncol = ncol + yyleng;}
"else"         {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Else"); ncol = ncol + yyleng;}
"return"       {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Return"); ncol = ncol + yyleng;}
"break"        {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_Break"); ncol = ncol + yyleng;}
"New"          {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_New"); ncol = ncol + yyleng;}
"NewArray"     {printf("%-12s line %d cols %d-%d is %s \n", yytext, nline, ncol, ncol+yyleng-1, "T_NewArray"); ncol = ncol + yyleng;}

{identifier} {if (yyleng > 31) {
                printf("\n*** Error line %d.\n", nline);
                printf("*** Identifier too long: \"%s\"\n\n", yytext);
                printf("%-12s line %d cols %d-%d is %s (truncated to %.31s)\n",
                       yytext, nline, ncol, ncol+yyleng-1, "T_Identifier", yytext);
                ncol = ncol + yyleng;
              }
              else {
                printf("%-12s line %d cols %d-%d is %s \n",
                       yytext, nline, ncol, ncol+yyleng-1,"T_Identifier");
                ncol = ncol + yyleng;
              }}

{define} {printf("\n*** Error line %d.\n", nline);
                            printf("*** Invalid # directive\n\n");}

{unmatcheddefine} {printf("\n*** Error line %d.\n", nline);
                   printf("*** Invalid # directive\n\n");}

                            
. {printf("\n*** Error line %d.\n", nline);
   printf("*** Unrecognized char: '%s'\n\n", yytext);
   ncol = ncol + yyleng;}

%%
/* The closing %% above marks the end of the Rules section and the beginning
 * of the User Subroutines section. All text from here to the end of the
 * file is copied verbatim to the end of the generated lex.yy.c file.
 * This section is where you put definitions of helper functions.
 */


/* Function: InitScanner
 * ---------------------
 * This function will be called before any calls to yylex().  It is designed
 * to give you an opportunity to do anything that must be done to initialize
 * the scanner (set global variables, configure starting state, etc.). One
 * thing it already does for you is assign the value of the global variable
 * yy_flex_debug that controls whether flex prints debugging information
 * about each token and what rule was matched. If set to false, no information
 * is printed. Setting it to true will give you a running trail that might
 * be helpful when debugging your scanner. Please be sure the variable is
 * set to false when submitting your final version.
 */
void InitScanner()
{
    PrintDebug("lex", "Initializing scanner");
    yy_flex_debug = false;
}


/* Function: DoBeforeEachAction()
 * ------------------------------
 * This function is installed as the YY_USER_ACTION. This is a place
 * to group code common to all actions.
 */
static void DoBeforeEachAction()
{
}
