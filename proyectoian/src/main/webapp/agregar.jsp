<%@page import="controller.BDVentas"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page session = "true" %>
<%@ page import ="controller.BDdetalle" %>
<%@ page import ="controller.CarritoBD" %>
<%@ page import ="controller.BDVentas" %>
<%@ page import ="modelo.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title></title>
</head>
<body>
    <%
    HttpSession MiSesion = request.getSession();
    ArrayList<detalle> lista = null;
    lista = (ArrayList<detalle>)MiSesion.getAttribute("cesto");
        String idpro = request.getParameter("txtid");
        String cantParam = request.getParameter("txtcant");
        int cant = 1; // Valor predeterminado en caso de que no se proporcione un valor válido

        if (cantParam != null && !cantParam.isEmpty())
            cant = Integer.parseInt(cantParam);

        CarritoBD car= new CarritoBD();
        Productos pro = car.InfoProducto(idpro);
        BDVentas ven = new BDVentas();

        
        detalle d = new detalle(ven.nuevoid(),
                idpro, cant, pro.getPrecioUnidad(), "0");
        //verificamos si ya hay un producto igual en la lista del carrito
        
        if(lista == null){
        	lista = new ArrayList<detalle>();
        	lista.add(d);
            }
        else{
        boolean NOencontrado = true;
            for (int i = 0; i < lista.size(); i++) {

            if ((lista.get(i).getIdProducto()).equals(d.getIdProducto())) {
            	d.setCantidad(lista.get(i).getCantidad() + cant);
                lista.set(i,d);
                NOencontrado = false;
                break;
            }
        }
        

        //si no se encontro entonces insertamos detalle
        if (NOencontrado) {
            lista.add(d);
        	}
        }
        if(cant!=0)MiSesion.setAttribute("cesto", lista);
        //redirigimos a la pagina de ver productos recuperando el id categoria del mismo producto
        response.sendRedirect("verproductos.jsp?id=" + pro.getIdCategoria());
    %>
</body>
</html>