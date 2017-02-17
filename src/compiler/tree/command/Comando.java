package compiler.tree.command;

import compiler.tree.Tipo;

public interface Comando {
	Boolean verificarSemantica();
	String gerarCodigoIntermediario(String filename);
}
