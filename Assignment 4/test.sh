#!/bin/bash

bison -d roman.y
flex roman.l
gcc roman.tab.c lex.yy.c -o roman -lm
./roman
