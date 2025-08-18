package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product;
import services.customerService;

/**
 * Servlet implementation class productsearch
 */
@WebServlet("/productsearch")
public class productsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public productsearch() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customerService service = new customerService();
		
		String barcodeNum = request.getParameter("barcode");
		
		
		ArrayList<product> product = service.productSearch(barcodeNum);
		
		request.setAttribute("product", product);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("pos.jsp");
	    dispatcher.forward(request, response);
	}

}
