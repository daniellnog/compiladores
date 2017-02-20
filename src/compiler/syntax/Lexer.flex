package doxa.version;


//PEDRO PIRES BARRETO
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

"<>" { return new Token(TokenType.DIFERENTE, yyline, yycolumn); }
"<=" { return new Token(TokenType.MENOR_IGUAL, yyline, yycolumn); }
">=" { return new Token(TokenType.MAIOR_IGUAL, yyline, yycolumn); }
"<" { return new Token(TokenType.MENOR, yyline, yycolumn); }
">" { return new Token(TokenType.MAIOR, yyline, yycolumn); }

":=" { return new Token(TokenType.ATRIBUICAO, yyline, yycolumn); }
"=" { return new Token(TokenType.IGUAL, yyline, yycolumn); }

"+" { return new Token(TokenType.MAIS, yyline, yycolumn); }
"-" { return new Token(TokenType.MENOS, yyline, yycolumn); }
"*" { return new Token(TokenType.VEZES, yyline, yycolumn); }
"/" { return new Token(TokenType.DIV, yyline, yycolumn); }
"%" { return new Token(TokenType.MOD, yyline, yycolumn); }
"and"	{ return new Token(TokenType.AND, yyline, yycolumn); }
"or"    { return new Token(TokenType.OR, yyline, yycolumn); }
"not"   { return new Token(TokenType.NOT, yyline, yycolumn); }



"(" { return new Token(TokenType.ABRE_PAR, yyline, yycolumn); }
")" { return new Token(TokenType.FECHA_PAR, yyline, yycolumn); }
";" { return new Token(TokenType.PT_VIRG, yyline, yycolumn); }
"," { return new Token(TokenType.VIRG, yyline, yycolumn); }
"{" { return new Token(TokenType.ABRE_CHAVE, yyline, yycolumn); }
"}" { return new Token(TokenType.FECHA_CHAVE, yyline, yycolumn); }

"if"     { return new Token(TokenType.IF, yyline, yycolumn); }
"proc"     { return new Token(TokenType.PROC, yyline, yycolumn); }
"else"     { return new Token(TokenType.ELSE, yyline, yycolumn); }
"while"     { return new Token(TokenType.WHILE, yyline, yycolumn); }
"return"     { return new Token(TokenType.RETURN, yyline, yycolumn); }
"float"     { return new Token(TokenType.FLOAT, yyline, yycolumn); }
"char"     { return new Token(TokenType.CHAR, yyline, yycolumn); }
"void"     { return new Token(TokenType.VOID, yyline, yycolumn); }
"prnt"     { return new Token(TokenType.PRNT, yyline, yycolumn); }
"int"     { return new Token(TokenType.INT, yyline, yycolumn); }
"and"     { return new Token(TokenType.AND, yyline, yycolumn); }
"or"     { return new Token(TokenType.OR, yyline, yycolumn); }
"not"     { return new Token(TokenType.NOT, yyline, yycolumn); }
"var"     { return new Token(TokenType.VAR, yyline, yycolumn); }


{char} { return new Token(TokenType.CHAR_LITERAL, yytext()); }
{ide}   { return new Token(TokenType.IDENTIFICADOR, yytext()); }
{numero}+  { return new Token(TokenType.INT_LITERAL, yytext()); }
{reais} { return new Token(TokenType.FLOAT_LITERAL, yytext()); }


. { 
    // Casa com qualquer caracter que nao casar com as expressoes anteriores.
    System.out.println("Caracter ilegal:" + yytext() +" Linha:"+ yyline + " Coluna:" + yycolumn);
    return null;
}

<<EOF>> {
	// Casa com o fim do arquivo apenas.
	return new Token(TokenType.EOF);
}