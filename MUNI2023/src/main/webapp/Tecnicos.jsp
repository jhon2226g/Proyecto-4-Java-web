<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "Entidades.Tecnico" %>
<%@ page import = "CapaNegocio.BSTecnicos" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<%
		BSTecnicos ObjN = new BSTecnicos();
		ArrayList <Tecnico> Lista = new ArrayList<>();
		Lista = ObjN.Listar();
	%>
	<h1>Mantenimiento de la tabla Tecnicos</h1>
	<table class="table">
		<tr>
			<th>cod. tecnico</th>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>Cargo</th>
			<th>opciones</th>
		</tr>
		<% for(Tecnico ObjC : Lista){
			String linkview = "<a href=view.jsp?id=" + ObjC.getCOD_TEC()+ ">VER</a>";
			String linkedit = "<a href=edit.jsp?id=" + ObjC.getCOD_TEC()+ ">EDITAR</a>";
			String linkdel = "<a href=del.jsp?id=" + ObjC.getCOD_TEC()+ ">SUPRIMIR</a>";
		
		%>
			<tr>
				<td><%=ObjC.getCOD_TEC()%></td>
				<td><%=ObjC.getNOM_TEC()%></td>
				<td><%=ObjC.getAPE_TEC()%></td>
				<td><%=ObjC.getCARG_TEC()%></td>
				<td><%=linkview%> | <%=linkedit%> | <%=linkdel%></td>
	
			</tr>
		<% } %>
	</table>

</body>
</html>