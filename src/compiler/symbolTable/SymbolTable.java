package compiler.symbolTable;

import java.util.HashMap;

import compiler.tree.Tipo;

public class SymbolTable {
	private HashMap<String, Object> hmLocal;
	private HashMap<String, Object> hmGlobal;
	private Tipo tipoAtual = null;
	private Boolean fDeclGlobal = true;
	private int countIndiceVar = 0;
	private static SymbolTable instance = null;

	public SymbolTable() {
		hmLocal = new HashMap<String, Object>();
		hmGlobal = new HashMap<String, Object>();
	}

	public static SymbolTable getInstance() {
		if (instance == null) {
			instance = new SymbolTable();
			return instance;
		}
		return instance;
	}

	public int getCountIndiceVar() {
		return countIndiceVar;
	}

	public void setCountIndiceVar(int countIndiceVar) {
		this.countIndiceVar = countIndiceVar;
	}

	public void setFDeclGlobal() {
		this.fDeclGlobal = true;
	}

	public void disableFDeclGlobal() {
		this.fDeclGlobal = false;
	}

	public Boolean isDeclGlobal() {
		if (fDeclGlobal==true){
			return true;
		}else{
			return false;	
		}	
	}

	public Tipo getTipoAtual() {
		return this.tipoAtual;
	}

	public void setTipoAtual(Tipo t) {
		this.tipoAtual = t;
	}

	public void clearLocal() {
		this.hmLocal.clear();
	}

	// retorna True se o nome existe na tabela

	
	public boolean nameExistsGlobal(String id){
		if (hmGlobal.get(id)!=null){
			return true;
		}else{			
			return false;
		}
	}

	// retorna True se o nome existe na tabela
	public boolean nameExistsLocal(String id) {
		if (hmLocal.get(id)!=null){
			return true;
		}else{			
			return false;
		}
	}
	
	public Object getGlobal(String id) {
		if (hmGlobal.get(id)!=null){
			return hmGlobal.get(id);
		}else{			
			return null;
		}
	}

	public Object getLocal(String id) {
		if (hmLocal.get(id)!=null){
			return hmLocal.get(id);
		}else{			
			return null;
		}
	}



/*	public void putGlobal(String nome, Object objeto) {
		hmGlobal.put(nome, objeto);
	}

	public void putLocal(String nome, Object objeto) {
		hmLocal.put(nome, objeto);
	}*/
	
	public void put(String nome, Object objeto) {
		// ver como fica a local e global
		if (hmLocal == null) {
			hmGlobal.put(nome, objeto);
		} else {
			hmLocal.put(nome, objeto);
		}
	}
}