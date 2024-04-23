<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Entidades.Contrato" %>
<%@ page import="CapaNegocio.BSContrato" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualizar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<h1>DATOS DEL CONTRATO</h1>
	<%
		String NUM_CON = request.getParameter("id");
		BSContrato ObjBD = new BSContrato();
		Contrato ObjC = ObjBD.Buscar(NUM_CON);
	%>
	<table class="table">
		<tr>
			<td>NÚMERO CONTRATO</td><td><%=ObjC.getNUM_CON()%></td>
		</tr>
		<tr>
			<td>CÓDIGO TÉCNICO</td><td><%=ObjC.getCOD_TEC()%></td>
		</tr>
		<tr>
			<td>FECHA INICIO</td><td><%=ObjC.getFECH_INI()%></td>
		</tr>
		<tr>
			<td>FECHA FIN</td><td><%=ObjC.getFECH_FIN()%></td>
		</tr>
		<tr>
			<td>FECHA CONTRATO</td><td><%=ObjC.getFECH_CON()%></td>
		</tr>
		<tr>
			<td>CÓDIGO GERENTE</td><td><%=ObjC.getCOD_GER()%></td>
		</tr>
		<tr>
			<td>CODIGO DE EMPLEADO</td><td><%=ObjC.getCOD_EMP()%></td>
		</tr>
			<tr>
				<td>ESTADOS</td><td><%=ObjC.getESTADOS()%></td>
			</tr>
			<tr>
				<td>SUELDO</td><td><%=ObjC.getSUELDO()%> </td>
			</tr>
			<tr>
				<td>AREA</td><td><%=ObjC.getAREA()%></td>
			</tr>
	</table>
	<tr>
		<td><a href=LISTARCONTRATOS.jsp>Regresar al Listado</a></td><td><a class = "btn btn-primary" href=verDetalle.jsp?id=<%=NUM_CON%>>Ver detalle</a></td>
	</tr>	
</body>
</html>