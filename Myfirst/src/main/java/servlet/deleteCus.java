package servlet;

import java.io.IOException;
import java.util.concurrent.ThreadPoolExecutor.DiscardOldestPolicy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import services.customerService ;

@WebServlet("/deleteCus")
public class deleteCus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public deleteCus() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customer cus = new customer();
		
		cus.setEmail(request.getParameter("email"));
		
		
		customerService service = new customerService();
		service.deleteCus(cus);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminCustomer");
	    dispatcher.forward(request, response);
	}

}
