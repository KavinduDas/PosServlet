package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.cutomerNew;
import model.product;
import services.customerService;

/**
 * Servlet implementation class customerSearch
 */
@WebServlet("/customerSearch")
public class customerSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerSearch() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		customerService service = new customerService();
		String accountNumber = request.getParameter("account");
		ArrayList<cutomerNew> customerNew = service.customerSerach(accountNumber);
		
	    request.setAttribute("customerSearch", customerNew);
        request.setAttribute("activeTab", "search-customer");

	    RequestDispatcher dispatcher = request.getRequestDispatcher("Customer.jsp");
	    dispatcher.forward(request, response);
		
	
		doGet(request, response);
	}

}
