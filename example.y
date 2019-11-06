%{ 
#include <ctype.h> 
#include <stdio.h>

extern int lineno, yychar;
int yylex();
extern FILE *yyin;
extern char *yytext;

void yyerror(char *s)
{
	fprintf( stderr, "at line: %d syntax error near %s\n",
		lineno, yytext);
}
%} 

%union {
	int val;
	char sym[32];
};

%token PLUS      1 
%token MUL       2
%token OPEN      3
%token CLOSE     4
%token<sym> ID   5


%type<sym> expr
%start expr

%left PLUS
%left MUL

%% 
expr  :	expr PLUS expr              { printf("reduce using expr PLUS expr\n"); }
	  | expr MUL expr                 { printf("reduce using expr MUL expr\n"); }
	  | OPEN expr CLOSE               { printf("reduce using OPEN expr CLOSE\n"); }
	  | OPEN error CLOSE              { yyerrok; }
	  | ID                            { printf("reduce using id\n"); }

%% 

int main(int argc, const char *argv[])
{
	if (argc != 2) {
		printf("Pass the input file to parse!\n");
		return 0;
	}
	yyin = fopen(argv[1], "r");
	if (yyin == NULL) {
		printf("Unable to open : %s\n", argv[1]);
		return 0;
	}
	return yyparse();
}
