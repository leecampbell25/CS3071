/* CS3071 Assignment 1
* Write a flex program even.l which takes a sequence of integers
* as its input and outputs a count of the number of even integers
* and no other characters. Note put return 0; at end of the main function
* as codemark regards non zero exit status as an error.
*
* Lee Campbell - JS Integrated Computer Science 2018
* campbel2@tcd.ie
* 19/09/18
 */

/* Defintions */
%{
    int count = 0;
    int multi;
%}

/* Rules */
%%

\*\*.* {printf("%s", yytext);}

\{(.|\n)*\} {printf("%s", yytext);}

\{[^\{\}]*\} {}
\n {}
. {}

%%
/* User code */
int main()
{
  yylex();
	return 0;
}
