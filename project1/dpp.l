/* Thanks to     http://stackoverflow.com/questions/2130097/difficulty-getting-c-style-comments-in-flex-lex
 *
 * file:  dpp.l
 * ------------
 * Lex inupt file to generate the scanner for the preprocessor.
 * If you decide to use lex for the preprocesor, put your rules
 * here, otherwise the file can remain empty.
*/
%{
#include <string>
#include <vector>
#include <stdio.h>
#include <map>
#include <iostream>
using namespace std;

map <string, string> define_list;

string line, definition, meaning, original_line;
int position;
%}

letter     [a-zA-Z]
uppercase  [A-Z]
define     "#define "(" ")*{uppercase}+(" ")+(.)*$
replace    ("#"){uppercase}*
onelinecomment "//"(.)*$
quotation "\""
%x COMMENT
%x STRING

%%
{define} {string delimiter = " ";
          line = string(yytext);
          position = line.find(delimiter);
          /* take the first space */
          if (position != std::string::npos){
            line.erase(0, position+delimiter.length());
          }
          position = line.find(delimiter);
          /* take the definition */
          if (position != std::string::npos){
            definition = line.substr(0, position);
            line.erase(0, position+delimiter.length());
          }
          /* take the meaning */
          meaning = line;
          define_list[definition] = meaning;
          }

{replace}         {line = string(yytext);
                   line = line.erase(0,1);
                   if ( define_list.find(line) != define_list.end() )
                     cout << define_list[line];
                   else
                     cout << "#" << line;
                  }

{onelinecomment} {line = string(yytext);
           int i = 0;
           for (int i = 0; i < line.length(); i++){
             if (line[i] == '\n') cout <<'\n';
             else cout <<' ';
             }}

{quotation}         {printf("%s", yytext); BEGIN(STRING);}
<STRING>{quotation} {printf("%s", yytext); BEGIN(INITIAL);}          
<STRING>.           {printf("%s", yytext);}
<STRING>\n          {printf("%s", yytext); BEGIN(INITIAL);}

             
"/*"          { line = "  "; original_line = "/*"; printf("  ");BEGIN(COMMENT); }
<COMMENT>"*/" { line += "  "; cout << line; BEGIN(INITIAL); }
<COMMENT>.    { line += " "; original_line += string(yytext); }
<COMMENT>\n   { line += "\n"; original_line += "\n"; }
<COMMENT><<EOF>> { cout << original_line; BEGIN(INITIAL);}

.|\n {printf("%s", yytext);}

%%
