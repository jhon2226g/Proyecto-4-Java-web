<%@page import="controller.BDdetalle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%@ page import="modelo.*" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
	<!--
		1er PASO : Recuperar el valor del "id" => request.getParameter("id")
		2do PASO : Buscar en el carrito de compras "cesto" => (ArrayList) y luego eliminarlo 
	 -->
	<%
	try{
		
		String id = (String)request.getParameter("id");
		HttpSession MiSesion = request.getSession();
        // Declarar un ArrayList de tipo carrito
        ArrayList<detalle> Lista = null;
        // Recuperando los elementos almacenados en la sesion
       	Lista = (ArrayList<detalle>)MiSesion.getAttribute("cesto");
		
        for (int i = 0; i < Lista.size(); i++) {
            if (Lista.get(i).getIdProducto().equals(id)) {
            	Lista.remove(i);
                break; // Se encontró el elemento, salir del bucle
            }
        }
	}finally{
		response.sendRedirect("carrito.jsp");
	}
	
	
%>
	 
</body>
</html>