<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session ="true" %>
    <%@ page import="Entidades.EMPLEADO" %>
	<%@ page import="CapaNegocio.BSEMPLEADO" %>
	<%@ page import="CapaNegocio.BSContrato" %>
	<%@ page import="CapaDatos.BDEMPLEADO" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.List" %>
	<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insertar contrato</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
	<%
	Date fechaActual = new Date();
	// Define un formato para la fecha
	SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String fechaFormateada = formato.format(fechaActual);
	BDEMPLEADO OE = new BDEMPLEADO();
	ArrayList<EMPLEADO> LE= null;
	LE = OE.Listar();
	
	BSContrato con = new BSContrato();
	
	%>


	<h1> REGISTRAR CONTRATO</h1>
	
	 <form action ="grabar">
	 	<input type = "hidden" name = "op" value="3"/>
	 	<table class ="table">
	 		<tr>
	 			<td>IDCONTRATO</td><td><input name="txtid" value="<%=con.nuevoid()%>" readonly/></td>
	 		</tr>
	 		
	 		<tr>
	 			<td>IDEMPLEADO</td><td>
	 			<% if (LE != null && !LE.isEmpty()) { %>
   			 <SELECT name="cboEmp" id="combo">
     	   <% for (int i = 0; i < LE.size(); i++) {
     	       EMPLEADO e = LE.get(i);
     		   %>
       		 <option value="<%= e.getCOD_EMP() %>"><%= e.getNOM_EMP()+ ' ' +e.getAPE_EMP() %></option>
        	<% } %>
   		 </SELECT>
		<% } %></td>
	 		</tr>
	 		
	 		<tr>
	 			<td>CODIGO DEL TECNICO</td><td><input name="txtidtec" value=<%=session.getAttribute("idsesion")%> readonly/></td>
	 		</tr>
	 		<tr>
	 			<td>FECHA INICIAL</td><td><input name="txtFini"/></td>
	 		</tr>
	 		<tr>
	 			<td>FECHA FINAL</td><td><input name="txtFfin"/></td>
	 		</tr>
	 		<tr>
	 			<td>FECHA DE CREACION</td><td><input name="txtFCRE" value=<%=fechaFormateada%> readonly/></td>
	 		</tr>
	 		<tr>
	 			<td>ESTADO</td><td><input name="txtEs" value =0 readonly/></td>
	 		</tr>
	 		<tr>
	 			<td>SUELDO</td><td><input name="txtSue"/></td>
	 		</tr>
	 		<tr>
	 			<td>Area</td><td><input name="txtAre"/></td>
	 		</tr>
	 		<tr>
	 			<td colspan ="2"><input type = "submit" value ="crear" class= "btn btn-primary"/></td>
	 		</tr>
	 	</table>
	 </form>
	 <a href="javascript:history.back()">regresar a la lista</a>
</body>

</html>