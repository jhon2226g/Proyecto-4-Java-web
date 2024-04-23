package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CapaNegocio.BSContrato;
import CapaNegocio.BSSUBGERENTE;
import Entidades.Contrato;
import Entidades.SUBGERENTE;

/**
 * Servlet implementation class grabar
 */
@WebServlet("/grabar")
public class grabar extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public grabar() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		BSContrato C = new BSContrato(); // instanciamos la base de datos de contratos

		BSSUBGERENTE S = new BSSUBGERENTE(); //instanciamos el controlador de la base de datos de subgerente


		ArrayList<SUBGERENTE> LS = null; //se declara una lista de tipo subgerente
		LS = S.Listar(); // le asignamos la lista de subgerente obtenida de la base datos
		SUBGERENTE sub = null;	//declaramos el objeto sub de tipo subgerente

		// recorremos la lista buscando un subgerente
		for (SUBGERENTE element : LS) {
			if(element!= null) {
				//si encuentra uno lo guardamos en el objeto sub
			sub = element;
			break;
			}
		}
		// recuperar los paramtros desde la url.jsp
		int op = Integer.parseInt(request.getParameter("op"));
		// declaramos y e instanciamos un objeto de tipo contrato con sus atributos
		Contrato con = new Contrato(request.getParameter("txtid"),
				request.getParameter("txtidtec"),
				request.getParameter("txtFini"),
				request.getParameter("txtFfin"),
				request.getParameter("txtFCRE"),
				sub.getCOD_GER(),
				request.getParameter("cboEmp"),
				  Integer.parseInt(request.getParameter("txtEs")),
				Double.parseDouble(request.getParameter("txtSue")),
				request.getParameter("txtAre"));

		// declaramos la sentencia Switch y especificamos la accion para cada caso segun el valor de "op"
		switch(op) {

		case 1 : C.Modificar(con);break;
		case 2 : C.Suprimir(con.getNUM_CON());break;
		case 3 : C.Insertar(con);break;
		}
		// redirigimos al jsp listarcontratos
		response.sendRedirect("LISTARCONTRATOS.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
