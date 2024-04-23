<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Productos" %>
<%@ page import="controller.CarritoBD" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Carrito de Compras</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	</head>
<body>
	<%
		HttpSession sesion = request.getSession();
		String IdPro = request.getParameter("id");
		CarritoBD ObjBD = new CarritoBD();
		Productos ObjP = new Productos();
		ObjP = ObjBD.InfoProducto(IdPro);
	%>
	<form action="agregar.jsp">
		<table class="table">
			<tr>
				<td>IdProducto</td><td><input name="txtid" value=<%=ObjP.getIdProducto()%> readonly/></td>
			</tr>
			<tr>
				<td>Descripcion</td><td><%=ObjP.getDescripcion()%></td>
			</tr>
			<tr>
				<td>Precio Unidad</td><td><%=ObjP.getPrecioUnidad()%></td>
			</tr>
			<tr>
				<td>Imagen</td><td><img src=img/<%=ObjP.getImagen()%> width=200 height=200/></td>
			</tr>
			<tr>
				<td>Cantidad</td><td><input name="txtcant"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Añadir al Carrito" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form>
	<a href="javascript:history.back()">Seleccionar otro producto</a>
</body>
</html>