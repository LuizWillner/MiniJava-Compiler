%%

%class Calc
%unicode
%public
%function yylex
%type String

DIGIT = [0-9]

%%

{DIGIT}+            { return "NUM"; }
"+"                  { return "PLUS"; }
"-"                  { return "MINUS"; }
"*"                  { return "MULT"; }
"/"                  { return "DIV"; }
"("                  { return "LPAREN"; }
")"                  { return "RPAREN"; }
[ \t\n\r]+           { /* ignore */ }
.                    { return "UNKNOWN-TOKEN"; }
