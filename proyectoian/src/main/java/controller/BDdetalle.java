package controller;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.detalle;

public class BDdetalle {
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
	private ArrayList<detalle> Lista;

	public BDdetalle() {
		try {
			Class.forName(Driver);
			Cn = DriverManager.getConnection(URL, Usuario , Password);

		}catch (Exception e) {
			System.out.println("EROOR:" + e.getMessage());
		}
	}

	public List<detalle> ListarVenta(String IdVenta){
		String SQL = "CALL Listardetallexventa(?)";
		Lista = new ArrayList<>();
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, IdVenta);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					Lista.add(new detalle(Rs.getString("IdVenta"),
							Rs.getString("IdProducto"),
							Rs.getInt("Cantidad"),
							Rs.getDouble("PrecioUnidad"),
							Rs.getString("Estado")
							));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR EN CARGA DE TABLA PRODUCTOS :" + e.getMessage());
		}
		return Lista;
	}

	public void suprimirVenta(String IdVenta){
		String SQL = "CALL Listardetallexventa(?)";
		String SQL1 = "delete from Detalle where IdVenta=? ";

		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, IdVenta);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					Stmt = Cn.prepareCall(SQL1);
					Stmt.setString(1, IdVenta);
					Stmt.executeUpdate();
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR EN CARGA DE TABLA PRODUCTOS :" + e.getMessage());
		}
	}
	public void suprimir(String id){
		String SQL1 = "delete from Detalle where IdProducto=? ";

		try {
					Stmt = Cn.prepareCall(SQL1);
					Stmt.setString(1, id);
					Stmt.executeUpdate();
		} catch (Exception e) {
				System.out.println("ERROR EN CARGA DE TABLA PRODUCTOS :" + e.getMessage());
		}
	}
	//metodo para listar tecnicos
	public detalle Buscar(String id) {
		String SQL = "select * from Detalle where IdVenta = ?";
		detalle ObjC = null;
		try{
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, id);
			Rs = Stmt.executeQuery();
			if(Rs.next()) {
				ObjC = new detalle(
						Rs.getString("IdVenta"),
						Rs.getString("IdProducto"),
						Rs.getInt("Cantidad"),
						Rs.getDouble("PrecioUnidad"),
						Rs.getString("Estado")
						);
			}
			Rs.close();
		}catch (Exception e) {
			System.out.println("ERROR:"+ e.getMessage());
		}
		return ObjC;
	}
	public void Insertar(detalle ObjC) {
		String SQL = "insert into Detalle values(?,?,?,?,?)";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, ObjC.getIdVenta());
			Stmt.setString(2, ObjC.getIdProducto());
			Stmt.setInt(3, ObjC.getCantidad());
			Stmt.setDouble(4, ObjC.getPrecioUnidad());
			Stmt.setString(5, ObjC.getEstado());

			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	public void Modificar (detalle ObjC) {
		String SQL = "update Detalle set IdVenta=?,Cantidad=?, PrecioUnidad=?,"
				+ "Estado=? where IdProducto=? ";
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(5, ObjC.getIdProducto());
			Stmt.setString(1, ObjC.getIdVenta());
			Stmt.setInt(2, ObjC.getCantidad());
			Stmt.setDouble(3, ObjC.getPrecioUnidad());
			Stmt.setString(4, ObjC.getEstado());


			Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	public double MontoTotal(String id){
		String SQL ="CALL Listardetallexventa(?)";
		double monto = 0;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, id);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					monto += Rs.getDouble("PrecioUnidad");
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR:" + e.getMessage());
		}
		return monto;
	}

}
