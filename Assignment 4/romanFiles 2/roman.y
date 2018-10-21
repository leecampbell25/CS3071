%{
#  include <stdio.h>
#  include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

/* declare tokens */
%token I II III IV V VI VII VIII IX X XX XXX XL L LX LXX LXXX XC C CC CCC CD D DC DCC DCCC CM M
%token EOL

%%

expr: /* nothing */
 | expr value EOL { printf("%d\n", $2); }
;

value: term
  | value term { if ($1+$2 > 1000 & $1 < 1000) {yyerror("syntax error\n");}
                      if ($1 != $2 || ($1 >= 1000 && $2 >= 1000))
                      {
                          $$ = $1 + $2;
                      }
                      else
                      {
                          yyerror("syntax error\n");
                      }
                    }

;

term: I {$$ = $1;}
 | II {$$ = $1;}
 | III {$$ = $1;}
 | IV {$$ = $1;}
 | V {$$ = $1;}
 | VI {$$ = $1;}
 | VII {$$ = $1;}
 | VIII {$$ = $1;}
 | IX {$$ = $1;}
 | X {$$ = $1;}
 | XX {$$ = $1;}
 | XXX {$$ = $1;}
 | XL {$$ = $1;}
 | L {$$ = $1;}
 | LX {$$ = $1;}
 | LXX {$$ = $1;}
 | LXXX {$$ = $1;}
 | XC {$$ = $1;}
 | C {$$ = $1;}
 | CC {$$ = $1;}
 | CCC {$$ = $1;}
 | CD {$$ = $1;}
 | D {$$ = $1;}
 | DC {$$ = $1;}
 | DCC {$$ = $1;}
 | DCCC {$$ = $1;}
 | CM {$$ = $1;}
 | M {$$ = $1;}
;

%%

int main()
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  printf("%s", s);
  exit(0);
}
