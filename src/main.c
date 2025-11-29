#include <stdio.h>

int yyparse();

int main() {
    printf("RPN Calculator (lex/yacc)\n");
    printf("Enter RPN expressions, press Enter to evaluate.\n");
    printf("Ctrl+C to exit.\n\n");
    yyparse();
    return 0;
}

