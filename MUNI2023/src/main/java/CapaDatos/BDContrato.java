package CapaDatos;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Entidades.Contrato;


public class BDContrato {
	// Objetos para la conexión con MySQL
	private String Driver = "com.mysql.cj.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost:3306/muni23";
	private String Usuario = "root";
	private String Password = "root";

	// Objetos que operan con la BD de MYSQL
	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	private ArrayList<Contrato> Lista;

	//Método constructor
	public BDContrato() {
		try {
			Class.forName(Driver);
			Cn = DriverManager.getConnection(URL,Usuario, Password);
		} catch (Exception e) {
			System.out.println("ERROR:"+ e.getMessage());
		}
	}

	// Método para listar los colaboradores
	public ArrayList<Contrato> Listar(){
		String SQL ="SELECT*FROM CONTRATO";
		Lista = new ArrayList<>();
		try {
				Cmd = Cn.createStatement();
				Rs = Cmd.executeQuery(SQL);
				while(Rs.next()) {
					Lista.add(new Contrato(Rs.getString("NUM_CON"),
											Rs.getString("COD_TEC"),
											Rs.getString("FECH_INI"),
											Rs.getString("FECH_FIN"),
											Rs.getString("FECH_CON"),
											Rs.getString("COD_GER"),
											Rs.getString("COD_EMP"),
											Rs.getInt("ESTADO"),
											Rs.getDouble("SUELDO"),
											Rs.getString("AREA")));

				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return Lista;
	}

	// Método para buscar un Contrato
	public Contrato Buscar(String NUM_CON) {
		String SQL = "SELECT*FROM CONTRATO WHERE NUM_CON=? ";
		Contrato ObjC = null;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, NUM_CON);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjC =  new Contrato(Rs.getString("NUM_CON"),
							Rs.getString("COD_TEC"),
							Rs.getString("FECH_INI"),
							Rs.getString("FECH_FIN"),
							Rs.getString("FECH_CON"),
							Rs.getString("COD_GER"),
							Rs.getString("COD_EMP"),
							Rs.getInt("ESTADO"),
							Rs.getDouble("SUELDO"),
							Rs.getString("AREA"));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return ObjC;
	}
	public Contrato BuscarxEmpleado(String COD_EMP) {
		String SQL = "SELECT*FROM CONTRATO WHERE COD_EMP=? ";
		Contrato ObjC = null;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, COD_EMP);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjC =  new Contrato(Rs.getString("NUM_CON"),
							Rs.getString("COD_TEC"),
							Rs.getString("FECH_INI"),
							Rs.getString("FECH_FIN"),
							Rs.getString("FECH_CON"),
							Rs.getString("COD_GER"),
							Rs.getString("COD_EMP"),
							Rs.getInt("ESTADO"),
							Rs.getDouble("SUELDO"),
							Rs.getString("AREA"));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return ObjC;
	}
	// Método para insertar colaboradores
	public void Insertar(Contrato ObjC) {
		String SQL = "insert into CONTRATO values(?,?,?,?,?,?,?,?,?,?)";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, ObjC.getNUM_CON());
			Stmt.setString(2, ObjC.getCOD_TEC());
			Stmt.setString(3, ObjC.getFECH_INI());
			Stmt.setString(4, ObjC.getFECH_FIN());
			Stmt.setString(5, ObjC.getFECH_CON());
			Stmt.setString(6, ObjC.getCOD_GER());
			Stmt.setString(7, ObjC.getCOD_EMP());
			Stmt.setInt(8, ObjC.getESTADOS());
			Stmt.setDouble(9, ObjC.getSUELDO());
			Stmt.setString(10, ObjC.getAREA());
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}
	// Método para insertar colaboradores
	public void Modificar (Contrato ObjC) {
		String SQL = "update CONTRATO set COD_TEC=?,FECH_INI=?, FECH_FIN=?, "
				+ "FECH_CON=?, COD_GER=?, COD_EMP=?, ESTADO=?,SUELDO=?, AREA=? where NUM_CON=? ";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(10, ObjC.getNUM_CON());
			Stmt.setString(1, ObjC.getCOD_TEC());
			Stmt.setString(2, ObjC.getFECH_INI());
			Stmt.setString(3, ObjC.getFECH_FIN());
			Stmt.setString(4, ObjC.getFECH_CON());
			Stmt.setString(5, ObjC.getCOD_GER());
			Stmt.setString(6, ObjC.getCOD_EMP());
			Stmt.setInt(7, ObjC.getESTADOS());
			Stmt.setDouble(8, ObjC.getSUELDO());
			Stmt.setString(9, ObjC.getAREA());
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	// Método para suprimir colaboradores
	public void Suprimir (String id ) {
		String SQL = "delete from CONTRATO where NUM_CON=? ";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, id);
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}
}



