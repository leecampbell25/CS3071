# CS3071 - Compiler Design 

**Assignment 0 - fb1-1.l** <br>
Sample program provided to get started - counts number of characters, words and lines in a given input. 

**Assignment 1 - even.l** <br>
Write a flex program even.l which takes a sequence of integers as its input and outputs a count of the number of even integers and no other characters. Note put return 0; at end of the main function as codemark regards non zero exit status as an error.


**Assignment 2 - comments.l** <br>

Write a flex program comments.l which removes comments from a slightly odd 
programming language and sends the remaining code to its output.

** means regard the two asterisks and all following characters on that line 
up to a \n as comment.

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

**Assignment 3 - plates.l** <br>
Write a flex program that reads a whitespace (space tab or newline) seperated 
list of Irish car registration numbers and outputs the number of years since 
registration followed by a new line for each one. 

If an invalid registration is detected the program should output the word 
"INVALID" followed by a newline character.


The current specification for number plates is the format YYY-CC-SSSSSS. 
Those issued from 1987 to 2012 had the format YY-CC-SSSSSS. 

The components are:
YYY - a 3-digit year (e.g. 131 for January to June 2013; 132 for July to December 2013) 
YY from 1987-2012 - a 2-digit year (e.g. 87 for 1987; 05 for 2005)
CC - a 1- or 2-character County/City identifier (e.g. L for Limerick City and County; SO for County Sligo).
SSSSSS - a 1- to 6-digit sequence number, starting with the first vehicle registered in the county/city that year/period.

2014-present
C 	Cork 	
CE 	Clare 	
CN 	Cavan 	
CW 	Carlow 	
D 	Dublin 
DL 	Donegal 
G 	Galway 	
KE 	Kildare 	
KK 	Kilkenny 	
KY 	Kerry 	
L 	Limerick 
LD 	Longford 
LH 	Louth 	
LM 	Leitrim 
LS 	Laois 	
MH 	Meath 
MN 	Monaghan 	
MO 	Mayo 
OY 	Offaly 	
RN 	Roscommon 	
SO 	Sligo 	
T 	Tipperary 	
W 	Waterford 	
WH 	Westmeath 	
WX 	Wexford 	
WW 	Wicklow 	
Differences 1987-2013
L 	Limerick City
LK 	County Limerick

TN 	North Tipperary
TS 	South Tipperary
T	INVALID

W       Waterford City
WD 	County Waterford

Note you can define sub-parts of regular expressions in the definitions section and then
use these in the rule:
NUMBER  [0-9]...
COUNTY  KK|... 
YEAR  [0-9]...
%%
{YEAR}{COUNTY}{NUMBER}   { do stuff... }

**Assignment 4 - roman.l** <br>
Write a Bison program that takes a series of uppercase Roman 
numerals as input, parses them, and takes semantic actions to 
compute and print the corresponding Hindu-Arabic numeral.

Test cases will be newline seperated lists of Roman numerals and 
the program should output the corresponding Hindu-Arabic numeral 
followed by a new line for each one. 

If an invalid number is detected the program should output the words 
"syntax error" followed by a newline character to standard output
and then exit.

Your source code should be in two files, roman.l and roman.y, and
the defaults filenames lex.yy.c roman.tab.c roman.tab.h should
be generated. Put the two files roman.l and roman.y only into
a zip archive and use the codemark submit archive page to upload.
Do not use subdirectories.
Supported archive file formats include Zip, Tar-GZip, Tar-BZip2, RAR, 
7-zip, LhA, StuffIt and other old and obscure formats.

The Roman numeral system for representing numbers was developed 
around 500 b.c.

As the Romans conquered much of the world that was known to them, 
their numeral system spread throughout Europe, where Roman numerals 
remained the primary manner for representing numbers for centuries. 
Around a.d. 1300, Roman numerals were replaced throughout most of 
Europe with the more effective Hindu-Arabic system still used today.


Roman numerals, as used today, are based on seven symbols
Symbol 	I 	V 	X 	L 	C 	D 	M
Value 	1 	5 	10 	50 	100 	500 	1,000 

The original pattern for Roman numerals used the symbols I, V, and X 
(1, 5, and 10) as simple tally marks. Each marker for 1 (I) added a 
unit value up to 5 (V), and was then added to (V) to make the 
numbers from 6 to 9:

            I, II, III, IIII, V, VI, VII, VIII, VIIII, X.

The numerals for 4 (IIII) and 9 (VIIII) proved problematic (among 
other things, they are easily confused with III and VIII), and are 
generally replaced with IV (one less than 5) and IX (one less than 10). 
This feature of Roman numerals is called subtractive notation.

The numbers from 1 to 10 (including subtractive notation for 4 and 9) 
are expressed in Roman numerals as follows:

            I, II, III, IV, V, VI, VII, VIII, IX, X.

The system being basically decimal, tens and hundreds follow the same pattern:

Thus 10 to 100 (counting in tens, with X taking the place of I, L taking the 
place of V and C taking the place of X):

            X, XX, XXX, XL, L, LX, LXX, LXXX, XC, C.

Note that 40 (XL) and 90 (XC) follow the same subtractive pattern as 4 and 9.

Similarly, 100 to 1000 (counting in hundreds):

            C, CC, CCC, CD, D, DC, DCC, DCCC, CM, M.

Again - 400 (CD) and 900 (CM) follow the standard subtractive pattern. 

**Assignment 5 - romanCalc** <br>
Write a Bison program that takes a series of expressions using uppercase 
Roman numerals as input, and computes and prints the corresponding value.
The expressions should only contain + - / * (associativity is left to 
right, + and - have the same precedence as does * and /). The expressions
will use { and } as parentheses.

Test cases will be newline seperated lists of Roman numeral expressions
and the program should output the corresponding value followed by a new 
line for each one. Use - for a negative number and Z to indicate zero.
Use repeated Ms to indicate thousands, ie MMMMMM for 6000.

If an invalid input is detected the program should output the words 
"syntax error" followed by a newline character to standard output
and then exit.

Your source code should be in two files, romcalc.l and romcalc.y, and
the defaults filenames lex.yy.c romcalc.tab.c romcalc.tab.h should
be generated. Put the two files romcalc.l and romcalc.y only into
a zip archive and use the codemark submit archive page to upload.
Do not use subdirectories.
Supported archive file formats include Zip, Tar-GZip, Tar-BZip2, RAR, 
7-zip, LhA, StuffIt and other old and obscure formats.


**Assignment 6 - CalcWithVariables** <br>
Implement a calculator using Bison that supports variables. Variables can be any of
the 26 lower case letters. Numbers can be in the range zero to nine.
':=' will be used for assignment and each statement will be terminated by a semicolon.
Whitespace and newlines should be ingored on input.
Operations used will be addition, subtraction, multiplication and
(integer) division. The calculator should support a unary minus. 
The calculator should support a 'print' command which
prints a variables value followed by a newline.

Example input:
a:=6;
b:=a+7-4;
print b;

If an invalid input is detected the program should output the words 
"syntax error" followed by a newline character to standard output
and then exit.

Your source code should be in two files, calcwithvariables.l and calcwithvariables.y, and
the defaults filenames lex.yy.c calcwithvariables.tab.c calcwithvariables.tab.h should
be generated. Put the two files calcwithvariables.l and calcwithvariables.y only into
a zip archive and use the codemark submit archive page to upload.
Do not use subdirectories.
Supported archive file formats include Zip, Tar-GZip, Tar-BZip2, RAR, 
7-zip, LhA, StuffIt and other old and obscure formats.


