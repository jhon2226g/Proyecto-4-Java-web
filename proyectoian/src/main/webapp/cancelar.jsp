<%@page import="controller.BDVentas"%>
<%@page import="controller.BDdetalle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!--
		PASO 1 :Eliminar el objeto "cesto" de la sesion del proyecto
		PASO 2 : Retornar a la pagina principal "index.jsp" 
	 -->
	 
	 <%
	 try {
	        
	        session.removeAttribute("cesto");
	        
	        response.sendRedirect("index.jsp");
	    } catch (Exception e) {
	        out.println("Error: " + e.getMessage());
	    }
%>
</body>
</html>