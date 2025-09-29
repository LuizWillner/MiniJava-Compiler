package minijava;
%%

%class MiniJava
%unicode
%public
%function yylex
%type Token
%line
%column

%{

    public class Token {
      public String type;
      public String value;
      public int line;
      public int column;

      public Token(String type, String value, int line, int column) {
          this.type = type;
          this.value = value;
          this.line = line + 1;  // Linhas e colunas começando em 1
          this.column = column + 1;
      }
    }
%}

DIGIT = [0-9]
LETTER = [a-zA-Z]
INTEGER = {DIGIT}+
WHITESPACE = [ \t\n\r\f]+
COMMENT = "//".* | "/*"([^])*?"*/"
ID = {LETTER}|_({LETTER}|{DIGIT}|_)*

%%

"class"                  { return new Token("CLASS", yytext(), yyline, yycolumn); }
"public"                 { return new Token("PUBLIC", yytext(), yyline, yycolumn); }
"static"                 { return new Token("STATIC", yytext(), yyline, yycolumn); }
"void"                   { return new Token("VOID", yytext(), yyline, yycolumn); }
"main"                   { return new Token("MAIN", yytext(), yyline, yycolumn); }
"extends"                { return new Token("EXTENDS", yytext(), yyline, yycolumn); }
"return"                 { return new Token("RETURN", yytext(), yyline, yycolumn); }
"int"                    { return new Token("INT", yytext(), yyline, yycolumn); }
"boolean"                { return new Token("BOOLEAN", yytext(), yyline, yycolumn); }
"String"                 { return new Token("STRING_TYPE", yytext(), yyline, yycolumn); }
"if"                     { return new Token("IF", yytext(), yyline, yycolumn); }
"else"                   { return new Token("ELSE", yytext(), yyline, yycolumn); }
"while"                  { return new Token("WHILE", yytext(), yyline, yycolumn); }
"true"                   { return new Token("TRUE", yytext(), yyline, yycolumn); }
"false"                  { return new Token("FALSE", yytext(), yyline, yycolumn); }
"this"                   { return new Token("THIS", yytext(), yyline, yycolumn); }
"new"                    { return new Token("NEW", yytext(), yyline, yycolumn); }
"length"                 { return new Token("LENGTH", yytext(), yyline, yycolumn); }
"System\.out\.println"   { return new Token("PRINT", yytext(), yyline, yycolumn); }

"&&"                     { return new Token("AND", yytext(), yyline, yycolumn); }
"<"                      { return new Token("LESSTHAN", yytext(), yyline, yycolumn); }
"+"                      { return new Token("PLUS", yytext(), yyline, yycolumn); }
"-"                      { return new Token("MINUS", yytext(), yyline, yycolumn); }
"*"                      { return new Token("MULT", yytext(), yyline, yycolumn); }
"!"                      { return new Token("NOT", yytext(), yyline, yycolumn); }
"="                      { return new Token("ASSIGN", yytext(), yyline, yycolumn); }
";"                      { return new Token("SEMICOL", yytext(), yyline, yycolumn); }
","                      { return new Token("COMMA", yytext(), yyline, yycolumn); }
"."                      { return new Token("DOT", yytext(), yyline, yycolumn); }
"["                      { return new Token("LBRACK", yytext(), yyline, yycolumn); }
"]"                      { return new Token("RBRACK", yytext(), yyline, yycolumn); }
"("                      { return new Token("LPAREN", yytext(), yyline, yycolumn); }
")"                      { return new Token("RPAREN", yytext(), yyline, yycolumn); }
"{"                      { return new Token("LBRACE", yytext(), yyline, yycolumn); }
"}"                      { return new Token("RBRACE", yytext(), yyline, yycolumn); }

{ID}                     { return new Token("ID", yytext(), yyline, yycolumn); }
{INTEGER}                { return new Token("NUMBER", yytext(), yyline, yycolumn); }
{WHITESPACE}             { /* ignora */ }
{COMMENT}                { /* ignora */ }
<<EOF>>                  { return new Token("EOF", "", yyline, yycolumn); }
.                        { return new Token("ERROR-UNKNOWN-TOKEN", yytext(), yyline, yycolumn); }
