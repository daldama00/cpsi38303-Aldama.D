%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "rpn.h"

int yylex();
void yyerror(const char *msg);
%}

%union {
    double num;
    NodeList* list;
}

%token <num> NUMBER
%token PLUS MINUS MULT DIV
%token SIN COS TAN
%token LPAREN RPAREN

%type <num> expression
%type <list> list

%%

input:
      /* empty */
    | input expression '\n' { printf("= %f\n", $2); }
    ;

expression:
      NUMBER
    | expression expression PLUS { $$ = $1 + $2; }
    | expression expression MINUS { $$ = $1 - $2; }
    | expression expression MULT { $$ = $1 * $2; }
    | expression expression DIV { $$ = $1 / $2; }
    | expression SIN { $$ = sin($1); }
    | expression COS { $$ = cos($1); }
    | expression TAN { $$ = tan($1); }
    | LPAREN list RPAREN { $$ = evaluate_list($2); }
    ;

list:
      /* empty */ { $$ = NULL; }
    | list expression { $$ = append($1, $2); }
    ;

%%

void yyerror(const char *msg) {
    printf("Parse error: %s\n", msg);
}

