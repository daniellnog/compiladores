package compiler.tree;

import java.util.LinkedList;
import java.util.List;

import compiler.tree.command.DeclVariavel;

public class NomeComArgumentos {
	private LinkedList<DeclVariavel> paramFormais;
	private String identificador;

	public NomeComArgumentos(String identificar, LinkedList<DeclVariavel> paramFormais) {
		this.paramFormais = paramFormais;
		this.identificador = identificar;
	}

	public Boolean verificarSemantica() {
		return null;
	}

	public String gerarCodigoIntermediario(String filename) {
		return null;
	}
}
