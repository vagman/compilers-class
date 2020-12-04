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
^({point}|{line}|{triangle}|{square}|{pentagon})[ \t]*$ {printf("Oops! You forgot to enter the verb and geometric entity's name. Please try again.\n");}
^{given} {printf("--> %s: is a verb.\n", yytext);} /* Verb is recognised!  */
{point}|{line}|{triangle}|{square}|{pentagon} {printf("--> %s: is a geometric entity.\n", yytext);}  /* geometric entity is recognised! */
^{given}[ \t]*({point}|{line}|{triangle}|{square}|{pentagon})[ \t]*[A-H]*([a-h])+[A-H]*([a-h])*[ \t]*$ {printf("Oops! Only capital letters allowed for geometric entity's name. Please try again [A-H].\n");}
{point}[ \t]*[A-H]{2,}\n|{line}[ \t]*[A-H]{1}\n|{line}[ \t]*[A-H]{3,}\n|{triangle}[ \t]*[A-E]{1,2}\n|{triangle}[ \t]*[A-E]{4,}\n|{square}[ \t]*[A-E]{1,3}\n|{square}[ \t]*[A-E]{5,}\n|{pentagon}[ \t]*[A-E]{1,4}\n|{pentagon}[ \t]*[A-E]{6,} {printf("Oops! Invalid geometric entity's name. Please try again.\n");}
[ \t]*[I-Z]+[ \t]*$ {printf("Oops! Invalid geometric entity's name. Please try again.\n");}

[A-H]{1,3}$ {printf("--> %s: is a geometric entity's name.\n", yytext);} 
[A-E]{4,5}$  {printf("--> %s: is a geometric entity's name.\n", yytext);}   /* geometric entity's name is recognised! */
[ \t\n]+ 
.
%%
/*</ REGULAR EXPRESSIONS> */



int main(){
yylex();
}