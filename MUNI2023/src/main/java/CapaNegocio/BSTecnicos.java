package CapaNegocio;
import java.util.ArrayList;

import CapaDatos.BDTecnicos;
import Entidades.Tecnico;
public class BSTecnicos {
	private BDTecnicos ObjBD;

	public BSTecnicos() {
		ObjBD = new BDTecnicos();
	}

	public ArrayList<Tecnico> Listar(){
		return ObjBD.Listar();
	}

	public Tecnico Buscar(String id) {
		return ObjBD.Buscar(id);
	}

	public void Insertar(Tecnico ObjC) {
		ObjBD.Insertar(ObjC);
	}

	public void Modificar(Tecnico ObjC) {
		ObjBD.Modificar(ObjC);
	}

	public void Suprimir (String id) {
		ObjBD.Suprimir(id);
	}
}
