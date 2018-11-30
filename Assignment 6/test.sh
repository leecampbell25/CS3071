#!/bin/bash

bison -d calcwithvariables.y
flex calcwithvariables.l
gcc calcwithvariables.tab.c lex.yy.c -o calcwithvariables -ll
./calcwithvariables
