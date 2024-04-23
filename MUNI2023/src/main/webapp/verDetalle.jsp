<%@page import="Entidades.Tecnico"%>
<%@page import="CapaNegocio.BSTecnicos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Entidades.Contrato" %>
<%@ page session = "true" %>
<%@ page import="CapaNegocio.BSContrato" %>
<%@ page import="Entidades.EMPLEADO" %>
<%@ page import="CapaNegocio.BSEMPLEADO" %>
<%@ page import="Entidades.SUBGERENTE" %>
<%@ page import="CapaNegocio.BSSUBGERENTE" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<style>
body{margin-left:400px ; margin-right: 400px; margin-top: 50px; margin-bottom: 50px; border: 2px solid black;padding: 30px;}
img{margin: 15px ;border: 2px solid darkblue;}
p{border: 5px;}
#canvas{
        border: 1px solid black;
    }
    section{
        width: 98%;
        height: auto;
        float: right;
        display: grid;
        grid-template-rows: 1;
        grid-template-columns: 1fr 1fr;
    }
    @media print {
    /* Estilos específicos para la impresión */
    body {
        font-size: 12pt;
        margin: 0;
    }
    /* Oculta elementos no esenciales para la impresión */
    .no-imprimir {
        display: none;
    }
    @media print and (max-width: 1080px) {
    /* Estilos específicos para impresoras con un ancho máximo de 480px */
	}
}
</style>
<body>
	<center><h5>CONTRATO</h5></center>
	<%
		
		String NUM_CON = request.getParameter("id");
		BSTecnicos LT = new BSTecnicos();
		BSContrato ObjBD = new BSContrato();
		BSEMPLEADO LE = new BSEMPLEADO();
		BSSUBGERENTE LS = new BSSUBGERENTE();
		Contrato ObjC = ObjBD.Buscar(NUM_CON);
		
		String idS = ObjC.getCOD_GER();
		String idT =  ObjC.getCOD_TEC();
		String idE = ObjC.getCOD_EMP();
		
		EMPLEADO E = LE.Buscar(idE);
		Tecnico T = LT.Buscar(idT);
		SUBGERENTE S = LS.Buscar(idS);
		
		int Estado = ObjC.getESTADOS();
		
		// recuperando datos del usuario
		String idusuario = (String)session.getAttribute("idsesion");
		String Correl = (idusuario != null && idusuario.length() >= 2) ? idusuario.substring(0, 2) : "ValorPorDefecto";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
			 Date date1 = sdf.parse(ObjC.getFECH_INI());
	        Date date2 = sdf.parse(ObjC.getFECH_FIN());
	        
	        long differenceInMilliseconds = date2.getTime() - date1.getTime();
	        long differenceInDays = differenceInMilliseconds / (24 * 60 * 60 * 1000);
		
	%>
	<center>
		<img src="img/<%=idE%>.png">
	</center>
	<div>
	<p>
		Conste por el presente contrato de trabajo, que celebran de una parte 
		<%=S.getNOM_GER() + " " + S.getAPE_GER()%>,con D.N.I N°<%=S.getDNI_GER()%>, a quien en lo sucesivo se le denominará EL EMPLEADOR; y de la otra parte 
		 <%= E.getNOM_EMP()+ " " + E.getAPE_EMP() %> , con DNI N° <%=E.getDNI_EMP() %> , domicilio <%=E.getDIREC_EMP() %> ,a quien en lo sucesivo se le denominará EL EMPLEADO;  en los términos y condiciones siguientes:
		
	</p>
	<h6>PRIMERA CLAUSULA </h6>
    <p>
		EL EMPLEADOR requiere la contratación de personal capacitado en el área <%=ObjC.getAREA() %> .
	</p>
	<h6>SEGUNDA CLAUSULA  </h6>
    <p>
		El contrato de trabajo tendrá una duración de <%=differenceInDays %> dias, debiendo iniciar sus labores EL EMPLEADO <%= ObjC.getFECH_INI()%>
		  y  concluir el <%=ObjC.getFECH_FIN() %>. 
	</p>
	<h6>TERCERA CLAUSULA     </h6>
    <p>
		EL TRABAJADOR deberá cumplir las reglas del centro de trabajo contrato, estipuladas en el reglamento interno. 
		Al no cumplir las cláusulas EL TRABAJADOR tendrá la obligación de indemnizar a la MUNICIPALIDAD JESÚS MARÍA 
		en una asamblea explicando las causas del retiro y la devolución de Pagos adelantados.
	</p>
	<h6>CUARTA CLAUSULA</h6>
    <p>
		EL EMPLEADOR pagará al EMPLEADO la cantidad de <%= ObjC.getSUELDO() %> S./.
		Conforme con toda las clausulas anteriores, ambas partes firman.	
	</p>
	
	
	<p>Fecha : <%=ObjC.getFECH_CON() %></p>
	
	<section>
        <center>
        
        <%if(Estado==0&&Correl.equals("TE")) {%>
        <article>
            <canvas id="canvas"></canvas>
         </article>   
        <%}else{ %>
        <article>
            <img width="300px" height="150px" src = "firmas/<%=T.getCOD_TEC()%>.png">
        </article>
        	<%} %>
            <br>
            <h6>FIRMA DEL ENCARGADO</h6>
         </center>
         <center> 
        <article>
        <%if(Estado==1&&Correl.equals("EM")) {%>
            <canvas id="canvas"></canvas>
            <%}else{ %>
                <img width="300px" height="150px" src="firmas/<%= E.getCOD_EMP() %>.png">
        	<%} %>
            <br>
            <h6>FIRMA DEL EMPLEADO</h6>
        </article>
        </center>
    </section>
	
	<%if(Estado!=2){ %>
	<form action= "GuardarImagenServlet">
		<input type ="hidden" name = "idsesion" value = <%=session.getAttribute("idsesion")%>>
		<input type ="hidden" name = "idcontrato" value = <%=NUM_CON%>>
		
		
		<button id="btnfirmar" class = "btn btn-primary">FIRMAR</button>
	</form>	
	 <%} %>
	</div>
