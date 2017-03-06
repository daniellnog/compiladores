package compiler.syntax;
import java_cup.runtime.Symbol;

%%

%class Lexer
%public
%cup
%line
%column


whiteSpace=([ \t\n\r]+)
ide=[a-z]([a-zA-Z_]|[0-9])*
numero=[0-9]
reais=[0-9]*"."[0-9]+|[0-9]+"."[0-9]*
char="'"([0-9]|[a-zA-Z]|\n|\t|" "|":"|"("|")"|",")"'"

%%

{whiteSpace} { 
	// Caracteres ignorados.
	// Nenhum token retornado.
}

//line e column servem para fazer a contagem de linhas e colunas

">>" [^<] ~"<<" { }
"**" [^\n]* { }

"<>" { return new Symbol(sym.DIFERENTE_QUE, yyline, yycolumn); }
"<=" { return new Symbol(sym.MENOR_OU_IGUAL, yyline, yycolumn); }
">=" { return new Symbol(sym.MAIOR_OU_IGUAL, yyline, yycolumn); }
"<" { return new Symbol(sym.MENOR_QUE, yyline, yycolumn); }
">" { return new Symbol(sym.MAIOR_QUE, yyline, yycolumn); }

":=" { return new Symbol(sym.ATRIBUICAO, yyline, yycolumn); }
"=" { return new Symbol(sym.IGUAL_QUE, yyline, yycolumn); }

"+" { return new Symbol(sym.SOMA, yyline, yycolumn); }
"-" { return new Symbol(sym.SUB, yyline, yycolumn); }
"*" { return new Symbol(sym.MULT, yyline, yycolumn); }
"/" { return new Symbol(sym.DIV, yyline, yycolumn); }
"%" { return new Symbol(sym.RESTO, yyline, yycolumn); }
"and"	{ return new Symbol(sym.AND, yyline, yycolumn); }
"or"    { return new Symbol(sym.OR, yyline, yycolumn); }
"not"   { return new Symbol(sym.NOT, yyline, yycolumn); }



"(" { return new Symbol(sym.ABRE_PAR, yyline, yycolumn); }
")" { return new Symbol(sym.FECHA_PAR, yyline, yycolumn); }
";" { return new Symbol(sym.PONTO_VIRGULA, yyline, yycolumn); }
"," { return new Symbol(sym.VIRGULA, yyline, yycolumn); }
"{" { return new Symbol(sym.ABRE_CHAVE, yyline, yycolumn); }
"}" { return new Symbol(sym.FECHA_CHAVE, yyline, yycolumn); }

"if"     { return new Symbol(sym.KEY_IF, yyline, yycolumn); }
"proc"     { return new Symbol(sym.KEY_PROC, yyline, yycolumn); }
"else"     { return new Symbol(sym.KEY_ELSE, yyline, yycolumn); }
"while"     { return new Symbol(sym.KEY_WHILE, yyline, yycolumn); }
"return"     { return new Symbol(sym.KEY_RETURN, yyline, yycolumn); }
"float"     { return new Symbol(sym.KEY_FLOAT, yyline, yycolumn); }
"char"     { return new Symbol(sym.KEY_CHAR, yyline, yycolumn); }
//"void"     { return new Symbol(sym.VOID, yyline, yycolumn); }
"prnt"     { return new Symbol(sym.KEY_PRINT, yyline, yycolumn); }
"int"     { return new Symbol(sym.KEY_INT, yyline, yycolumn); }
"and"     { return new Symbol(sym.AND, yyline, yycolumn); }
"or"     { return new Symbol(sym.OR, yyline, yycolumn); }
"not"     { return new Symbol(sym.NOT, yyline, yycolumn); }
"var"     { return new Symbol(sym.KEY_VAR, yyline, yycolumn); }


{char} { return new Symbol(sym.CHAR_LITERAL, yytext()); }
{ide}   { return new Symbol(sym.IDENTIFICADOR, yytext()); }
{numero}+  { return new Symbol(sym.INT_LITERAL, yytext()); }
{reais} { return new Symbol(sym.FLOAT_LITERAL, yytext()); }


. { 
    // Casa com qualquer caracter que nao casar com as expressoes anteriores.
    System.out.println("Caracter ilegal:" + yytext() +" Linha:"+ yyline + " Coluna:" + yycolumn);
    return null;
}

<<EOF>> {
	// Casa com o fim do arquivo apenas.
	return new Symbol(sym.EOF);
}