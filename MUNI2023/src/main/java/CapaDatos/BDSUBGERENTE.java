package CapaDatos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Entidades.SUBGERENTE;

public class BDSUBGERENTE {
	//objetos para la conexion con mysql
	private String Driver = "com.mysql.cj.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost:3306/muni23";
	private String Usuario = "root";
	private String Password = "root";

	// objetos que operan con la bdd de my sql

	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	private ArrayList<SUBGERENTE> Lista;

	//metodos constructores

	public BDSUBGERENTE() {
		try {
			Class.forName(Driver);
			Cn = DriverManager.getConnection(URL, Usuario, Password);
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}
	//metodo para listar tecnicos

	public ArrayList<SUBGERENTE> Listar(){
		String SQL = "SELECT * FROM SUBGERENTE";
		Lista = new ArrayList<>();
		try {
			Cmd = Cn.createStatement();
			Rs = Cmd.executeQuery(SQL);
			while (Rs.next()) {
				Lista.add(new SUBGERENTE(Rs.getString("COD_GER"),
						Rs.getString("NOM_GER"),
						Rs.getString("APE_GER"),
						Rs.getString("DNI_GER")
						));

			}
			Rs.close();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
		return Lista;
	}
	//metodo para buscar un tecnico

	public SUBGERENTE Buscar(String id) {
		String SQL = "SELECT * FROM SUBGERENTE WHERE COD_GER=?";
		SUBGERENTE ObjC = null;
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, id);
			Rs = Stmt.executeQuery();
			if(Rs.next()) {
				ObjC = new SUBGERENTE(Rs.getString("COD_GER"),
						Rs.getString("NOM_GER"),
						Rs.getString("APE_GER"),
						Rs.getString("DNI_GER"));
			}
			Rs.close();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}

		return ObjC;

	}
	//metodo para insertar tecnico
	public void Insertar(SUBGERENTE ObjC) {
		String SQL = "insert into SUBGERENTE VALUES(?,?,?,?)";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, ObjC.getCOD_GER()+"");
			Stmt.setString(2, ObjC.getNOM_GER()+"");
			Stmt.setString(3, ObjC.getAPE_GER()+"");
			Stmt.setString(4, ObjC.getDNI_GER()+"");
			Stmt.execute();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	public void Modificar(SUBGERENTE ObjC) {
		String SQL = "update  SUBGERENTE set NOM_GER=?,APE_GER=?, DNI_GER=? WHERE COD_GER ";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(4, ObjC.getCOD_GER()+"");
			Stmt.setString(1, ObjC.getNOM_GER()+"");
			Stmt.setString(2, ObjC.getAPE_GER()+"");
			Stmt.setString(3, ObjC.getDNI_GER()+"");
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	public void Suprimir(String id) {
		String SQL = "delete from SUBGERENTE where COD_GER = ? ";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, id);
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}
}
