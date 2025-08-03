package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import services.customerService;


@WebServlet("/singleDataButton")
public class singleDataButton extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public singleDataButton() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		customer cus = new customer();
		
		cus.setEmail(request.getParameter("email"));
		customerService service = new customerService();
		
		customer customer = service.singleDataButton(cus);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
		request.setAttribute("customer", customer);
		
		
	
		dispatcher.forward(request, response);
	}

}
