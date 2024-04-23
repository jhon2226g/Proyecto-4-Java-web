<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page session ="true" %>
<%@ page import = "CapaNegocio.*" %>
<%@ page import = "Entidades.Tecnico"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
<meta charset="ISO-8859-1">
    <title>Inicio de Sesi�n</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<% %>
<body>
	<%
		HttpSession sesion = request.getSession();
		BSTecnicos LT = new BSTecnicos();
		List<Tecnico> Lista = new ArrayList<>();
		Lista = LT.Listar();
		String Enlace="";
	%>


    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h2 class="text-center">Inicio de Sesi�n</h2>
                <form>
                    <div class="form-group">
                        <label for="usuario">Usuario:</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contrase�a:</label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                    </div>
                    <button onclick="iniciarSesion()" type='reset' class='btn btn-primary btn-block'>Iniciar Sesi�n</button>
                </form>
            </div>
        </div>
    </div>
</body>
	<script>
        function iniciarSesion() {
			<%
 			String id = request.getParameter("usuario");
			String pass = request.getParameter("contrasena");
			
			if(!((LT.Buscar(id)).equals(null))&&id.equals(pass)){
			%> window.location.href="Tecnicos.jsp?id="+id <%
			}
			else{
				%>
				alert("usuario o contrasena incorrecta");
			<%	
			}
			%>
        }
    </script>
</html>