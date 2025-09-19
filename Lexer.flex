%%

%class Lexer
%unicode
%public
%function yylex
%type String

%%

[0-9]+       { return "NUM"; }
[a-zA-Z]+    { return "ID"; }
[ \t\n\r]+   { /* ignora espaços */ }
.            { return "TOKEN_DESCONHECIDO"; }
