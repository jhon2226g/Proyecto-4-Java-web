<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="Entidades.EMPLEADO" %>
	<%@ page import="CapaNegocio.BSEMPLEADO" %>
<%@ page import="Entidades.Contrato" %>
<%@ page import="CapaNegocio.BSContrato" %>
	<%@ page import="CapaDatos.BDEMPLEADO" %>
	    <%@ page import="java.util.List" %>
	<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<h1>EDITAR DATOS DEL CONTRATO</h1>
	<%
		String NUM_CON = request.getParameter("id");
		BSContrato ObjBD = new BSContrato();
		Contrato ObjC= null;
		ObjC = ObjBD.Buscar(NUM_CON);
		
		BDEMPLEADO OE = new BDEMPLEADO();
		ArrayList<EMPLEADO> LE= null;
		LE = OE.Listar();
		
		String opcionSeleccionada = ObjC.getCOD_EMP();
		
	%>
	<form action="grabar">
		<input type="hidden" name="op" value="1" />
		<table class="table">
			<tr>
				<td>NÚMERO CONTRATO</td><td><input name="txtid" value=<%=ObjC.getNUM_CON()%> readonly></td>
			</tr>
			<tr>
				<td>CÓDIGO TÉCNICO</td><td><input name="txtidtec" value=<%=ObjC.getCOD_TEC()%> readonly></td>
			</tr>
			<tr>
				<td>FECHA INICIO</td><td><input name="txtFini" value=<%=ObjC.getFECH_INI()%>></td>
			</tr>
			<tr>
				<td>FECHA FIN</td><td><input name="txtFfin" value=<%=ObjC.getFECH_FIN()%>></td>
			</tr>
			<tr>
				<td>FECHA CONTRATO</td><td><input name="txtFCRE" value=<%=ObjC.getFECH_CON()%>></td>
			</tr>
			<tr>
				<td>CÓDIGO GERENTE</td><td><input name="txtcodger" value=<%=ObjC.getCOD_GER()%> readonly></td>
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
				<td>ESTADOS</td><td><input name="txtEs" value=<%=ObjC.getESTADOS()%>></td>
			</tr>
			<tr>
				<td>SUELDO</td><td><input name="txtSue" value=<%=ObjC.getSUELDO()%> ></td>
			</tr>
			<tr>
				<td>ÁREA</td><td><input name="txtAre" value=<%=ObjC.getAREA()%>></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Grabar" class= "btn btn-primary"/></td>
			</tr>
		</table>
	</form>
</body>
<script>
            // JavaScript para establecer la opción seleccionada en función de la variable definida en JSP
            var opcionSeleccionada = "<%= opcionSeleccionada %>";
            var select = document.getElementById("combo");

            for (var i = 0; i < select.options.length; i++) {
                if (select.options[i].value === opcionSeleccionada) {
                    select.options[i].selected = true;
                    break;
                }
            }
        </script>
</html>