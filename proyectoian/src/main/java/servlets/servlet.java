package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.BDClientes;
import controller.BDVentas;
import controller.BDdetalle;
import modelo.Cliente;
import modelo.detalle;
import modelo.venta;


/**
 * Servlet implementation class servlet
 */
@WebServlet("/servlet")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int op  = Integer.parseInt(request.getParameter("op"));
		String usuario = request.getParameter("usuario");
		String contrasena = request.getParameter("contrasena");
		BDClientes cli = new BDClientes();
		Cliente c = null;
		HttpSession sesion = request.getSession();
		BDVentas ven = new BDVentas();
			BDdetalle det = new BDdetalle();
			venta v = null;
			 ArrayList<detalle> lista = null;
			 lista = (ArrayList<detalle>)sesion.getAttribute("cesto");
		switch(op) {
		case 1:
			c = new Cliente(cli.nuevoid(),
					request.getParameter("txtape"),
					request.getParameter("txtnom"),
					request.getParameter("txtdirec"),
					request.getParameter("txtfecha"),
					request.getParameter("txtsex"),
					request.getParameter("txtcorreo"),
					request.getParameter("txtcontra"),"1");
			cli.Insertar(c);

			response.sendRedirect("login.jsp");
			break;
		case 2:
			boolean acceso = false;
			ArrayList<Cliente> listacli = null;
			listacli = cli.Listar();

			for(Cliente cl : listacli) {
				if(cl.getNombres().equals(usuario)&&cl.getPassword().equals(contrasena)) {
					acceso = true;
					sesion.setAttribute("idsesion", cl.getIdCliente() );
					break;
				}
			}
			if(acceso) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("login.jsp?e=usuario o contrasena incorrecta");
			}
			break;
		case 3:

			 v = new venta(ven.nuevoid(),
					request.getParameter("txtidcli"),
					request.getParameter("txtfecha"),
					Double.parseDouble(request.getParameter("txtmonto")),
					request.getParameter("txtestado"));
			 ven.Insertar(v);
			for(detalle d :lista) {
				d = new detalle(v.getIdVenta(), d.getIdProducto(),
						d.getCantidad(),d.getPrecioUnidad(), "1");
				det.Insertar(d);
			}
			sesion.removeAttribute("cesto");
			response.sendRedirect("ventas.jsp");
			break;
		}
	}

}
