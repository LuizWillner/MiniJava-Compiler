%%

%class Calc
%unicode
%public
%function yylex
%type Token

%{}
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
INTEGER = {DIGIT}+
FLOAT = {INTEGER}\.{INTEGER}
NUMBER = {FLOAT} | {INTEGER}
WHITESPACE = [ \t\n\r ]+

%%

{NUMBER}+            { return new Token("NUMBER", yytext()); }
"+"                  { return new Token("PLUS", yytext()); }
"-"                  { return new Token("MINUS", yytext()); }
"*"                  { return new Token("MULT", yytext()); }
"/" | "//"           { return new Token("DIV", yytext()); }
"**"                 { return new Token("POW", yytext()); }
"("                  { return new Token("LPAREN", yytext()); }
")"                  { return new Token("RPAREN", yytext()); }
{WHITESPACE}         { /* ignore */ }
// <<EOF>>              { return new Token("EOF", ""); }
.                    { return new Token("UNKNOWN-TOKEN", yytext()); }
