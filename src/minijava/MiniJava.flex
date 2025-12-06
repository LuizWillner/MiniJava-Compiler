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

"class"        { return new Symbol(sym.CLASS, yyline, yycolumn, yytext()); }
"public"       { return new Symbol(sym.PUBLIC, yyline, yycolumn, yytext()); }
"static"       { return new Symbol(sym.STATIC, yyline, yycolumn, yytext()); }
"void"         { return new Symbol(sym.VOID, yyline, yycolumn, yytext()); }
"main"         { return new Symbol(sym.MAIN, yyline, yycolumn, yytext()); }
"extends"      { return new Symbol(sym.EXTENDS, yyline, yycolumn, yytext()); }
"return"       { return new Symbol(sym.RETURN, yyline, yycolumn, yytext()); }
"int"          { return new Symbol(sym.INT, yyline, yycolumn, yytext()); }
"boolean"      { return new Symbol(sym.BOOLEAN, yyline, yycolumn, yytext()); }
"String"       { return new Symbol(sym.STRING_TYPE, yyline, yycolumn, yytext()); }

"if"           { return new Symbol(sym.IF, yyline, yycolumn, yytext()); }
"else"         { return new Symbol(sym.ELSE, yyline, yycolumn, yytext()); }
"while"        { return new Symbol(sym.WHILE, yyline, yycolumn, yytext()); }

"true"         { return new Symbol(sym.TRUE, yyline, yycolumn, yytext()); }
"false"        { return new Symbol(sym.FALSE, yyline, yycolumn, yytext()); }
"this"         { return new Symbol(sym.THIS, yyline, yycolumn, yytext()); }
"new"          { return new Symbol(sym.NEW, yyline, yycolumn, yytext()); }
"length"       { return new Symbol(sym.LENGTH, yyline, yycolumn, yytext()); }
"System.out.println" { return new Symbol(sym.PRINT, yyline, yycolumn, yytext()); }

"&&"           { return new Symbol(sym.AND, yyline, yycolumn, yytext()); }
"<"            { return new Symbol(sym.LESSTHAN, yyline, yycolumn, yytext()); }
"+"            { return new Symbol(sym.PLUS, yyline, yycolumn, yytext()); }
"-"            { return new Symbol(sym.MINUS, yyline, yycolumn, yytext()); }
"*"            { return new Symbol(sym.MULT, yyline, yycolumn, yytext()); }
"!"            { return new Symbol(sym.NOT, yyline, yycolumn, yytext()); }
"="            { return new Symbol(sym.ASSIGN, yyline, yycolumn, yytext()); }

";"            { return new Symbol(sym.SEMICOL, yyline, yycolumn, yytext()); }
","            { return new Symbol(sym.COMMA, yyline, yycolumn, yytext()); }
"."            { return new Symbol(sym.DOT, yyline, yycolumn, yytext()); }

"["            { return new Symbol(sym.LBRACK, yyline, yycolumn, yytext()); }
"]"            { return new Symbol(sym.RBRACK, yyline, yycolumn, yytext()); }
"("            { return new Symbol(sym.LPAREN, yyline, yycolumn, yytext()); }
")"            { return new Symbol(sym.RPAREN, yyline, yycolumn, yytext()); }
"{"            { return new Symbol(sym.LBRACE, yyline, yycolumn, yytext()); }
"}"            { return new Symbol(sym.RBRACE, yyline, yycolumn, yytext()); }

[0-9]+         { return new Symbol(sym.NUMBER, yyline, yycolumn, yytext()); }
[a-zA-Z_][a-zA-Z0-9_]* { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }

[ \t\r\n\f]+   { /* ignore */ }
"//".*         { /* ignore */ }
"/*"([^])*"*/" { /* ignore */ }

<<EOF>>         { return new Symbol(sym.EOF); }
.               { return new Symbol(sym.ERROR, yyline, yycolumn, yytext()); }
