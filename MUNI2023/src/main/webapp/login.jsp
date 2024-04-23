<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page session="true" %>
<%@ page import="CapaNegocio.*" %>
<%@ page import="Entidades.Tecnico" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inicio de Sesi�n</title>
</head>
<%
String error = null;
error = request.getParameter("e");
%>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h1 class="card-title text-center">Iniciar Sesi�n</h1>
                        <form class="login" action="verificarsesion.jsp" method="post">
                            <div class="mb-3">
                                <label for="usuario" class="form-label">Usuario:</label>
                                <input type="text" id="usuario" name="usuario" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="contrasena" class="form-label">Contrase�a:</label>
                                <input type="password" id="contrasena" name="contrasena" class="form-control" required>
                            </div>
                            </div>
                            <%if(error!=null){ %>
                            <div class="text-center">
                                <p style="color:red"><%=error%></p>
                            </div>
                            <%} %>
                            <div class="text-center">		
                                <input type="submit" value="Iniciar Sesi�n" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>