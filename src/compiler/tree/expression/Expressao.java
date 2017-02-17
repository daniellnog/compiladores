package compiler.tree.expression;

import compiler.tree.Tipo;

public interface Expressao {
	Boolean verificarSemantica() ;
	Tipo getTipo();
	String gerarCodigoIntermediario(String filename);
}
