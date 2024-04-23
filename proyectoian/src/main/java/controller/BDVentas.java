package controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import modelo.venta;


public class BDVentas {
	// objetos de conexion para mysql
		private String Driver = "com.mysql.cj.jdbc.Driver";
		private String URL = "jdbc:mysql://localhost:3306/pro2023";
		private String Usuario = "root";
		private String Password = "root";

		//objetos que operan con la bd de mysql

		private Connection Cn;
		private Statement Cmd;
		private CallableStatement Stmt;
		private ResultSet Rs;
		private ArrayList<venta> Lista;

		public BDVentas() {
			try {
				Class.forName(Driver);
				Cn = DriverManager.getConnection(URL, Usuario , Password);

			}catch (Exception e) {
				System.out.println("EROOR:" + e.getMessage());
			}
		}

		public ArrayList<venta> Listar(){
			String SQL ="SELECT*FROM Ventas";
			Lista = new ArrayList<>();
			try {
					Cmd = Cn.createStatement();
					Rs = Cmd.executeQuery(SQL);
					while(Rs.next()) {
						Lista.add(new venta(Rs.getString("IdVenta"),
												Rs.getString("IdCliente"),
												Rs.getString("FechaVenta"),
												Rs.getDouble("MontoTotal"),
												Rs.getString("Estado")));

					}
					Rs.close();
			} catch (Exception e) {
					System.out.println("ERROR:" + e.getMessage());
			}
			return Lista;
		}

		public ArrayList<venta> ListarxCliente(String idcliente){
			String SQL ="CALL ListarxCliente(?)";
			Lista = new ArrayList<>();
			try {
					Stmt = Cn.prepareCall(SQL);
					Stmt.setString(1, idcliente);
					Rs = Stmt.executeQuery();
					while(Rs.next()) {
						Lista.add(new venta(Rs.getString("IdVenta"),
												Rs.getString("IdCliente"),
												Rs.getString("FechaVenta"),
												Rs.getDouble("MontoTotal"),
												Rs.getString("Estado")));

					}
					Rs.close();
			} catch (Exception e) {
					System.out.println("ERROR:" + e.getMessage());
			}
			return Lista;
		}


		public void Insertar(venta ObjC) {
			String SQL = "insert into Ventas values(?,?,?,?,?)";
			try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, ObjC.getIdVenta());
				Stmt.setString(2, ObjC.getIdCliente());
				Stmt.setString(3, ObjC.getFechaVenta());
				Stmt.setDouble(4, ObjC.getMontoTotal());
				Stmt.setString(5, ObjC.getEstado());

				Stmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
			}
		}

		private int getNumId(venta con) {
			String n = con.getIdVenta().substring(3);
			int num = Integer.parseInt(n);
			return num;
		}

		private String convertirCorrelativo(int n) {
			String CO ="VEN";
			String ceros = n+"";
			int m = 8 - ceros.length();
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
			String id =convertirCorrelativo(1);
			ArrayList<venta> lista = Listar();

				if(!lista.isEmpty()) {
				int i = getNumId(lista.get(lista.size()-1));
				id=convertirCorrelativo(i+1);
				}
			return id;
		}
}
