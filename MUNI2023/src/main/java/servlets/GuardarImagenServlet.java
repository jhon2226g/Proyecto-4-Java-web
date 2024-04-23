package servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import CapaNegocio.BSContrato;
import Entidades.Contrato;



@WebServlet("/GuardarImagenServlet")
@MultipartConfig
public class GuardarImagenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarImagenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id = request.getParameter("idsesion");
		String idcon = request.getParameter("idcontrato");
		String Correl = "";
		BSContrato C = new BSContrato();
		Contrato con = C.Buscar(idcon);
		int Estado = 0;
		if (id != null && con!=null) {
		    // El código para usar id.substring(int, int)
			Correl = id.substring(0,2);
			Estado = con.getESTADOS();

		} else {
		    // Manejo de la situación cuando id es null
		}
		 //camiando el estado al obtener la firma
        if(Estado==0&&Correl.equals("TE")) {
        con.setESTADOS(1);
        con.setCOD_TEC(id);}
        else if (Estado==1&&Correl.equals("EM")) {
			con.setESTADOS(2);
		}
        C.Modificar(con);

			if(Correl.equals("TE")) {
				response.sendRedirect("LISTARCONTRATOS.jsp");
			} else if(Correl.equals("EM")) {
				response.sendRedirect("Area.jsp");
			}
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		 // Obtén el Part de la imagen del formulario
		 Part filePart = request.getPart("imagen");
		 String enlaceDescarga = request.getParameter("enlaceDescarga");

        // Nombre del archivo
        String fileName = "C:\\PROYECTO LP+ADS+EF\\"
        		+ "MUNI2023\\src\\main\\webapp\\firmas/"+enlaceDescarga;




        // Guarda la imagen en el servidor
        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream os = new FileOutputStream(fileName)) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().write("Error al guardar la imagen");
            return;
        }

        // Envía una respuesta al cliente
        response.getWriter().write("Imagen guardada exitosamente en el servidor");

		// TODO Auto-generated method stub


	}

}
