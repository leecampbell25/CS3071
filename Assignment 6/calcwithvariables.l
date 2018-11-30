%{
# include "calcwithvariables.tab.h"
void yyerror(char* s);
%}

%%
":="            { return ASSIGN; }
"+"             { return ADD; }
"-"             { return SUB; }
"*"             { return MUL; }
"/"             { return DIV; }
"print"         { return PRINT; }
[a-z]           { yylval = yytext[0]; return VAR; }
[0-9]+          { yylval = atoi(yytext); return NUM; }
";"             { return SEMICOL; }
[ \t\n]*        { }
.               { yyerror("syntax error"); }
%%
