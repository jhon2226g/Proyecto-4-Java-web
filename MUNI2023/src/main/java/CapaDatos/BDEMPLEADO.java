package CapaDatos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Entidades.EMPLEADO;

public class BDEMPLEADO {
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
		private ArrayList<EMPLEADO> Lista;

		//metodos constructores

		public BDEMPLEADO() {
			try {
				Class.forName(Driver);
				Cn = DriverManager.getConnection(URL, Usuario, Password);
			} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
			}
		}
		//metodo para listar tecnicos

		public ArrayList<EMPLEADO> Listar(){
			String SQL = "SELECT * FROM EMPLEADO";
			Lista = new ArrayList<>();
			try {
				Cmd = Cn.createStatement();
				Rs = Cmd.executeQuery(SQL);
				while (Rs.next()) {
					Lista.add(new EMPLEADO(Rs.getString("COD_EMP"),
							Rs.getString("NOM_EMP"),
							Rs.getString("APE_EMP"),
							Rs.getString("TELEF_EMP"),
							Rs.getString("DNI_EMP"),
							Rs.getString("CARG_EMP"),
							Rs.getString("DIREC_EMP")
							));

				}
				Rs.close();
			} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
			}
			return Lista;
		}
		//metodo para buscar un tecnico

		public EMPLEADO Buscar(String id) {
			String SQL = "SELECT * FROM EMPLEADO WHERE COD_EMP=?";
			EMPLEADO ObjC = null;
			try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, id);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjC = new EMPLEADO(Rs.getString("COD_EMP"),
							Rs.getString("NOM_EMP"),
							Rs.getString("APE_EMP"),
							Rs.getString("TELEF_EMP"),
							Rs.getString("DNI_EMP"),
							Rs.getString("CARG_EMP"),
							Rs.getString("DIREC_EMP")
							);
				}
				Rs.close();
			} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
			}

			return ObjC;

		}
		//metodo para insertar tecnico
		public void Insertar(EMPLEADO ObjC) {
			String SQL = "insert into EMPLEADO VALUES(?,?,?,?,?,?,?)";
			try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, ObjC.getCOD_EMP()+"");
				Stmt.setString(2, ObjC.getNOM_EMP()+"");
				Stmt.setString(3, ObjC.getAPE_EMP()+"");
				Stmt.setString(4, ObjC.getTELEF_EMP()+"");
				Stmt.setString(5, ObjC.getDNI_EMP()+"");
				Stmt.setString(6, ObjC.getCARG_EMP()+"");
				Stmt.setString(7, ObjC.getDIREC_EMP()+"");
				Stmt.execute();
			} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
			}
		}

		public void Modificar(EMPLEADO ObjC) {
			String SQL = "update  EMPLEADO set NOM_EMP=?,APE_EMP=?, TELEF_EMP=?, DNI_EMP=?, CARG_EMP=?, DIREC_EMP=?, WHERE COD_EMP ";
			try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(7, ObjC.getCOD_EMP()+"");
				Stmt.setString(1, ObjC.getNOM_EMP()+"");
				Stmt.setString(2, ObjC.getAPE_EMP()+"");
				Stmt.setString(3, ObjC.getTELEF_EMP()+"");
				Stmt.setString(4, ObjC.getDNI_EMP()+"");
				Stmt.setString(5, ObjC.getCARG_EMP()+"");
				Stmt.setString(6, ObjC.getDIREC_EMP()+"");
				Stmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
			}
		}

		public void Suprimir(String id) {
			String SQL = "delete from EMPLEADO where COD_EMP = ? ";
			try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, id);
				Stmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
			}
		}
}
