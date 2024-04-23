<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="controller.BDdetalle" %>
<%@ page import ="modelo.detalle" %>
<%@ page import ="modelo.Cliente" %>
<%@ page import ="controller.BDVentas" %>
<%@ page import ="controller.BDClientes" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>CATEGORIAS</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="index.jsp">INICIO</a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
    	
      <%
      BDdetalle det = new BDdetalle();
      ArrayList<detalle> de = null;
      de = (ArrayList<detalle>)session.getAttribute("cesto");
      String carro = "#";
      String cant = "";
      //verificamos si hay elementos en el carrito
      if(de != null && de.size() != 0){
    	  carro = "carrito.jsp";  
    	  cant = "("+de.size()+")";
      }
      %>
      <li class="nav">
    		<h6 style ="color:red"><%=cant%></h6>
    	</li>
      <li class="nav-link">
        <a class="nav-link" href= <%=carro%>><img src="img/carrito.png" alt="Carrito de Compras" style="width: 20px; height: 20px;"> Carrito</a>
      </li>
      <%
      String idcli = null;
		idcli = (String)session.getAttribute("idsesion");
		if(idcli==null) {%>
      <li class="nav-item">
        <a class="nav-link" href="registrar.jsp">Registrarse</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">Iniciar Sesión</a>
      </li>
      <%} 
		// si se logra recuperar el id cliente
		else { 
    	  session.getAttribute("idsesion");//definimos atributo en la sesion
		session.setAttribute("idsesion", idcli);// le asignamos el valor recuperado
    	  BDClientes bd = new BDClientes();
		// buscamos el cliente y lo y lo asignamos en un objeto cliente cli
		Cliente cli = bd.Buscar(idcli); 
      %>
      <li class="nav">
      <img src = "img/usuario.png" style="width: 48px; height: 48px;">
      </li>
      <li class="navbar">
        <a class="navbar-brand" > <%=cli.getNombres()%></a>
      </li>
      <li class="navbar">
      	<a class="nav-link" href="cerrar.jsp">Cerrar Session</a>
      </li>
      <li class="navbar">
      	<a class="nav-link" href="ventas.jsp">Mis compras</a>
      </li>
      <%} %>
    </ul>
  </div>
</nav>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
