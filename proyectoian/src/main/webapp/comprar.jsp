<%@page import="modelo.detalle"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page session = "true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>compra</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<h1>COMPRA:</h1>
</head>
<body>
	<%
	Date fechaActual = new Date();
	double monto = 0;
	ArrayList<detalle> de = null;
    de = (ArrayList<detalle>)session.getAttribute("cesto");
	for(detalle d : de){
		monto += d.monto();
	}
	SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String fechaFormateada = formato.format(fechaActual);
	%>
	<form action="servlet" method="post">
		<input type = "hidden" name = "op" value = "3">
		<table class="table">
			<tr>
				<td>IDCLIENTE</td><td><input name="txtidcli" value='<%=session.getAttribute("idsesion")%>' readonly/></td>
			</tr>
			<tr>
				<td>FECHA DE COMPRA</td><td><input name="txtfecha" value ='<%=fechaFormateada%>' readonly/></td>
			</tr>
			<tr>
				<td>MONTO TOTAL A PAGAR</td><td><input name="txtmonto" value = '<%=monto%>' readonly/></td>
			</tr>
			<tr>
				<td><input type = "hidden" name="txtestado" value ="1"/></td>
			</tr>
			
			<tr>
				<td><input type="submit" value ="Pagar" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form>
</body>
</html>