package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Carro;
import persistence.CarroDao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/carro")
public class CarroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String cmd = request.getParameter("botao");
	    CarroDao dao = new CarroDao();

	    try {

	        if (cmd.equalsIgnoreCase("Inserir")) {

	            Carro c = new Carro();
	            c.setPlaca(request.getParameter("placa"));
	            c.setMarca(request.getParameter("marca"));
	            c.setModelo(request.getParameter("modelo"));
	            c.setAno(Integer.parseInt(request.getParameter("ano")));
	            c.setCor(request.getParameter("cor"));

	            dao.inserir(c);

	            request.setAttribute("saida", "Carro inserido com sucesso!");
	        }

	        if (cmd.equalsIgnoreCase("Listar")) {

	            var lista = dao.listar();
	            request.setAttribute("listaCarros", lista);
	        }

	    } catch (Exception e) {
	        request.setAttribute("erro", e.getMessage());
	    }

	    request.getRequestDispatcher("carro.jsp").forward(request, response);
	}
}