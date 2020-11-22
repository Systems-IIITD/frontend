
INSTALL the following packages:
sudo apt install flex bison

"example.flex" and "example.y" implement the lexer and parser
for the following grammar.

expr : expr PLUS expr
	| expr MUL expr
	| OPEN expr CLOSE
	| ID

"test1" contains an input string that belongs to the above grammar.
"make test1" prints a series of reductions that took place during
the parsing of the "test1" file.

In this homework, you have to extend this grammar to add the 
following production rules.

expr : IF ID THEN expr
	| IF ID THEN expr ELSE expr

Where IF, ELSE, and THEN are terminals corresponding to the
keywords "if", "else", and "then" respectively. You have to 
change the implementation of both lexer and parser to support 
these new production rules.


As we know that the above rules are ambiguous; you also have
to add precedence rules to resolve the ambiguity in a way that
"else" binds with the innermost unclosed "if". Another way of
removing the ambiguity would be to rewrite the grammar as
discussed in the class. Please feel free to pick either way.


After you add the above rules, "make test2" should be able to
parse the "test2" file.

Submit a report that contains your changes to lexer and parser,
and the series of reductions that took place while parsing
the "test2" file.

Please make sure that your implementation doesn't have any shift/reduce
conflict. A shift/reduce conflict means that your grammar is
either ambiguous or it doesn't belong to the grammar that can
be parsed using this tool.

References:
You can refer to the flex and bison manuals for the syntax of these tools.
