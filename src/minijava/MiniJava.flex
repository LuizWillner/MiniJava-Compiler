package minijava;
%%

%class MiniJava
%unicode
%public
%function yylex
%type Token

%{
    public class Token {
      public String type;
      public String value;

      public Token(String type, String value) {
          this.type = type;
          this.value = value;
      }
    }
%}

DIGIT = [0-9]
LETTER = [a-zA-Z]
ID = {LETTER}({LETTER}|{DIGIT}|_)*
INTEGER = {DIGIT}+
WHITESPACE = [ \t\n\r]+
STRING = "\""([^\"\\] | \\.)*"\""
COMMENT = "//".* | "/*"([^])*?"*/"

%%

"class"                  { return new Token("CLASS", yytext()); }
"public"                 { return new Token("PUBLIC", yytext()); }
"static"                 { return new Token("STATIC", yytext()); }
"void"                   { return new Token("VOID", yytext()); }
"main"                   { return new Token("MAIN", yytext()); }
"extends"                { return new Token("EXTENDS", yytext()); }
"return"                 { return new Token("RETURN", yytext()); }
"int"                    { return new Token("INT", yytext()); }
"boolean"                { return new Token("BOOLEAN", yytext()); }
"if"                     { return new Token("IF", yytext()); }
"else"                   { return new Token("ELSE", yytext()); }
"while"                  { return new Token("WHILE", yytext()); }
"true"                   { return new Token("TRUE", yytext()); }
"false"                  { return new Token("FALSE", yytext()); }
"this"                   { return new Token("THIS", yytext()); }
"new"                    { return new Token("NEW", yytext()); }
"length"                 { return new Token("LENGTH", yytext()); }
"System\.out\.println"   { return new Token("PRINT", yytext()); }

"&&"                     { return new Token("AND", yytext()); }
"<"                      { return new Token("LT", yytext()); }
"+"                      { return new Token("PLUS", yytext()); }
"-"                      { return new Token("MINUS", yytext()); }
"*"                      { return new Token("MULT", yytext()); }
"!"                      { return new Token("NOT", yytext()); }
"="                      { return new Token("ASSIGN", yytext()); }
";"                      { return new Token("SEMI", yytext()); }
","                      { return new Token("COMMA", yytext()); }
"."                      { return new Token("DOT", yytext()); }
"["                      { return new Token("LBRACK", yytext()); }
"]"                      { return new Token("RBRACK", yytext()); }
"("                      { return new Token("LPAREN", yytext()); }
")"                      { return new Token("RPAREN", yytext()); }
"{"                      { return new Token("LBRACE", yytext()); }
"}"                      { return new Token("RBRACE", yytext()); }

{ID}                     { return new Token("ID", yytext()); }
{STRING}                 { return new Token("STRING", yytext()); }
{INTEGER}                { return new Token("NUMBER", yytext()); }
{WHITESPACE}             { /* ignora */ }
{COMMENT}                { /* ignora */ }
.                        { return new Token("UNKNOWN-TOKEN", yytext()); }
