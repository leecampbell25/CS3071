/* CS3071 Assignment 3

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
[\n|\s|\t| ]*[1][3-8][1-2][\-]{NEW_COUNTY}[\-][1-9][0-9]{0,5}[\n|\s|\t| ]* {

  int year = yytext[1] - '0';
  int yearsOld = 8-year;
  printf("%d\n", yearsOld);
}

[\n|\s|\t| ]*[0-9][0-9][\-]{OLD_COUNTY}[\-][1-9][0-9]{0,5}[\n|\s|\t| ]* {

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

[\n|\s|\t| ]*.*[\n|\s|\t| ]* {printf("INVALID\n");}

%%
/* User code */
int main()
{
  yylex();
	return 0;
}
