package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.cutomerNew;
import services.customerService;


@WebServlet("/CustomerAdding")
public class CustomerAdding extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CustomerAdding() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cutomerNew cusnew = new cutomerNew();
		
		cusnew.setName(request.getParameter("name"));
		cusnew.setPhone_number(Integer.parseInt(request.getParameter("telenumber")));
		cusnew.setAddress(request.getParameter("address"));
		cusnew.setShipping_Address(request.getParameter("shippingAddress"));
		cusnew.setAccount_number(Integer.parseInt(request.getParameter("accountNumber")));
		cusnew.setCity(request.getParameter("city"));
		
		customerService service = new customerService();
		service.addCustomer(cusnew);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Customer.jsp");
		dispatcher.forward(request, response);
		
		// I added this as i accidentdely deketed some of the lines in in Customer servoce getOne method
		
		
//		cutomerNew searchCus = service.getOne(cusnew);
//		request.setAttribute("searchedcus", searchCus);
//		
//		
		
		
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
