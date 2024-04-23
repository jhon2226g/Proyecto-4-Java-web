<%@ page session="true" %>
<%@ page import="modelo.Productos" %>
<%@ page import ="controller.BDVentas" %>
<%@ page import="controller.CarritoBD" %>
<%@ include file="componentes/header.jsp" %>

	<%
		String IdCat = request.getParameter("id");
		CarritoBD ObjBD = new CarritoBD();
		List<Productos> Lista = new ArrayList<>();
		Lista = ObjBD.ListarProductos(IdCat);
		int columnas = 0;
	%>	
	<h1>Carrito de Compras</h1>
	<table class="table">
		<tr>
		<% for(Productos p : Lista){
			String imagen = "<img src=img/" + p.getImagen() + " width=150 height=150";
			String enlace = "<a class= 'btn btn-primary' href=verdetalle.jsp?id=" + p.getIdProducto() + 
							">Ver Detalle</a>"; 
			if(columnas % 3 == 0) out.print("</tr><tr>");
		%>
			<td><%=p.getDescripcion()%><br/>
				<%=imagen%><br/>
				<div>
				<%=enlace%><br/><br/>
				<input type = "hidden" name="txtcant" value=<%=1%>/>
				<a class= "btn btn-primary" href='agregar.jsp?txtid=<%=p.getIdProducto()%>'>Añadir al carrito</a>
				</div>
			</td>
		<% columnas++; 
			} %>
	</table>
	<a href=index.jsp>Seleccionar Otra Categoria</a>
</body>
</html>