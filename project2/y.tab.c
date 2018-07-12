/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 11 "parser.y" /* yacc.c:339  */

  
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
  
  

#line 83 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_Void = 258,
    T_Bool = 259,
    T_Int = 260,
    T_Double = 261,
    T_String = 262,
    T_Class = 263,
    T_LessEqual = 264,
    T_GreaterEqual = 265,
    T_Equal = 266,
    T_NotEqual = 267,
    T_Dims = 268,
    T_Colon = 269,
    T_And = 270,
    T_Or = 271,
    T_Null = 272,
    T_Extends = 273,
    T_This = 274,
    T_Interface = 275,
    T_Implements = 276,
    T_While = 277,
    T_For = 278,
    T_If = 279,
    T_Else = 280,
    T_Return = 281,
    T_Break = 282,
    T_New = 283,
    T_NewArray = 284,
    T_Print = 285,
    T_ReadInteger = 286,
    T_ReadLine = 287,
    T_Switch = 288,
    T_Case = 289,
    T_Default = 290,
    T_Increment = 291,
    T_Decrement = 292,
    T_Identifier = 293,
    T_StringConstant = 294,
    T_IntConstant = 295,
    T_DoubleConstant = 296,
    T_BoolConstant = 297,
    UMINUS = 298,
    BRACK = 299
  };
#endif
/* Tokens.  */
#define T_Void 258
#define T_Bool 259
#define T_Int 260
#define T_Double 261
#define T_String 262
#define T_Class 263
#define T_LessEqual 264
#define T_GreaterEqual 265
#define T_Equal 266
#define T_NotEqual 267
#define T_Dims 268
#define T_Colon 269
#define T_And 270
#define T_Or 271
#define T_Null 272
#define T_Extends 273
#define T_This 274
#define T_Interface 275
#define T_Implements 276
#define T_While 277
#define T_For 278
#define T_If 279
#define T_Else 280
#define T_Return 281
#define T_Break 282
#define T_New 283
#define T_NewArray 284
#define T_Print 285
#define T_ReadInteger 286
#define T_ReadLine 287
#define T_Switch 288
#define T_Case 289
#define T_Default 290
#define T_Increment 291
#define T_Decrement 292
#define T_Identifier 293
#define T_StringConstant 294
#define T_IntConstant 295
#define T_DoubleConstant 296
#define T_BoolConstant 297
#define UMINUS 298
#define BRACK 299

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 41 "parser.y" /* yacc.c:355  */

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

#line 242 "y.tab.c" /* yacc.c:355  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 271 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
             && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  23
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   657

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  63
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  45
/* YYNRULES -- Number of rules.  */
#define YYNRULES  115
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  224

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   299

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    52,     2,     2,     2,    50,     2,     2,
      59,    60,    48,    46,    62,    47,    53,    49,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    61,
      44,    43,    45,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    54,     2,    55,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    57,     2,    58,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    51,    56
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   160,   160,   168,   169,   172,   173,   174,   175,   180,
     183,   184,   185,   188,   189,   195,   198,   199,   202,   203,
     206,   207,   210,   213,   214,   215,   220,   221,   224,   225,
     228,   229,   234,   237,   238,   241,   242,   246,   247,   248,
     249,   250,   251,   252,   253,   254,   257,   260,   261,   264,
     267,   270,   273,   274,   277,   280,   283,   286,   289,   293,
     294,   297,   298,   301,   302,   303,   304,   305,   306,   307,
     308,   309,   310,   311,   312,   313,   314,   315,   316,   317,
     318,   319,   320,   321,   322,   323,   324,   325,   326,   327,
     330,   331,   332,   335,   336,   340,   341,   344,   345,   350,
     351,   354,   357,   362,   363,   364,   365,   366,   367,   369,
     372,   375,   376,   377,   378,   379
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "T_Void", "T_Bool", "T_Int", "T_Double",
  "T_String", "T_Class", "T_LessEqual", "T_GreaterEqual", "T_Equal",
  "T_NotEqual", "T_Dims", "T_Colon", "T_And", "T_Or", "T_Null",
  "T_Extends", "T_This", "T_Interface", "T_Implements", "T_While", "T_For",
  "T_If", "T_Else", "T_Return", "T_Break", "T_New", "T_NewArray",
  "T_Print", "T_ReadInteger", "T_ReadLine", "T_Switch", "T_Case",
  "T_Default", "T_Increment", "T_Decrement", "T_Identifier",
  "T_StringConstant", "T_IntConstant", "T_DoubleConstant",
  "T_BoolConstant", "'='", "'<'", "'>'", "'+'", "'-'", "'*'", "'/'", "'%'",
  "UMINUS", "'!'", "'.'", "'['", "']'", "BRACK", "'{'", "'}'", "'('",
  "')'", "';'", "','", "$accept", "Program", "DeclList", "Decl",
  "InterfaceDecl", "PrototypeList", "Prototype", "ClassDecl", "ExtendId",
  "ImplementIdList", "NonEmptyImplementId", "ImplementId", "Fields",
  "FnDecl", "Formals", "NonEmptyFormals", "StmtBlock", "StmtList",
  "NonEmptyStmtList", "Stmt", "IfStmt", "ElseStmt", "WhileStmt", "ForStmt",
  "SwitchStmt", "CaseStmtList", "CaseStmt", "DefaultStmt", "BreakStmt",
  "ReturnStmt", "PrintStmt", "NonEmptyExprList", "OneExpr", "Expr",
  "LValue", "Call", "Actuals", "NonEmptyActuals", "VariableDeclList",
  "VariableDecl", "Variable", "Type", "NamedType", "Id", "Constant", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,    61,    60,    62,    43,    45,    42,    47,
      37,   298,    33,    46,    91,    93,   299,   123,   125,    40,
      41,    59,    44
};
# endif

