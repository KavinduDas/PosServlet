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
import services.customerService;


@WebServlet("/adminCustomer")
public class adminCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public adminCustomer() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customerService service = new customerService();
		ArrayList<customer> customer = service.getAllCustomer();
		request.setAttribute("customer",customer);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminTable.jsp");
		dispatcher.forward(request, response);
	}

}
