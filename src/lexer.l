%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+"."[0-9]*   { yylval.num = atof(yytext); return NUMBER; }
[0-9]+            { yylval.num = atof(yytext); return NUMBER; }

"sin"             { return SIN; }
"cos"             { return COS; }
"tan"             { return TAN; }

"+"               { return PLUS; }
"-"               { return MINUS; }
"*"               { return MULT; }
"/"               { return DIV; }

"("               { return LPAREN; }
")"               { return RPAREN; }

[ \t\n]+          { /* ignore whitespace */ }

.                 { printf("Unknown token: %s\n", yytext); }

%%

