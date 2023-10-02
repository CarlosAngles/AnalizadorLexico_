%{
#include <stdio.h>
#include<string.h>
%}

digito     [0-9]
letra      [a-zA-z]

numero {digito}*
id  {letra}({letra}|{digito}|_)*
PC {letra}*

igual [=]
menor [<]

%option case-insensitive
%%
[ \t\n]+
select   { printf("PC: %s\n", yytext); }
from     { printf("PC: %s\n", yytext); }
where    { printf("PC: %s\n", yytext); }

{numero} { printf("NUMERO: %s\n", yytext); }
{igual} { printf("OPREL: %s\n", yytext); }
{menor} { printf("OPREL: %s\n", yytext); }
,  { printf("SIGNO: %s\n", yytext); }
{id} { printf("ID: %s\n", yytext); }

. {{ printf("Caracter no definido: %s\n", yytext); }}

%%


int main() {
    yylex();
    return 0;
}
