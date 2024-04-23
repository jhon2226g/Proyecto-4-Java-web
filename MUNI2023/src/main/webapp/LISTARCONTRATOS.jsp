<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Entidades.Contrato" %>
<%@ page import="CapaNegocio.BSContrato" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRUD</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<%
		BSContrato ObjN = new BSContrato();
		List<Contrato> Lista = new ArrayList<>();
		Lista = ObjN.Listar();
	%>
	<h3>MANTENIMIENTO DE LA TABLA CONTRATO</h3>
	<a href= add.jsp class = "btn btn-primary">Registrar Contrato</a>
	<table class="table">
		<tr>
			<th>NÚMERO CONTRATO</th>
			<th>CÓDIGO TÉCNICO</th>
			<th>FECHA INICIO</th>
			<th>FECHA FIN</th>
			<th>FECHA CONTRATO</th>
			<th>CÓDIGO GERENTE</th>
			<th>CÓDIGO EMPLEADO</th>
			<th>ESTADO</th>
			<th>OPCIONES</th>
		</tr>
		<%for(Contrato ObjC : Lista) {
			String linkView = "<a href = view.jsp?id=" + ObjC.getNUM_CON() + ">Ver</a>";
			String linkEdit = "<a href = edit.jsp?id=" + ObjC.getNUM_CON() + ">Editar</a>";
			String linkDel = "<a href = del.jsp?id=" + ObjC.getNUM_CON() + ">Suprimir</a>";
			String color = "";
			switch(ObjC.getESTADOS()){
			case 0 :  color = "color:red";break;
			case 1 :  color = "color:blue";break;
			case 2 :  color = "color:lime";break;
			default :  color = "color:red";
			}
		%>
			<tr>
				<td><%=ObjC.getNUM_CON()%></td>
				<td><%=ObjC.getCOD_TEC()%></td>
				<td><%=ObjC.getFECH_INI()%></td>
				<td><%=ObjC.getFECH_FIN()%></td>
				<td><%=ObjC.getFECH_CON()%></td>
				<td><%=ObjC.getCOD_GER()%></td>
				<td><%=ObjC.getCOD_EMP()%></td>
				<td style=<%=color %>><strong><h1>*</h1></strong></td>
				<td><%=linkView%> | <%=linkEdit%> | <%=linkDel %></td>
			</tr>
		<%} %>
	</table>
	
</body>
</html>