#define YYPACT_NINF -132

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-132)))

#define YYTABLE_NINF -110

#define yytable_value_is_error(Yytable_value) \
  (!!((Yytable_value) == (-110)))

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     508,   -26,  -132,  -132,  -132,  -132,   -26,   -26,  -132,    19,
     508,  -132,  -132,  -132,  -132,  -132,   -34,    -4,  -132,  -132,
     -19,    15,   -13,  -132,  -132,  -132,  -132,     1,   117,   -26,
      25,   110,   117,     2,    16,  -132,    -4,  -132,   -26,    32,
      29,  -132,   -26,    18,  -132,    -4,    39,    51,   117,  -132,
    -132,  -132,    25,    60,  -132,  -132,    61,    51,  -132,  -132,
    -132,   131,  -132,   117,   117,  -132,   135,  -132,  -132,  -132,
      66,    67,  -132,  -132,    69,    71,    72,   598,    82,    73,
      74,    85,    88,    90,    91,  -132,  -132,  -132,  -132,   598,
     598,   598,  -132,   102,   525,  -132,  -132,  -132,  -132,  -132,
    -132,  -132,  -132,   109,   380,   128,  -132,  -132,    -8,  -132,
     111,   122,   598,   598,   598,   127,   132,  -132,   -26,   598,
     598,   133,   141,   598,     5,     5,   235,  -132,  -132,  -132,
     598,   598,   598,   598,   598,   598,  -132,  -132,   598,   598,
     598,   598,   598,   598,   598,   -26,   598,   598,   598,  -132,
    -132,   254,   134,   300,  -132,   142,   169,   -47,   380,  -132,
    -132,   319,  -132,   487,   487,   441,   441,   456,   426,   487,
     487,    31,    31,     5,     5,     5,   148,   365,   380,   380,
     149,   146,   566,   598,   566,  -132,   117,   150,   598,   153,
     598,  -132,  -132,   598,  -132,   188,   187,    -5,  -132,   380,
     186,   161,   380,   598,   566,  -132,  -132,   189,    36,  -132,
    -132,   166,  -132,   213,   214,  -132,   172,   566,   525,   525,
    -132,  -132,  -132,  -132
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,   103,   104,   105,   106,     0,     0,   110,     0,
       2,     4,     7,     6,     8,     5,     0,     0,   107,   109,
       0,    17,     0,     1,     3,   101,   108,   102,    29,     0,
      19,    12,    29,     0,    28,    31,     0,    16,     0,     0,
      18,    21,     0,     0,    11,     0,     0,     0,     0,   102,
      22,    25,     0,     0,     9,    10,     0,     0,   100,    27,
      30,     0,    20,    29,    29,    26,    34,    15,    23,    24,
       0,     0,   115,    66,     0,     0,     0,    62,     0,     0,
       0,     0,     0,     0,     0,   111,   112,   113,   114,     0,
       0,     0,    45,     0,    33,    36,    38,    39,    40,    41,
      42,    43,    44,     0,    61,    63,    65,    99,    90,    64,
       0,     0,     0,    62,     0,     0,    90,    56,     0,     0,
       0,     0,     0,     0,    74,    85,     0,    32,    35,    37,
       0,     0,     0,     0,     0,     0,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    96,    14,
      13,     0,     0,     0,    57,     0,     0,     0,    60,    86,
      87,     0,    67,    79,    80,    81,    82,    83,    84,    77,
      78,    69,    70,    71,    72,    73,    91,     0,    68,    98,
       0,    95,    62,     0,    62,    88,     0,     0,     0,     0,
      96,    92,    93,     0,    49,     0,    48,     0,    58,    59,
       0,     0,    97,    62,    62,    46,    89,     0,     0,    53,
      94,     0,    47,     0,     0,    52,     0,    62,    34,    34,
      51,    50,    54,    55
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -132,  -132,  -132,   229,  -132,  -132,   197,  -132,  -132,  -132,
    -132,   191,  -132,   192,   -14,  -132,   -31,  -131,  -132,   -92,
    -132,  -132,  -132,  -132,  -132,  -132,    40,  -132,  -132,  -132,
    -132,  -132,   -74,   -37,  -132,  -132,    62,  -132,  -132,     8,
       9,     4,   -18,     0,  -132
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     9,    10,    11,    12,    43,    44,    13,    30,    39,
      40,    41,    61,    14,    33,    34,    92,    93,    94,    95,
      96,   205,    97,    98,    99,   208,   209,   216,   100,   101,
     102,   157,   103,   104,   105,   106,   180,   181,    66,    15,
      16,    36,    18,   116,   109
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      19,    20,   128,   115,    17,  -109,    21,    22,    26,    26,
      19,    37,     8,   187,    17,   188,    59,    27,    46,    23,
      50,    42,     2,     3,     4,     5,    65,    25,    19,    19,
    -109,    19,    19,    29,     8,    45,    49,    35,    19,   152,
      28,    35,    53,    19,    31,    56,    38,    45,    19,    70,
      71,   148,   124,   125,   126,   206,     8,    60,   145,   146,
      32,    19,    47,    19,    19,    17,   108,   136,   137,    69,
     207,   214,    35,    35,   107,   151,    54,   153,    48,   142,
     143,   144,   156,   158,   145,   146,   161,   222,   223,    51,
     194,    52,   196,   163,   164,   165,   166,   167,   168,    57,
     155,   169,   170,   171,   172,   173,   174,   175,    58,   177,
     178,   179,   212,    42,     2,     3,     4,     5,    19,    63,
      64,     2,     3,     4,     5,   221,   110,   111,   112,   211,
     113,   114,   118,   119,     1,     2,     3,     4,     5,     2,
       3,     4,     5,   117,   120,   176,   195,   121,     8,   122,
     123,   199,    72,   179,    73,     8,   202,    74,    75,    76,
     127,    77,    78,    79,    80,    81,    82,    83,    84,     8,
     129,   147,   149,     8,    85,    86,    87,    88,   130,   131,
     132,   133,    89,   150,   134,   135,    19,    90,   154,    67,
     197,   148,    58,   159,    91,   183,   -62,   130,   131,   132,
     133,   160,   185,   134,   135,   136,   137,   190,   193,   192,
     200,   198,   204,   138,   139,   140,   141,   142,   143,   144,
     207,   210,   145,   146,   136,   137,   217,   218,   219,   213,
     220,   186,   138,   139,   140,   141,   142,   143,   144,    24,
      55,   145,   146,    62,   130,   131,   132,   133,   215,   203,
     134,   135,   201,    68,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   130,   131,   132,   133,     0,     0,   134,
     135,   136,   137,     0,     0,     0,     0,     0,     0,   138,
     139,   140,   141,   142,   143,   144,     0,     0,   145,   146,
     136,   137,     0,     0,     0,   162,     0,     0,   138,   139,
     140,   141,   142,   143,   144,     0,     0,   145,   146,   130,
     131,   132,   133,     0,   182,   134,   135,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   130,   131,
     132,   133,     0,     0,   134,   135,   136,   137,     0,     0,
       0,     0,     0,     0,   138,   139,   140,   141,   142,   143,
     144,     0,     0,   145,   146,   136,   137,     0,     0,     0,
     184,     0,     0,   138,   139,   140,   141,   142,   143,   144,
       0,     0,   145,   146,   130,   131,   132,   133,     0,   189,
     134,   135,     0,     0,     0,     0,     0,     0,     0,   130,
     131,   132,   133,     0,     0,   134,   135,     0,     0,     0,
       0,   136,   137,     0,     0,     0,     0,     0,     0,   138,
     139,   140,   141,   142,   143,   144,   136,   137,   145,   146,
     191,     0,     0,     0,   138,   139,   140,   141,   142,   143,
     144,     0,     0,   145,   146,   130,   131,   132,   133,     0,
       0,   134,     0,     0,     0,     0,     0,     0,     0,     0,
     130,   131,  -110,  -110,     0,     0,     0,     0,     0,     0,
       0,     0,   136,   137,     0,   130,   131,   132,   133,     0,
     138,   139,   140,   141,   142,   143,   144,   136,   137,   145,
     146,     0,     0,     0,     0,   138,   139,   140,   141,   142,
     143,   144,   136,   137,   145,   146,  -110,  -110,     0,     0,
     138,   139,   140,   141,   142,   143,   144,     0,     0,   145,
     146,     1,     2,     3,     4,     5,     6,     0,     0,     0,
       0,     0,     0,   136,   137,     0,     0,     0,     7,     0,
       0,  -110,  -110,   140,   141,   142,   143,   144,     0,     0,
     145,   146,    72,     0,    73,     0,     8,    74,    75,    76,
       0,    77,    78,    79,    80,    81,    82,    83,    84,     0,
       0,     0,     0,     8,    85,    86,    87,    88,     0,     0,
       0,     0,    89,     0,     0,     0,     0,    90,     0,     0,
       0,     0,    58,    72,    91,    73,   -62,     0,    74,    75,
      76,     0,    77,    78,    79,    80,    81,    82,    83,    84,
       0,     0,     0,     0,     8,    85,    86,    87,    88,     0,
       0,     0,     0,    89,     0,    72,     0,    73,    90,     0,
       0,     0,     0,    58,     0,    91,    79,    80,     0,    82,
      83,     0,     0,     0,     0,     0,     8,    85,    86,    87,
      88,     0,     0,     0,     0,    89,     0,     0,     0,     0,
      90,     0,     0,     0,     0,     0,     0,    91
};

