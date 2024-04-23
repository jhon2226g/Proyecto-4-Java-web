<%@page import="modelo.venta"%>
<%@page import="controller.BDVentas"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="componentes/header.jsp" %>
	<h1>MIS COMPRAS</h1>
<% BDVentas ven =new BDVentas(); 
	List<venta> Lista = new ArrayList<>();
	Lista = ven.ListarxCliente((String)session.getAttribute("idsesion"));
	
	%>
<table class="table">
		<tr>
			<th>CÓDIGO VENTA</th>
			<th>MONTO PAGADO</th>
			<th>FECHA DE PAGO</th>
			<th>ESTADO</th>
			<th>OPCION</th>
			
		</tr>
		<%
		for(venta ObjC : Lista) {
			String linkView = "<a href =ver.jsp?idventa="+ ObjC.getIdVenta()+" >Detalle</a>";
			String color = "";
			String mensaje = "";
			switch(Integer.parseInt(ObjC.getEstado())){
			case 0 : mensaje = "Entregado"; color = "color:blue";break;
			case 1 : mensaje = "En Distribucion"; color = "color:lime";break;
			default :  color = "color:red";
			}
		%>
			<tr>

				<td><%=ObjC.getIdVenta()%></td>
				<td><%=ObjC.getMontoTotal()%></td>
				<td><%=ObjC.getFechaVenta()%></td>
				<td style=<%=color %>><strong><%=mensaje %></strong></td>
				<td><%=linkView%></td>
			</tr>
		<%} %>
	</table>
</body>
</html>