package CapaDatos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Entidades.Tecnico;



public class BDTecnicos {
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
	private ArrayList<Tecnico> Lista;

	//metodos constructores

	public BDTecnicos() {
		try {
			Class.forName(Driver);
			Cn = DriverManager.getConnection(URL, Usuario, Password);
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}
	//metodo para listar tecnicos

	public ArrayList<Tecnico> Listar(){
		String SQL = "SELECT * FROM TECNICO";
		Lista = new ArrayList<>();
		try {
			Cmd = Cn.createStatement();
			Rs = Cmd.executeQuery(SQL);
			while (Rs.next()) {
				Lista.add(new Tecnico(Rs.getString("COD_TEC"),
						Rs.getString("NOM_TEC"),
						Rs.getString("APE_TEC"),
						Rs.getString("CARG_TEC")
						));

			}
			Rs.close();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
		return Lista;
	}
	//metodo para buscar un tecnico

	public Tecnico Buscar(String id) {
		String SQL = "SELECT * FROM TECNICO WHERE COD_TEC=?";
		Tecnico ObjC = null;
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, id);
			Rs = Stmt.executeQuery();
			if(Rs.next()) {
				ObjC = new Tecnico(Rs.getString("COD_TEC"),
						Rs.getString("NOM_TEC"),
						Rs.getString("APE_TEC"),
						Rs.getString("CARG_TEC"));
			}
			Rs.close();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}

		return ObjC;

	}
	//metodo para insertar tecnico
	public void Insertar(Tecnico ObjC) {
		String SQL = "insert into TECNICO VALUES(?,?,?,?)";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, ObjC.getCOD_TEC()+"");
			Stmt.setString(2, ObjC.getNOM_TEC()+"");
			Stmt.setString(3, ObjC.getAPE_TEC()+"");
			Stmt.setString(4, ObjC.getCARG_TEC()+"");
			Stmt.execute();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	public void Modificar(Tecnico ObjC) {
		String SQL = "update  TECNICO set NOM_TEC=?,APE_TEC=?,CARG_TEC=? WHERE COD_TEC=? ";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(4, ObjC.getCOD_TEC()+"");
			Stmt.setString(1, ObjC.getNOM_TEC()+"");
			Stmt.setString(2, ObjC.getAPE_TEC()+"");
			Stmt.setString(3, ObjC.getCARG_TEC()+"");
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	public void Suprimir(String id) {
		String SQL = "delete from Tecnico where COD_TEC = ? ";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, id);
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}
}