static const yytype_int16 yycheck[] =
{
       0,     1,    94,    77,     0,    13,     6,     7,    13,    13,
      10,    29,    38,    60,    10,    62,    47,    17,    32,     0,
      38,     3,     4,     5,     6,     7,    57,    61,    28,    29,
      38,    31,    32,    18,    38,    31,    36,    28,    38,   113,
      59,    32,    42,    43,    57,    45,    21,    43,    48,    63,
      64,    59,    89,    90,    91,    60,    38,    48,    53,    54,
      59,    61,    60,    63,    64,    61,    66,    36,    37,    61,
      34,    35,    63,    64,    66,   112,    58,   114,    62,    48,
      49,    50,   119,   120,    53,    54,   123,   218,   219,    57,
     182,    62,   184,   130,   131,   132,   133,   134,   135,    60,
     118,   138,   139,   140,   141,   142,   143,   144,    57,   146,
     147,   148,   204,     3,     4,     5,     6,     7,   118,    59,
      59,     4,     5,     6,     7,   217,    60,    60,    59,   203,
      59,    59,    59,    59,     3,     4,     5,     6,     7,     4,
       5,     6,     7,    61,    59,   145,   183,    59,    38,    59,
      59,   188,    17,   190,    19,    38,   193,    22,    23,    24,
      58,    26,    27,    28,    29,    30,    31,    32,    33,    38,
      61,    43,    61,    38,    39,    40,    41,    42,     9,    10,
      11,    12,    47,    61,    15,    16,   186,    52,    61,    58,
     186,    59,    57,    60,    59,    61,    61,     9,    10,    11,
      12,    60,    60,    15,    16,    36,    37,    59,    62,    60,
      57,    61,    25,    44,    45,    46,    47,    48,    49,    50,
      34,    60,    53,    54,    36,    37,    60,    14,    14,    40,
      58,    62,    44,    45,    46,    47,    48,    49,    50,    10,
      43,    53,    54,    52,     9,    10,    11,    12,   208,    61,
      15,    16,   190,    61,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     9,    10,    11,    12,    -1,    -1,    15,
      16,    36,    37,    -1,    -1,    -1,    -1,    -1,    -1,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    53,    54,
      36,    37,    -1,    -1,    -1,    60,    -1,    -1,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    53,    54,     9,
      10,    11,    12,    -1,    60,    15,    16,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     9,    10,
      11,    12,    -1,    -1,    15,    16,    36,    37,    -1,    -1,
      -1,    -1,    -1,    -1,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    53,    54,    36,    37,    -1,    -1,    -1,
      60,    -1,    -1,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    53,    54,     9,    10,    11,    12,    -1,    60,
      15,    16,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     9,
      10,    11,    12,    -1,    -1,    15,    16,    -1,    -1,    -1,
      -1,    36,    37,    -1,    -1,    -1,    -1,    -1,    -1,    44,
      45,    46,    47,    48,    49,    50,    36,    37,    53,    54,
      55,    -1,    -1,    -1,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    53,    54,     9,    10,    11,    12,    -1,
      -1,    15,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       9,    10,    11,    12,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    36,    37,    -1,     9,    10,    11,    12,    -1,
      44,    45,    46,    47,    48,    49,    50,    36,    37,    53,
      54,    -1,    -1,    -1,    -1,    44,    45,    46,    47,    48,
      49,    50,    36,    37,    53,    54,     9,    10,    -1,    -1,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    53,
      54,     3,     4,     5,     6,     7,     8,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    -1,    -1,    -1,    20,    -1,
      -1,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      53,    54,    17,    -1,    19,    -1,    38,    22,    23,    24,
      -1,    26,    27,    28,    29,    30,    31,    32,    33,    -1,
      -1,    -1,    -1,    38,    39,    40,    41,    42,    -1,    -1,
      -1,    -1,    47,    -1,    -1,    -1,    -1,    52,    -1,    -1,
      -1,    -1,    57,    17,    59,    19,    61,    -1,    22,    23,
      24,    -1,    26,    27,    28,    29,    30,    31,    32,    33,
      -1,    -1,    -1,    -1,    38,    39,    40,    41,    42,    -1,
      -1,    -1,    -1,    47,    -1,    17,    -1,    19,    52,    -1,
      -1,    -1,    -1,    57,    -1,    59,    28,    29,    -1,    31,
      32,    -1,    -1,    -1,    -1,    -1,    38,    39,    40,    41,
      42,    -1,    -1,    -1,    -1,    47,    -1,    -1,    -1,    -1,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    59
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,     5,     6,     7,     8,    20,    38,    64,
      65,    66,    67,    70,    76,   102,   103,   104,   105,   106,
     106,   106,   106,     0,    66,    61,    13,   106,    59,    18,
      71,    57,    59,    77,    78,   103,   104,   105,    21,    72,
      73,    74,     3,    68,    69,   104,    77,    60,    62,   106,
     105,    57,    62,   106,    58,    69,   106,    60,    57,    79,
     103,    75,    74,    59,    59,    79,   101,    58,    76,   102,
      77,    77,    17,    19,    22,    23,    24,    26,    27,    28,
      29,    30,    31,    32,    33,    39,    40,    41,    42,    47,
      52,    59,    79,    80,    81,    82,    83,    85,    86,    87,
      91,    92,    93,    95,    96,    97,    98,   102,   106,   107,
      60,    60,    59,    59,    59,    95,   106,    61,    59,    59,
      59,    59,    59,    59,    96,    96,    96,    58,    82,    61,
       9,    10,    11,    12,    15,    16,    36,    37,    44,    45,
      46,    47,    48,    49,    50,    53,    54,    43,    59,    61,
      61,    96,    95,    96,    61,   105,    96,    94,    96,    60,
      60,    96,    60,    96,    96,    96,    96,    96,    96,    96,
      96,    96,    96,    96,    96,    96,   106,    96,    96,    96,
      99,   100,    60,    61,    60,    60,    62,    60,    62,    60,
      59,    55,    60,    62,    82,    96,    82,   104,    61,    96,
      57,    99,    96,    61,    25,    84,    60,    34,    88,    89,
      60,    95,    82,    40,    35,    89,    90,    60,    14,    14,
      58,    82,    80,    80
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    63,    64,    65,    65,    66,    66,    66,    66,    67,
      68,    68,    68,    69,    69,    70,    71,    71,    72,    72,
      73,    73,    74,    75,    75,    75,    76,    76,    77,    77,
      78,    78,    79,    80,    80,    81,    81,    82,    82,    82,
      82,    82,    82,    82,    82,    82,    83,    84,    84,    85,
      86,    87,    88,    88,    89,    90,    91,    92,    93,    94,
      94,    95,    95,    96,    96,    96,    96,    96,    96,    96,
      96,    96,    96,    96,    96,    96,    96,    96,    96,    96,
      96,    96,    96,    96,    96,    96,    96,    96,    96,    96,
      97,    97,    97,    98,    98,    99,    99,   100,   100,   101,
     101,   102,   103,   104,   104,   104,   104,   104,   104,   105,
     106,   107,   107,   107,   107,   107
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     1,     5,
       2,     1,     0,     6,     6,     7,     2,     0,     1,     0,
       3,     1,     2,     2,     2,     0,     6,     6,     1,     0,
       3,     1,     4,     1,     0,     2,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     6,     2,     0,     5,
       9,     8,     2,     1,     4,     3,     2,     3,     5,     3,
       1,     1,     0,     1,     1,     1,     1,     3,     3,     3,
       3,     3,     3,     3,     2,     2,     2,     3,     3,     3,
       3,     3,     3,     3,     3,     2,     3,     3,     4,     6,
       1,     3,     4,     4,     6,     1,     0,     3,     1,     2,
       0,     2,     2,     1,     1,     1,     1,     1,     2,     1,
       1,     1,     1,     1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (0)
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

YY_ATTRIBUTE_UNUSED
static unsigned
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  unsigned res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += YYFPRINTF (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += YYFPRINTF (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += YYFPRINTF (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += YYFPRINTF (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += YYFPRINTF (yyo, "-%d", end_col);
    }
  return res;
 }

#  define YY_LOCATION_PRINT(File, Loc)          \
  yy_location_print_ (File, &(Loc))

# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  YYUSE (yylocationp);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                       , &(yylsp[(yyi + 1) - (yynrhs)])                       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, yylsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.
       'yyls': related to locations.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    /* The location stack.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls;
    YYLTYPE *yylsp;

    /* The locations where the error started and ended.  */
    YYLTYPE yyerror_range[3];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yylsp = yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  yylsp[0] = yylloc;
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;
        YYLTYPE *yyls1 = yyls;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yyls1, yysize * sizeof (*yylsp),
                    &yystacksize);

        yyls = yyls1;
        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
        YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 160 "parser.y" /* yacc.c:1646  */
    { 
                      (yylsp[0]); 
                      Program *program = new Program((yyvsp[0].declList));
                      if (ReportError::NumErrors() == 0) 
                        program->Print(0);
                    }
#line 1700 "y.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 168 "parser.y" /* yacc.c:1646  */
    { ((yyval.declList)=(yyvsp[-1].declList))->Append((yyvsp[0].decl)); }
#line 1706 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 169 "parser.y" /* yacc.c:1646  */
    { ((yyval.declList) = new List<Decl*>)->Append((yyvsp[0].decl)); }
#line 1712 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 172 "parser.y" /* yacc.c:1646  */
    { (yyval.decl) = (yyvsp[0].vardecl);}
#line 1718 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 173 "parser.y" /* yacc.c:1646  */
    {(yyval.decl) = (yyvsp[0].classdecl);}
#line 1724 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 174 "parser.y" /* yacc.c:1646  */
    {(yyval.decl) = (yyvsp[0].interfacedecl);}
#line 1730 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 175 "parser.y" /* yacc.c:1646  */
    { (yyval.decl) = (yyvsp[0].fndecl);}
#line 1736 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 180 "parser.y" /* yacc.c:1646  */
    {(yyval.interfacedecl) = new InterfaceDecl((yyvsp[-3].name), (yyvsp[-1].declList));}
#line 1742 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 183 "parser.y" /* yacc.c:1646  */
    { ((yyval.declList) = (yyvsp[-1].declList)) -> Append((yyvsp[0].decl));}
#line 1748 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 184 "parser.y" /* yacc.c:1646  */
    { ((yyval.declList) = new List<Decl*>) -> Append((yyvsp[0].decl)); }
#line 1754 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 185 "parser.y" /* yacc.c:1646  */
    { (yyval.declList) = new List<Decl*> ;}
#line 1760 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 188 "parser.y" /* yacc.c:1646  */
    {(yyval.decl) = new FnDecl((yyvsp[-4].name), (yyvsp[-5].type), (yyvsp[-2].varList));;}
#line 1766 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 189 "parser.y" /* yacc.c:1646  */
    {(yyval.decl) = new FnDecl((yyvsp[-4].name), Type::voidType, (yyvsp[-2].varList));}
#line 1772 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 195 "parser.y" /* yacc.c:1646  */
    {(yyval.classdecl) = new ClassDecl((yyvsp[-5].name), (yyvsp[-4].namedtyped), (yyvsp[-3].namedtypeList), (yyvsp[-1].declList));}
#line 1778 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 198 "parser.y" /* yacc.c:1646  */
    {(yyval.namedtyped) =  (yyvsp[0].namedtyped);}
#line 1784 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 199 "parser.y" /* yacc.c:1646  */
    {(yyval.namedtyped) = NULL;}
#line 1790 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 202 "parser.y" /* yacc.c:1646  */
    {(yyval.namedtypeList) =(yyvsp[0].namedtypeList);}
#line 1796 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 203 "parser.y" /* yacc.c:1646  */
    {(yyval.namedtypeList) = new List<NamedType*>; }
#line 1802 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 206 "parser.y" /* yacc.c:1646  */
    { ((yyval.namedtypeList) = (yyvsp[-2].namedtypeList)) -> Append((yyvsp[0].namedtyped)); }
#line 1808 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 207 "parser.y" /* yacc.c:1646  */
    { ((yyval.namedtypeList) = new List<NamedType*>) -> Append((yyvsp[0].namedtyped)); }
#line 1814 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 210 "parser.y" /* yacc.c:1646  */
    {(yyval.namedtyped) = (yyvsp[0].namedtyped);}
#line 1820 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 213 "parser.y" /* yacc.c:1646  */
    { ((yyval.declList) = (yyvsp[-1].declList)) -> Append((yyvsp[0].fndecl));}
#line 1826 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 214 "parser.y" /* yacc.c:1646  */
    { ((yyval.declList) = (yyvsp[-1].declList)) -> Append((yyvsp[0].vardecl));}
#line 1832 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 215 "parser.y" /* yacc.c:1646  */
    {(yyval.declList) = new List<Decl*>; }
#line 1838 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 220 "parser.y" /* yacc.c:1646  */
    {(yyval.fndecl) = new FnDecl((yyvsp[-4].name), (yyvsp[-5].type), (yyvsp[-2].varList)); (yyval.fndecl)->SetFunctionBody((yyvsp[0].stmtblock));}
#line 1844 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 221 "parser.y" /* yacc.c:1646  */
    {(yyval.fndecl) = new FnDecl((yyvsp[-4].name), Type::voidType, (yyvsp[-2].varList)); (yyval.fndecl)->SetFunctionBody((yyvsp[0].stmtblock));}
#line 1850 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 224 "parser.y" /* yacc.c:1646  */
    {(yyval.varList) = (yyvsp[0].varList);}
#line 1856 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 225 "parser.y" /* yacc.c:1646  */
    {(yyval.varList) = new List<VarDecl*>;}
#line 1862 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 228 "parser.y" /* yacc.c:1646  */
    {((yyval.varList) = (yyvsp[-2].varList)) -> Append((yyvsp[0].vardecl));}
#line 1868 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 229 "parser.y" /* yacc.c:1646  */
    { ((yyval.varList) = new List<VarDecl*>) -> Append((yyvsp[0].vardecl));}
#line 1874 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 234 "parser.y" /* yacc.c:1646  */
    {(yyval.stmtblock) = new StmtBlock((yyvsp[-2].varList), (yyvsp[-1].stmtList));}
#line 1880 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 237 "parser.y" /* yacc.c:1646  */
    {(yyval.stmtList) = (yyvsp[0].stmtList);}
#line 1886 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 238 "parser.y" /* yacc.c:1646  */
    {(yyval.stmtList) = new List<Stmt*>;}
#line 1892 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 241 "parser.y" /* yacc.c:1646  */
    {((yyval.stmtList) = (yyvsp[-1].stmtList)) -> Append((yyvsp[0].stmt));}
#line 1898 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 242 "parser.y" /* yacc.c:1646  */
    { ((yyval.stmtList) = new List<Stmt*>) -> Append((yyvsp[0].stmt));}
#line 1904 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 246 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[-1].expr);}
#line 1910 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 247 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmt);}
#line 1916 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 248 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmt);}
#line 1922 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 249 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmt);}
#line 1928 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 250 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].switchstmt);}
#line 1934 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 251 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmt);}
#line 1940 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 252 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmt);}
#line 1946 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 253 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmt);}
#line 1952 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 254 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmtblock);}
#line 1958 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 257 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = new IfStmt((yyvsp[-3].expr), (yyvsp[-1].stmt), (yyvsp[0].stmt));}
#line 1964 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 260 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = (yyvsp[0].stmt);}
#line 1970 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 261 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = NULL; }
#line 1976 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 264 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = new WhileStmt((yyvsp[-2].expr), (yyvsp[0].stmt));}
#line 1982 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 267 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = new ForStmt((yyvsp[-6].expr), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));}
#line 1988 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 270 "parser.y" /* yacc.c:1646  */
    {(yyval.switchstmt) = new SwitchStmt((yyvsp[-5].expr), (yyvsp[-2].casestmtList), (yyvsp[-1].defaultstmt));}
#line 1994 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 273 "parser.y" /* yacc.c:1646  */
    { ((yyval.casestmtList) = (yyvsp[-1].casestmtList)) -> Append((yyvsp[0].casestmt));}
#line 2000 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 274 "parser.y" /* yacc.c:1646  */
    {((yyval.casestmtList) = new List<CaseStmt*>) -> Append((yyvsp[0].casestmt));}
#line 2006 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 277 "parser.y" /* yacc.c:1646  */
    {(yyval.casestmt) = new CaseStmt(new IntConstant((yylsp[-2]), (yyvsp[-2].integerConstant)), (yyvsp[0].stmtList));}
#line 2012 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 280 "parser.y" /* yacc.c:1646  */
    {(yyval.defaultstmt) = new DefaultStmt((yyvsp[0].stmtList));}
#line 2018 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 283 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = new BreakStmt(Join((yylsp[-1]), (yylsp[0])));}
#line 2024 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 286 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = new ReturnStmt(Join((yylsp[-2]), (yylsp[0])), (yyvsp[-1].expr));}
#line 2030 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 289 "parser.y" /* yacc.c:1646  */
    {(yyval.stmt) = new PrintStmt((yyvsp[-2].exprList));}
#line 2036 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 293 "parser.y" /* yacc.c:1646  */
    { ((yyval.exprList) = (yyvsp[-2].exprList)) -> Append((yyvsp[0].expr)); }
#line 2042 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 294 "parser.y" /* yacc.c:1646  */
    { ((yyval.exprList) = new List<Expr*>) -> Append((yyvsp[0].expr));}
#line 2048 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 297 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = (yyvsp[0].expr);}
#line 2054 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 298 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new EmptyExpr();}
#line 2060 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 301 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = (yyvsp[0].lvalue);}
#line 2066 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 302 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = (yyvsp[0].expr);}
#line 2072 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 303 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = (yyvsp[0].call);}
#line 2078 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 304 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new This((yylsp[0]));}
#line 2084 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 305 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = (yyvsp[-1].expr);}
#line 2090 "y.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 306 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new AssignExpr((yyvsp[-2].lvalue), new Operator((yylsp[-1]), "="), (yyvsp[0].expr));}
#line 2096 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 307 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "+"), (yyvsp[0].expr));}
#line 2102 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 308 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "-"), (yyvsp[0].expr));}
#line 2108 "y.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 309 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "*"), (yyvsp[0].expr));}
#line 2114 "y.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 310 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "/"), (yyvsp[0].expr));}
#line 2120 "y.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 311 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "%"), (yyvsp[0].expr));}
#line 2126 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 312 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ArithmeticExpr(new Operator((yylsp[-1]), "-"), (yyvsp[0].expr));}
#line 2132 "y.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 313 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new PostfixExpr(new Operator((yylsp[0]), "++"), (yyvsp[-1].expr));}
#line 2138 "y.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 314 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new PostfixExpr(new Operator((yylsp[0]), "--"), (yyvsp[-1].expr));}
#line 2144 "y.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 315 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "<"), (yyvsp[0].expr));}
#line 2150 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 316 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), ">"), (yyvsp[0].expr));}
#line 2156 "y.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 317 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "<="), (yyvsp[0].expr));}
#line 2162 "y.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 318 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), ">="), (yyvsp[0].expr));}
#line 2168 "y.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 319 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new EqualityExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "=="), (yyvsp[0].expr));}
#line 2174 "y.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 320 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new EqualityExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "!="), (yyvsp[0].expr));}
#line 2180 "y.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 321 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new LogicalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "&&"), (yyvsp[0].expr));}
#line 2186 "y.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 322 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new LogicalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "||"), (yyvsp[0].expr));}
#line 2192 "y.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 323 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new LogicalExpr(new Operator((yylsp[-1]), "!"), (yyvsp[0].expr));}
#line 2198 "y.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 324 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ReadIntegerExpr(Join((yylsp[-2]), (yylsp[0])));}
#line 2204 "y.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 325 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new ReadLineExpr(Join((yylsp[-2]), (yylsp[-2])));}
#line 2210 "y.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 326 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new NewExpr(Join((yylsp[-3]),(yylsp[0])), (yyvsp[-1].namedtyped));}
#line 2216 "y.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 327 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new NewArrayExpr(Join((yylsp[-5]),(yylsp[0])), (yyvsp[-3].expr), (yyvsp[-1].type));}
#line 2222 "y.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 330 "parser.y" /* yacc.c:1646  */
    {(yyval.lvalue) = new FieldAccess(NULL, (yyvsp[0].name));}
#line 2228 "y.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 331 "parser.y" /* yacc.c:1646  */
    {(yyval.lvalue) = new FieldAccess((yyvsp[-2].expr), (yyvsp[0].name));}
#line 2234 "y.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 332 "parser.y" /* yacc.c:1646  */
    {(yyval.lvalue) = new ArrayAccess(Join((yylsp[-3]),(yylsp[0])), (yyvsp[-3].expr), (yyvsp[-1].expr));}
#line 2240 "y.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 335 "parser.y" /* yacc.c:1646  */
    {(yyval.call) = new Call(Join((yylsp[-3]),(yylsp[0])), NULL, (yyvsp[-3].name), (yyvsp[-1].exprList));}
#line 2246 "y.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 336 "parser.y" /* yacc.c:1646  */
    {(yyval.call) = new Call(Join((yylsp[-5]),(yylsp[0])), (yyvsp[-5].expr), (yyvsp[-3].name), (yyvsp[-1].exprList));}
#line 2252 "y.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 340 "parser.y" /* yacc.c:1646  */
    {(yyval.exprList) = (yyvsp[0].exprList);}
#line 2258 "y.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 341 "parser.y" /* yacc.c:1646  */
    {(yyval.exprList) = new List<Expr*>;}
#line 2264 "y.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 344 "parser.y" /* yacc.c:1646  */
    {((yyval.exprList) = (yyvsp[-2].exprList)) -> Append((yyvsp[0].expr));}
#line 2270 "y.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 345 "parser.y" /* yacc.c:1646  */
    {((yyval.exprList) = new List<Expr*>) -> Append((yyvsp[0].expr));}
#line 2276 "y.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 350 "parser.y" /* yacc.c:1646  */
    { ((yyval.varList) = (yyvsp[-1].varList)) -> Append((yyvsp[0].vardecl));}
#line 2282 "y.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 351 "parser.y" /* yacc.c:1646  */
    { (yyval.varList) = new List<VarDecl*>;}
#line 2288 "y.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 354 "parser.y" /* yacc.c:1646  */
    { (yyval.vardecl) = (yyvsp[-1].vardecl);}
#line 2294 "y.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 357 "parser.y" /* yacc.c:1646  */
    {(yyval.vardecl) = new VarDecl((yyvsp[0].name), (yyvsp[-1].type));}
#line 2300 "y.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 362 "parser.y" /* yacc.c:1646  */
    {(yyval.type) = Type::boolType;}
#line 2306 "y.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 363 "parser.y" /* yacc.c:1646  */
    { (yyval.type) = Type::intType;}
#line 2312 "y.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 364 "parser.y" /* yacc.c:1646  */
    {(yyval.type) = Type::doubleType;}
#line 2318 "y.tab.c" /* yacc.c:1646  */
    break;

  case 106:
#line 365 "parser.y" /* yacc.c:1646  */
    {(yyval.type) = Type::stringType;}
#line 2324 "y.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 366 "parser.y" /* yacc.c:1646  */
    {(yyval.type) = (yyvsp[0].namedtyped);}
#line 2330 "y.tab.c" /* yacc.c:1646  */
    break;

  case 108:
#line 367 "parser.y" /* yacc.c:1646  */
    {(yyval.type) = new ArrayType(yylloc, (yyvsp[-1].type));}
#line 2336 "y.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 369 "parser.y" /* yacc.c:1646  */
    {(yyval.namedtyped) = new NamedType((yyvsp[0].name));}
#line 2342 "y.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 372 "parser.y" /* yacc.c:1646  */
    {(yyval.name) = new Identifier((yylsp[0]), &(yyvsp[0].identifier)[0]);}
#line 2348 "y.tab.c" /* yacc.c:1646  */
    break;

  case 111:
#line 375 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new StringConstant ((yylsp[0]), (yyvsp[0].stringConstant)); }
#line 2354 "y.tab.c" /* yacc.c:1646  */
    break;

  case 112:
#line 376 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new IntConstant ((yylsp[0]), (yyvsp[0].integerConstant));}
#line 2360 "y.tab.c" /* yacc.c:1646  */
    break;

  case 113:
#line 377 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new DoubleConstant ((yylsp[0]), (yyvsp[0].doubleConstant));}
#line 2366 "y.tab.c" /* yacc.c:1646  */
    break;

  case 114:
#line 378 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new BoolConstant ((yylsp[0]), (yyvsp[0].boolConstant));}
#line 2372 "y.tab.c" /* yacc.c:1646  */
    break;

  case 115:
#line 379 "parser.y" /* yacc.c:1646  */
    {(yyval.expr) = new NullConstant ((yylsp[0]));}
#line 2378 "y.tab.c" /* yacc.c:1646  */
    break;


#line 2382 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }

  yyerror_range[1] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, &yylloc);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[1] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, yyerror_range, 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 382 "parser.y" /* yacc.c:1906  */


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
