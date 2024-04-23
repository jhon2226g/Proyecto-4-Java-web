<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session ="true" %>
<%@ page import = "CapaNegocio.*" %>
<%@ page import = "CapaDatos.BDContrato" %>
<%@ page import = "Entidades.Tecnico"%>
<%@ page import = "Entidades.Contrato"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
HttpSession sesion = request.getSession();
String idtec = "";
sesion.getAttribute("idsesion");

BDContrato con = new BDContrato();
BSTecnicos LT = new BSTecnicos();
BSEMPLEADO LE = new BSEMPLEADO();

String usuario = request.getParameter("usuario");
String contrasena = request.getParameter("contrasena");
String Coorelativo = usuario.substring(0, 2);
Contrato C =null;
C = con.BuscarxEmpleado(usuario);

	 if (LT.Buscar(usuario)!=null&&contrasena.equals(usuario)) {
            // Credenciales válidas, redirige a la página deseada
            response.sendRedirect("LISTARCONTRATOS.jsp");
            sesion.setAttribute("idsesion",usuario);
        }else if (C!=null&&contrasena.equals(usuario)) {
            // Credenciales válidas, redirige a la página deseada
            response.sendRedirect("verDetalle.jsp?id="+C.getNUM_CON());
            sesion.setAttribute("idsesion",usuario);
        } else {
    	response.sendRedirect("login.jsp?e=usuario o contrasena incorrecta");
        }%>
</body>
</html>