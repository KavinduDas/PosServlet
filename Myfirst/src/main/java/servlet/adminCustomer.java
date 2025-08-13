package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import model.cutomerNew;
import model.product;
import services.customerService;


@WebServlet("/adminCustomer")
public class adminCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public adminCustomer() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    customerService service = new customerService();
	    ArrayList<product> productList = service.getAllCustomer();
	    request.setAttribute("product", productList);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("ProductNew.jsp");
	    dispatcher.forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customerService service = new customerService();
		ArrayList<product> product = service.getAllCustomer();
		request.setAttribute("product",product);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ProductNew.jsp");
		dispatcher.forward(request, response);
	}

}
