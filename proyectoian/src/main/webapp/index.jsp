<%@ include file="componentes/header.jsp" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import="modelo.Categorias" %>
<%@ page session="true" %>
	<%	
		CarritoBD ObjBD = new CarritoBD();
		List<Categorias> Lista = new ArrayList<>();
		Lista = ObjBD.ListarCategorias();
		int columnas = 0;
	%>	
	<h1>CATEGORIAS:</h1>
	<table class="table">
		<tr>
		<% for(Categorias c : Lista){
			String imagen = "<img src=img/" + c.getImagen() + " width=150 height=150";
			String enlace = "<a href=verproductos.jsp?id=" + c.getIdCategoria() + 
							" >Ver Productos</a>"; 
			if(columnas % 3 == 0) out.print("</tr><tr>");
		%>
			<td><%=c.getDescripcion()%><br/>
				<%=imagen%><br/>
				<%=enlace%>
			</td>
		<% columnas++; 
			} %>
	</table>
</body>
</html>