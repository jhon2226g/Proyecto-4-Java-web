package CapaNegocio;
import java.util.ArrayList;

import CapaDatos.BDSUBGERENTE;
import Entidades.SUBGERENTE;
public class BSSUBGERENTE {
	private BDSUBGERENTE ObjBD;

	public BSSUBGERENTE() {
		ObjBD = new BDSUBGERENTE();
	}

	public ArrayList<SUBGERENTE> Listar(){
		return ObjBD.Listar();
	}

	public SUBGERENTE Buscar(String id) {
		return ObjBD.Buscar(id);
	}

	public void Insertar(SUBGERENTE ObjC) {
		ObjBD.Insertar(ObjC);
	}

	public void Modificar(SUBGERENTE ObjC) {
		ObjBD.Modificar(ObjC);
	}

	public void Suprimir (String id) {
		ObjBD.Suprimir(id);
	}
}

