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


@WebServlet("/updateCustomer")
public class updateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public updateCustomer() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 customer cus = new customer();
		 
		 cus.setName(request.getParameter("name"));
		 cus.setName(request.getParameter("email"));
		 cus.setAge(Integer.parseInt(request.getParameter("age")));
		 cus.setName(request.getParameter("password"));
		 
		 customerService service = new customerService();		 
		 service.updateCustomer(cus);
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("login");	 
		 
		 
		dispatcher.forward(request, response);
	}

}
