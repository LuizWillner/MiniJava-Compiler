package calculator;
%%

%class Calc
%unicode
%public
%function yylex
%type Token
%line
%column

%{}
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
INTEGER = {DIGIT}+
FLOAT = {INTEGER}\.{INTEGER}
WHITESPACE = [ \t\n\r ]+

%%

{FLOAT}              { return new Token("FLOAT", yytext(), yyline, yycolumn); }
{INTEGER}            { return new Token("INTEGER", yytext(), yyline, yycolumn); }
"+"                  { return new Token("PLUS", yytext(), yyline, yycolumn); }
"-"                  { return new Token("MINUS", yytext(), yyline, yycolumn); }
"*"                  { return new Token("MULT", yytext(), yyline, yycolumn); }
"//"                 { return new Token("INTDIV", yytext(), yyline, yycolumn); }
"/"                  { return new Token("DIV", yytext(), yyline, yycolumn); }
"**"                 { return new Token("POW", yytext(), yyline, yycolumn); }
"("                  { return new Token("LPAREN", yytext(), yyline, yycolumn); }
")"                  { return new Token("RPAREN", yytext(), yyline, yycolumn); }
{WHITESPACE}         { /* ignore */ }
<<EOF>>              { return new Token("EOF", "", yyline, yycolumn); }
.                    { return new Token("ERROR-UNKNOWN-TOKEN", yytext(), yyline, yycolumn); }
