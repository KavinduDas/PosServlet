package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import model.cutomerNew;
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
		cutomerNew cutomerNew = new cutomerNew();
		cutomerNew.setAccount_number(Integer.parseInt(request.getParameter("account")));
		cutomerNew.setName(request.getParameter("name"));
		cutomerNew.setPhone_number(Integer.parseInt(request.getParameter("telephone")));	
		cutomerNew.setAddress(request.getParameter("address"));
		cutomerNew.setShipping_Address(request.getParameter("shipping_address"));
		
		customerService service = new customerService();
		service.updateCustomer(cutomerNew);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Customer.jsp");
	
		dispatcher.forward(request, response);
	}

}
