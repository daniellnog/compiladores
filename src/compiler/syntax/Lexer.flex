package doxa.version;


%%

%class Lexer
%public
%function nextToken
%type Token

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

"<>" { return new Symbol(Sym.DIFERENTE_QUE, yyline, yycolumn); }
"<=" { return new Symbol(Sym.MENOR_OU_IGUAL, yyline, yycolumn); }
">=" { return new Symbol(Sym.MAIOR_OU_IGUAL, yyline, yycolumn); }
"<" { return new Symbol(Sym.MENOR_QUE, yyline, yycolumn); }
">" { return new Symbol(Sym.MAIOR_QUE, yyline, yycolumn); }

":=" { return new Symbol(Sym.ATRIBUICAO, yyline, yycolumn); }
"=" { return new Symbol(Sym.IGUAL_QUE, yyline, yycolumn); }

"+" { return new Symbol(Sym.SOMA, yyline, yycolumn); }
"-" { return new Symbol(Sym.SUB, yyline, yycolumn); }
"*" { return new Symbol(Sym.MULT, yyline, yycolumn); }
"/" { return new Symbol(Sym.DIV, yyline, yycolumn); }
"%" { return new Symbol(Sym.RESTO, yyline, yycolumn); }
"and"	{ return new Symbol(Sym.AND, yyline, yycolumn); }
"or"    { return new Symbol(Sym.OR, yyline, yycolumn); }
"not"   { return new Symbol(Sym.NOT, yyline, yycolumn); }



"(" { return new Symbol(Sym.ABRE_PAR, yyline, yycolumn); }
")" { return new Symbol(Sym.FECHA_PAR, yyline, yycolumn); }
";" { return new Symbol(Sym.PONTO_VIRGULA, yyline, yycolumn); }
"," { return new Symbol(Sym.VIRGULA, yyline, yycolumn); }
"{" { return new Symbol(Sym.ABRE_CHAVE, yyline, yycolumn); }
"}" { return new Symbol(Sym.FECHA_CHAVE, yyline, yycolumn); }

"if"     { return new Symbol(Sym.KEY_IF, yyline, yycolumn); }
"proc"     { return new Symbol(Sym.KEY_PROC, yyline, yycolumn); }
"else"     { return new Symbol(Sym.KEY_ELSE, yyline, yycolumn); }
"while"     { return new Symbol(Sym.KEY_WHILE, yyline, yycolumn); }
"return"     { return new Symbol(Sym.KEY_RETURN, yyline, yycolumn); }
"float"     { return new Symbol(Sym.KEY_FLOAT, yyline, yycolumn); }
"char"     { return new Symbol(Sym.KEY_CHAR, yyline, yycolumn); }
"void"     { return new Symbol(Sym.VOID, yyline, yycolumn); }
"prnt"     { return new Symbol(Sym.KEY_PRINT, yyline, yycolumn); }
"int"     { return new Symbol(Sym.KEY_INT, yyline, yycolumn); }
"and"     { return new Symbol(Sym.AND, yyline, yycolumn); }
"or"     { return new Symbol(Sym.OR, yyline, yycolumn); }
"not"     { return new Symbol(Sym.NOT, yyline, yycolumn); }
"var"     { return new Symbol(Sym.KEY_VAR, yyline, yycolumn); }


{char} { return new Symbol(Sym.CHAR_LITERAL, yytext()); }
{ide}   { return new Symbol(Sym.IDENTIFICADOR, yytext()); }
{numero}+  { return new Symbol(Sym.INT_LITERAL, yytext()); }
{reais} { return new Symbol(Sym.FLOAT_LITERAL, yytext()); }


. { 
    // Casa com qualquer caracter que nao casar com as expressoes anteriores.
    System.out.println("Caracter ilegal:" + yytext() +" Linha:"+ yyline + " Coluna:" + yycolumn);
    return null;
}

<<EOF>> {
	// Casa com o fim do arquivo apenas.
	return new Symbol(Sym.EOF);
}