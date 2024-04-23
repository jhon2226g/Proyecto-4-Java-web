<%@page import="modelo.Productos"%>
<%@page import="controller.CarritoBD"%>
<%@page import="controller.BDdetalle"%>
<%@page import="modelo.detalle"%>
<%@ include file="componentes/header.jsp" %>
<table class="table">
		<tr>
			<th>ITEM</th>
			<th>DESCRIPCION</th>
			<th>CANTIDAD</th>
			<th>MONTO PAGADO</th>
			<th></th>
			
		</tr>
		<%
		CarritoBD pro = new CarritoBD();
		Productos p = null;
		ArrayList<detalle> Lista = null;
		Lista = (ArrayList<detalle>)det.ListarVenta((String)request.getParameter("idventa"));
		int i= 1;
		double total=0;
		for(detalle ObjC : Lista) {
			p = pro.InfoProducto(ObjC.getIdProducto());
			total +=ObjC.monto();
		%>
			<tr>
				<td><%=i%></td>
				<td><%=p.getDescripcion()%></td>
				<td><%=ObjC.getCantidad()%></td>
				<td><%=ObjC.monto()%></td>
			</tr>
			
		<%i++;} %>
		<tr bgcolor=Yellow>
				<th colspan=3>TOTAL GENERAL</th>
				<th><%=total %></th><th></th>
			</tr>
	</table>
</body>
</html>