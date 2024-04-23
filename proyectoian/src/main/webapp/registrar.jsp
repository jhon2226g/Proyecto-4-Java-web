<%@page import="controller.BDClientes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registrate</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<h1>REGISTRATE</h1>
</head>
<body>
	
	<%
		BDClientes cli = new BDClientes();
	%>
	
	<form action="servlet" method="post">
		<input type = "hidden" name = "op" value = "1">
		<table class="table">
			<tr>
				<td>APELLIDOS</td><td><input name="txtape"/></td>
			</tr>
			<tr>
				<td>NOMBRES</td><td><input name="txtnom"/></td>
			</tr>
			<tr>
				<td>DIRECCION</td><td><input name="txtdirec"/></td>
			</tr>
			<tr>
				<td>FECHA DE NACIMIENTO</td><td><input name="txtfecha"/></td>
			</tr>
			<tr>
				<td>SEXO</td><td><input name="txtsex"/></td>
			</tr>
			<tr>
				<td>CORREO</td><td><input name="txtcorreo"/></td>
			</tr>
			<tr>
				<td>CONTRASEÑA</td><td><input name="txtcontra"/></td>
			</tr>
			<tr>
				<td><input type="submit" value =" Registrarse" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form>
</body>
</html>