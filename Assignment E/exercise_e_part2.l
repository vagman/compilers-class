/* <IMPORTS> */
%{
%}
/* </IMPORTS> */
/* <RULES AND TOKENS> */
given (?i:given)

point (?i:point)
line (?i:line)
triangle (?i:triangle)
square (?i:square)
pentagon (?i:pentagon)
/* </RULES AND TOKENS> */
/* <REGULAR EXPRESSIONS> */
%%
^{given}[ \t]*$ {printf("Oops! You forgot to enter a geometric entity and its name. Please try again.\n");}
^{given}[ \t]*({point}|{line}|{triangle}|{square}|{pentagon})[ \t]*$ {printf("Oops! You forgot to enter the geometric entity's name. Please try again.\n");}
^{given}[ \t]*([A-H]{1,5})[ \t]*$ {printf("Oops! You forgot to enter a geomteric entity. Please try again.\n");}
^({point}|{line}|{triangle}|{square}|{pentagon})[ \t]*$ {printf("Oops! You forgot to enter a verb and geometric entity's name. Please try again.\n");}
^{given}[ \t]*({point}|{line}|{triangle}|{square}|{pentagon})[ \t]*([a-h]{1,5})[ \t]*$ {printf("Oops! Only capital letters allowed for geometric entity's name. Please try again [A-H].\n");}

^{given} {printf("--> %s: is a verb.\n", yytext);} /* Verb is recognised!  */
{point}|{line}|{triangle}|{square}|{pentagon} {printf("--> %s: is a geometric entity.\n", yytext);}  /* geometric entity is recognised! */
[A-H]*[A][A-H]*[A][A-H]*|[A-H]*[B][A-H]*[B][A-H]*|[A-H]*[C][A-H]*[C][A-H]*|[A-H]*[D][A-H]*[D][A-H]*|[A-H]*[E][A-H]*[E][A-H]*|[A-H]*[F][A-H]*[F][A-H]*|[A-H]*[G][A-H]*[G][A-H]*|[A-H]*[H][A-H]*[H][A-H]* {printf("Oops! You entered some letter twice. Please try again: %s\n", yytext);}
{point}[ \t]*[A-H]*[I-Z]*[A-H]*{2,}\n|{line}[ \t]*[A-H]*[I-Z]*[A-H]*\n|{line}[ \t]*[A-Z]{3,}\n|{triangle}[ \t]*[A-Z]{1,2}\n|{triangle}[ \t]*[A-Z]{4,}\n|{square}[ \t]*[A-Z]{1,3}\n|{square}[ \t]*[A-Z]{5,}\n|{pentagon}[ \t]*[A-Z]{1,4}\n|{pentagon}[ \t]*[A-Z]{6,} {printf("Oops! Invalid geometric entity's name. Please try again.\n");}
[I-Z]+ {printf("Oops! Invalid geometric entity's name. Please try again.\n");}


[A-H]{1}|[A-H]{2}|[A-E]{3}|[A-E]{4}|[A-E]{5}  {printf("--> %s: is a geometric entity's name.\n", yytext);}   /* geometric entity's name is recognised! */

[ \t\n]+ 
.
%%
/*</ REGULAR EXPRESSIONS> */



int main(){
yylex();
}