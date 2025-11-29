all: rpn

rpn: parser.tab.c lex.yy.c rpn.c main.c
	bison -d parser.y
	flex lexer.l
	gcc -o rpn parser.tab.c lex.yy.c rpn.c main.c -lm

clean:
	rm -f rpn parser.tab.* lex.yy.c

