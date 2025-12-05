package minijava;

import java_cup.runtime.Symbol;

%%

%class MiniJava
%unicode
%public
%cup
%line
%column

%function next_token
%type java_cup.runtime.Symbol

%%

"class"        { return new Symbol(sym.CLASS, yyline, yycolumn); }
"public"       { return new Symbol(sym.PUBLIC, yyline, yycolumn); }
"static"       { return new Symbol(sym.STATIC, yyline, yycolumn); }
"void"         { return new Symbol(sym.VOID, yyline, yycolumn); }
"main"         { return new Symbol(sym.MAIN, yyline, yycolumn); }
"extends"      { return new Symbol(sym.EXTENDS, yyline, yycolumn); }
"return"       { return new Symbol(sym.RETURN, yyline, yycolumn); }
"int"          { return new Symbol(sym.INT, yyline, yycolumn); }
"boolean"      { return new Symbol(sym.BOOLEAN, yyline, yycolumn); }
"String"       { return new Symbol(sym.STRING_TYPE, yyline, yycolumn); }

"if"           { return new Symbol(sym.IF, yyline, yycolumn); }
"else"         { return new Symbol(sym.ELSE, yyline, yycolumn); }
"while"        { return new Symbol(sym.WHILE, yyline, yycolumn); }

"true"         { return new Symbol(sym.TRUE, yyline, yycolumn); }
"false"        { return new Symbol(sym.FALSE, yyline, yycolumn); }
"this"         { return new Symbol(sym.THIS, yyline, yycolumn); }
"new"          { return new Symbol(sym.NEW, yyline, yycolumn); }
"length"       { return new Symbol(sym.LENGTH, yyline, yycolumn); }
"System.out.println" { return new Symbol(sym.PRINT, yyline, yycolumn); }

"&&"           { return new Symbol(sym.AND, yyline, yycolumn); }
"<"            { return new Symbol(sym.LESSTHAN, yyline, yycolumn); }
"+"            { return new Symbol(sym.PLUS, yyline, yycolumn); }
"-"            { return new Symbol(sym.MINUS, yyline, yycolumn); }
"*"            { return new Symbol(sym.MULT, yyline, yycolumn); }
"!"            { return new Symbol(sym.NOT, yyline, yycolumn); }
"="            { return new Symbol(sym.ASSIGN, yyline, yycolumn); }

";"            { return new Symbol(sym.SEMICOL, yyline, yycolumn); }
","            { return new Symbol(sym.COMMA, yyline, yycolumn); }
"."            { return new Symbol(sym.DOT, yyline, yycolumn); }

"["            { return new Symbol(sym.LBRACK, yyline, yycolumn); }
"]"            { return new Symbol(sym.RBRACK, yyline, yycolumn); }
"("            { return new Symbol(sym.LPAREN, yyline, yycolumn); }
")"            { return new Symbol(sym.RPAREN, yyline, yycolumn); }
"{"            { return new Symbol(sym.LBRACE, yyline, yycolumn); }
"}"            { return new Symbol(sym.RBRACE, yyline, yycolumn); }

[0-9]+         { return new Symbol(sym.NUMBER, yyline, yycolumn, yytext()); }
[a-zA-Z_][a-zA-Z0-9_]* { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }

[ \t\r\n\f]+   { /* ignore */ }
"//".*         { /* ignore */ }
"/*"([^])*"*/" { /* ignore */ }

<<EOF>>         { return new Symbol(sym.EOF); }
.               { return new Symbol(sym.ERROR, yyline, yycolumn, yytext()); }
