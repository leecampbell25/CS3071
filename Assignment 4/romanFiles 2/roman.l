%option noyywrap

%{
# include "roman.tab.h"
void yyerror(char *s);
%}

%%

"I" {yylval = 1;return I;}
"II" {yylval = 2;return II;}
"III" {yylval = 3;return III;}
"IV" {yylval = 4;return IV;}
"V"  {yylval = 5;return V;}
"VI" {yylval = 6;return VI;}
"VII" {yylval = 7;return VII;}
"VIII" {yylval = 8;return VIII;}
"IX" {yylval = 9;return IX;}
"X" {yylval = 10;return X;}
"XX" {yylval = 20;return XX;}
"XXX" {yylval = 30;return XXX;}
"XL" {yylval = 40;return XL;}
"L" {yylval = 50;return L;}
"LX" {yylval = 60;return LX;}
"LXX" {yylval = 70;return LXX;}
"LXXX" {yylval = 80;return LXXX;}
"XC" {yylval = 90;return XC;}
"C" {yylval = 100;return C;}
"CC" {yylval = 200;return CC;}
"CCC" {yylval = 300;return CCC;}
"CD" {yylval = 400;return CD;}
"D" {yylval = 500;return D;}
"DC" {yylval = 600;return DC;}
"DCC" {yylval = 700;return DCC;}
"DCCC" {yylval = 800;return DCCC;}
"CM" {yylval = 900;return CM;}
"M" {yylval = 1000;return M;}
\n {return EOL;}

. {yyerror("syntax error\n");}
%%
