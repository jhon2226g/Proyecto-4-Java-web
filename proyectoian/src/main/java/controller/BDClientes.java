package controller;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import modelo.Cliente;

public class BDClientes {
	private String Driver = "com.mysql.cj.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost:3306/pro2023";
	private String Usuario = "root";
	private String Password = "root";

	// Objetos que operan con la BD de MYSQL
	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	private ArrayList<Cliente> Lista;

	public BDClientes() {
		try {
			Class.forName(Driver);
			Cn = DriverManager.getConnection(URL,Usuario, Password);
		} catch (Exception e) {
			System.out.println("ERROR:"+ e.getMessage());
		}
	}

	public ArrayList<Cliente> Listar(){
		String SQL ="SELECT*FROM Clientes";
		Lista = new ArrayList<>();
		try {
				Cmd = Cn.createStatement();
				Rs = Cmd.executeQuery(SQL);
				while(Rs.next()) {
					Lista.add(new Cliente(Rs.getString("IdCliente"),
							Rs.getString("Apellidos"),
							Rs.getString("Nombres"),
							Rs.getString("Direccion"),
							Rs.getString("FechaNacimiento"),
							Rs.getString("Sexo"),
							Rs.getString("Correo"),
							Rs.getString("Password"),
							Rs.getString("Estado")));

				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return Lista;
	}
	public Cliente Buscar(String NUM_CON) {
		String SQL = "SELECT*FROM Clientes WHERE IdCliente=? ";
		Cliente ObjC = null;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, NUM_CON);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjC =  new Cliente(Rs.getString("IdCliente"),
							Rs.getString("Apellidos"),
							Rs.getString("Nombres"),
							Rs.getString("Direccion"),
							Rs.getString("FechaNacimiento"),
							Rs.getString("Sexo"),
							Rs.getString("Correo"),
							Rs.getString("Password"),
							Rs.getString("Estado")
							);
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return ObjC;
	}
	public void Insertar(Cliente ObjC) {
		String SQL = "insert into Clientes values(?,?,?,?,?,?,?,?,?)";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, ObjC.getIdCliente());
			Stmt.setString(2, ObjC.getApellidos());
			Stmt.setString(3, ObjC.getNombres());
			Stmt.setString(4, ObjC.getDireccion());
			Stmt.setString(5, ObjC.getFechaNacimiento());
			Stmt.setString(6, ObjC.getSexo());
			Stmt.setString(7, ObjC.getCorreo());
			Stmt.setString(8, ObjC.getPassword());
			Stmt.setString(9, ObjC.getEstado());
			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}
	private int getNumId(Cliente con) {
		String n = con.getIdCliente().substring(3);
		int num = Integer.parseInt(n);
		return num;
	}

	private String convertirCorrelativo(int n) {
		String CO ="CLI";
		String ceros = n+"";
		int m = 6 - ceros.length();
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
		String id =convertirCorrelativo(2);
		ArrayList<Cliente> lista = Listar();

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
