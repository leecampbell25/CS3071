/* CS3071 Assignment 2

Write a flex program comments.l which removes comments from a slightly odd
programming language and sends the remaining code to its output.

** means regard the two asterisks and all following characters on that line as comment.

anything between { and } is comment, potentially across multiple lines.

a { inside a comment is just part of the comment.

a { not followed by } is regarded as a syntax error and your program
should output the phrase "syntax error\n" in place of the
the remaining input and exit when it detects this.

a } not preceded by a matching { is regarded as a syntax error and your
program should output the phrase "syntax error\n" and exit at this place.

between double-quote characters {} and ** are regarded as part of a
string and dont indicate comments.

there's no facility to put a double-quote inside a string.

Note put return 0; at end of the main function
as codemark regards non zero exit status as an error.

Lee Campbell - JS Integrated Computer Science 2018
campbel2@tcd.ie
27/09/18

 */

/* Defintions */
%{

%}

NEW_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
OLD_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW


/* Rules */
%%

 //(1)[3-8][1-2](\-){NEW_COUNTY}(\-)[1-9][0-9]{0-5}
[\n|\s| |  ]*[1][3-8][1-2][\-]{NEW_COUNTY}[\-][1-9][0-9]{0,5}[\n|\s| |  ]* {

  int year = yytext[1] - '0';
  int yearsOld = 8-year;
  printf("%d\n", yearsOld);
}

[\n|\s| |	]*[0-9][0-9][\-]{OLD_COUNTY}[\-][1-9][0-9]{0,5}[\n|\s| |	]* {

  int decade = yytext[0] - '0';
  //printf("Decade char %d\n", decade);
  decade = decade*10;
  //printf("Decade Cal %d\n", decade);
  int year = yytext[1] - '0';
  //printf("year char %d\n", decade);
  year = year + decade;
  //printf("Years %d\n", year);
  int yearsOld =0;

  if (year > 86)
  {
    yearsOld = 100 - year;
    yearsOld += 18;
  }

  else
  {
    yearsOld = 0;
    yearsOld = 18 - year;
  }

  printf("%d\n", yearsOld);
}

[\n|\s| |	]*.*[\n|\s| |	]* {printf("INVALID\n");}

%%
/* User code */
int main()
{
  yylex();
	return 0;
}