</body>

</html>
	<%if(Estado==2) {%>
	<button onclick="window.print()">Imprimir</button>
	<%} %>
<script>

	
    const $canvas= document.querySelector("#canvas");
    const contexto= $canvas.getContext("2d");
    const COLOR = "black";
    const GROSOR = 2;
    let xAnterior = 0, yAnterior= 0, xActual= 0, yActual = 0;
    const obtenerXReal = (clientX) => clientX - $canvas.getBoundingClientRect().left;
    const obtenerYReal = (clientY) => clientY - $canvas.getBoundingClientRect().top;
    let haComenzadoDibujo = false;
        
    document.getElementById('btnfirmar').onclick = () => {
        const enlace = document.createElement('a');
        enlace.download = '<%=session.getAttribute("idsesion")%>' + '.png';

        // Obtén la imagen como un blob
        $canvas.toBlob((blob) => {
            // Crea un FormData y agrega el blob
            const formData = new FormData();
            formData.append('imagen', blob);
            formData.append('enlaceDescarga', enlace.download); 
            // Enviar la imagen al servidor usando XMLHttpRequest
            const xhr = new XMLHttpRequest();
            xhr.open('POST', '<%= request.getContextPath() %>/GuardarImagenServlet', true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    console.log('Respuesta del servidor:', xhr.responseText);
             
                   
                } else {
                    console.error('Error al enviar la imagen:', xhr.statusText);
                }
            };
            xhr.send(formData);
        });
    };
    
    
    $canvas.addEventListener("mousedown", evento =>{
        xAnterior = xActual;
        yAnterior = yActual;
        xActual = obtenerXReal(evento.clientX);
        yActual = obtenerYReal(evento.clientY);
        contexto.beginPath();
        contexto.fillStyle = COLOR;
        contexto.fillRect(xActual, yActual, GROSOR, GROSOR);
        contexto.closePath();
        haComenzadoDibujo = true;
    });
    $canvas.addEventListener("mousemove", (evento) => {
        if  (!haComenzadoDibujo){
            return;
        }
        xAnterior = xActual;
        yAnterior = yActual;
        xActual = obtenerXReal(evento.clientX);
        yActual = obtenerYReal(evento.clientY);
        contexto.beginPath();
        contexto.moveTo(xAnterior, yAnterior);
        contexto.lineTo(xActual, yActual);
        contexto.strokeStyle = COLOR;
        contexto.lineWidth = GROSOR;
        contexto.stroke();
        contexto.closePath();
    });
    ["mouseup","mouseout"].forEach(nombreDeEvento => {
        $canvas.addEventListener(nombreDeEvento, () => {
            haComenzadoDibujo = false;
        });
    });

</script>