<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%@ page import="modelo.*" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import ="modelo.Cliente" %>
<%@ page import ="controller.BDVentas" %>
<%@ page import ="controller.BDClientes" %>
<%@ page import ="controller.BDdetalle" %>
<%@ page import ="modelo.detalle" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="componentes/header.jsp" %>

<%
	try {
            // Enlaces del carrito
            String enlace1 = "<a class = 'btn btn-primary' href=index.jsp>Seguir Comprando</a>";
            String enlace2 = "<a class = 'btn btn-primary' href=cancelar.jsp>Cancelar Compra</a>";  
            String enlace3 = "#"; 
			double Total = 0;
            
            if(session.getAttribute("idsesion")!=null){

            	enlace3= "<a class = 'btn btn-primary' href=comprar.jsp?mon="+Total+">Comprar</a>";
            } else {
            	enlace3= "<a class = 'btn btn-primary' href=login.jsp>Comprar</a>";
            	
            }
            // Variable de la clase BD
            CarritoBD ObjBD = new CarritoBD();

          // Construir la factura
            String tabla = "<table class='table'>";
                	tabla += "<tr bgcolor=Yellow>";
                    tabla += "<th>Item</th>";
                    tabla += "<th>IdProducto</th>";
                    tabla += "<th>Descripcion</th>";
                    tabla += "<th>Imagen</th>";
                    tabla += "<th>Precio</th>";
                    tabla += "<th>Cantidad</th>";
                    tabla += "<th>Sub-Total</th>";
                    tabla += "<th>Opciones</th>";
                tabla += "</tr>";
                
                
                // Recorrer todos los productos de Lista
                for(int i = 0; i < de.size(); i++){
                    Productos Obj = new Productos();
                    // Recuperar la informacion de cada producto del cesto
                    Obj = ObjBD.InfoProducto(de.get(i).getIdProducto());
                    String enlace = "suprimir.jsp?id="+Obj.getIdProducto();
                    double Precio = Obj.getPrecioUnidad();
                    int Cantidad = de.get(i).getCantidad();
                    double SubTotal = de.get(i).monto();
                    Total += SubTotal;
                    tabla += "<tr>";
                        tabla += "<td>"+(i+1)+"</td>";
                        tabla += "<td>"+Obj.getIdProducto()+"</td>";
                        tabla += "<td>"+Obj.getDescripcion()+"</td>";
                        tabla += "<td><img src=img/"+Obj.getImagen()+
                                " width=50 heigth=50></td>";
                        tabla += "<td>"+Precio+"</td>";
                        tabla += "<td>"+Cantidad+"</td>";
                        tabla += "<td>"+SubTotal+"</td>";
                        tabla += "<td><a class='btn btn-secondary' href="+enlace+">Suprimir</a></td>";
                    tabla +="</tr>";
                }
                tabla += "<tr bgcolor=Yellow><th colspan=6>TOTAL GENERAL</th><th>"+Total+"</th><th></th></tr>";
                tabla += "<tr><td colspan=8 align=center>[ "+enlace1+" ][ "+enlace2+" ][ "+enlace3+" ]</td></tr>";
            tabla += "</table>";
            out.print(tabla);
            
        } catch (Exception e) {
            // Manejar la excepción de manera específica
            e.printStackTrace();
        }finally {            
        	 if (out != null) {
                 out.close();
             }
        }
%>
</body>
</html>