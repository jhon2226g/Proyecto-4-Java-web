package CapaNegocio;
import java.util.ArrayList;

import CapaDatos.BDContrato;
import Entidades.Contrato;

public class BSContrato {
	private BDContrato ObjBD;

	public BSContrato() {
		ObjBD = new BDContrato();
	}

	public ArrayList<Contrato> Listar(){
		return ObjBD.Listar();
	}

	public Contrato Buscar(String NUM_CON) {
		return ObjBD.Buscar(NUM_CON);
	}
	public void Insertar(Contrato ObjC) {
		ObjBD.Insertar(ObjC);
	}
	public void Modificar(Contrato ObjC) {
		ObjBD.Modificar(ObjC);
	}
	public void Suprimir(String NUM_CON) {
		ObjBD.Suprimir(NUM_CON);
	}

	// metodos

	private int getNumId(Contrato con) {
		String n = con.getNUM_CON().substring(3);
		int num = Integer.parseInt(n);
		return num;
	}

	private String convertirCorrelativo(int n) {
		String CO ="CON";
		String ceros = n+"";
		int m = 5 - ceros.length();
		for(int i = 0; i < m;i++) {
			if(i!=m-1) {
				CO+= "0";
			} else {
				CO+= ceros;
			}
		}
		return CO;
	}

	public String nuevoid() {
		String id ="";
		ArrayList<Contrato> lista = ObjBD.Listar();

		for(int i=1;i<lista.size();i++) {

			if(lista.get(i)!=null&&!lista.isEmpty()) {
			int num2 = getNumId(lista.get(i));
			int num1 = getNumId(lista.get(i-1));
			int dif = num2-num1;
			if(dif>1) {
				id = convertirCorrelativo(num1+1);
				break;
				}
			else {
				id = convertirCorrelativo(num2+1);
				}
			}

		}

		return id;
	}
}
