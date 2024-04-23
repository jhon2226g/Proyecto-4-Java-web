<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CapaDatos.BDContrato" %>
<%@ page import="Entidades.Contrato" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
    <%@ page import="Entidades.EMPLEADO" %>
    <%@ page import="CapaDatos.BDEMPLEADO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
      <%
		String NUM_CON = request.getParameter("id");
		BDContrato ObjBD = new BDContrato();
		Contrato ObjP = null;
		ObjP = ObjBD.Buscar(NUM_CON);
		
		BDEMPLEADO OE = new BDEMPLEADO();
		ArrayList<EMPLEADO> LE= null;
		LE = OE.Listar();
	%>
	<form action="grabar">
	<input type = "hidden" name = "op" value="2"/>
		<table class="table">
			<tr>
				<td>NUMERO DE CONTRATO</td><td><input name="txtid" value=<%=ObjP.getNUM_CON()%> readonly/></td>
			</tr>
			<tr>
				<td>CODIGO DE TECNICO</td><td><input name="txtidtec" value=<%=ObjP.getCOD_TEC()%> readonly/></td>
			</tr>
			<tr>
				<td>FECHA DE INICIO</td><td><input name="txtFini" value=<%=ObjP.getFECH_INI()%> readonly/></td>
			</tr>
			<tr>
				<td>FECHA DE FIN</td><td><input name="txtFfin" value=<%=ObjP.getFECH_FIN()%> readonly/></td>
			</tr>	
			<tr>
				<td>FECHA DE CONTRATO</td><td><input name="txtFCRE" value=<%=ObjP.getFECH_CON()%> readonly/></td>
			</tr>
			<tr>
				<td>CODIGO DE GERENTE</td><td><input name="txtCodGer" value=<%=ObjP.getCOD_GER()%> readonly/></td>
			</tr>
			<tr>
				<td>CODIGO DE EMPLEADO</td><td><input name="cboEmp" value=<%=ObjP.getCOD_EMP()%> readonly/></td>
			</tr>
			<tr>
				<td>ESTADOS</td><td><input name="txtEs" value=<%=ObjP.getESTADOS()%> readonly/></td>
			</tr>
			<tr>
				<td>SUELDO</td><td><input name="txtSue" value=<%=ObjP.getSUELDO()%> readonly/></td>
			</tr>
			<tr>
				<td>AREA</td><td><input name="txtAre" value=<%=ObjP.getAREA()%> readonly/></td>
			</tr>

			<tr>
				<td><input type="submit" value="Confirmar" class= "btn btn-primary"/></td>
			</tr>
		</table>
	</form>
		 <a href="javascript:history.back()">regresar a la lista</a>
	

</body>
</html>