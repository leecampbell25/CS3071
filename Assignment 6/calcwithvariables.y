%{
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
int yylex();
void yyerror(char* s);

void setSymbol(char c, int value);
int getSymbol(char c);
int hasValue(char c);
int symbols ['z'-'a'];
int values ['z'-'a'];

%}

/* declare tokens */

%token ASSIGN ADD SUB MUL DIV PRINT VAR NUM SEMICOL

%%
calclist:
 | calclist statement SEMICOL
 ;

statement: VAR ASSIGN expr  { setSymbol($1, $3); }
 | PRINT expr               { printf("%d\n", $2); }
 ;

expr: expr ADD factor      { $$ = $1 + $3; }
 | expr SUB factor         { $$ = $1 - $3; }
 | factor                  { $$ = $1; }
 ;

factor: factor MUL value      { $$ = $1 * $3; }
 | factor DIV value           { $$ = $1 / $3; }
 | value                      { $$ = $1; }
 ;

value: SUB value            { $$ = -$2; }
 | VAR                      { if (hasValue($1)){$$ = getSymbol($1);}
                                else {yyerror("syntax error");}
                            }
 | NUM                      { $$ = $1; }
 ;

%%

void setSymbol(char c, int value)
{
  int i = c - 'a';
  symbols[i] = value;
  values[i] = 1;
}

int getSymbol(char c)
{
  int i = c - 'a';
  return symbols[i];

}

int hasValue(char c)
{
  int i = c - 'a';
  return values[i];
}

int main()
{
  yyparse();
  return 0;
}

void yyerror(char* s)
{
  printf("%s\n", s);
  exit(0);
}
