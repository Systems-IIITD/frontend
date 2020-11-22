default: parser

parser: example_y.c example_f.c
	gcc -o parser example_y.c example_f.c

example_y.c example_y.h: example.y
	yacc -Werror -Wno-yacc -v -d -Wconflicts-sr -o example_y.c example.y

example_f.c: example.flex example_y.h
	flex -o example_f.c example.flex

test1: t1
t1: parser
	./parser test1

test2: t2
t2: parser
	./parser test2

clean:
	rm -rf *.c *.h *.output parser *~
