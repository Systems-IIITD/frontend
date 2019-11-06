
%option noyywrap

%{
#include "example_y.h"
int lineno = 1;
%}

ID       [A-Za-z][A-Za-z0-9_]*

%%

"+"      { return PLUS; }
"*"      { return MUL; }
"("      { return OPEN; }
")"      { return CLOSE; }
{ID}     { snprintf(yylval.sym, 32, "%s", yytext); return ID; }
"\n"     { lineno++; }

[ \t\f\r\v]+ { }

<<EOF>> {
	lineno++;
	yyterminate();
}

. {
	printf("error # line:%d\n", lineno);
}

%%
