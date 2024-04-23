package CapaNegocio;

import java.util.ArrayList;

import CapaDatos.BDEMPLEADO;
import Entidades.EMPLEADO;
public class BSEMPLEADO {
	private BDEMPLEADO ObjBD;

	public BSEMPLEADO() {
		ObjBD = new BDEMPLEADO();
	}

	public ArrayList<EMPLEADO> Listar(){
		return ObjBD.Listar();
	}

	public EMPLEADO Buscar(String id) {
		return ObjBD.Buscar(id);
	}

	public void Insertar(EMPLEADO ObjC) {
		ObjBD.Insertar(ObjC);
	}

	public void Modificar(EMPLEADO ObjC) {
		ObjBD.Modificar(ObjC);
	}

	public void Suprimir (String id) {
		ObjBD.Suprimir(id);
	}
}