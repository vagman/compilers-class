/* Create a Flex program that accepts only the grammar shown in the assignment D.*/

%{
%}
varName [A-Za-z][A-Za-z0-9]*
%%

^{varName}(({varName}|[0-9]*)(("+"|"-"|"*"|"/"|"%"){1})(({varName}|[0-9]*))+)+(";")$  {printf("Error Message: Forgoten '='. Please try again!\n");}   /* Forgotten: = */
^{varName}("="){1}((({varName}|[0-9]*)("+"|"-"|"*"|"/"|"%"){1}))+(";")$  {printf("Error Message: You must enter at least 2 variables after the equality sign. Please try again!\n");} /* Forgotten: var1 */
^{varName}("="){1}((("+"|"-"|"*"|"/"|"%"){1})({varName}|[0-9]*)+)+(";")$  {printf("Error Message: You must enter at least 2 variables after the equality sign. Please try again!\n");} /* Forgotten: var2 */
^("="){1}(({varName}|[0-9]*)(("+"|"-"|"*"|"/"|"%"){1})(({varName}|[0-9]*))+)+(";")$  {printf("Error Message: Assign the value to a variable properly. Please try again!\n");} /* Forgoten var */
^{varName}("="){1}((({varName}|[0-9]*)(("+"|"-"|"*"|"/"|"%"){1}))+(({varName}|[0-9]*))+)+$  {printf("Error Message: You forgot ';' at the end of the command! PLease try again!\n");}  /* Forgoten: ; */
^{varName}("="){1}((({varName}|[0-9]*)(("+"|"-"|"*"|"/"|"%"){1}))+(({varName}|[0-9]*))+)+(";")$ {printf("Successful Lexical Analysis. Accepted: %s\n", yytext);} /* Success */
[ \t\n]*
.
%%
int main(){
yylex();
}