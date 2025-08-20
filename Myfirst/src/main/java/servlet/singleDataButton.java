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
		
		
	
		cutomerNew cutomerNew = new cutomerNew();
		
		cutomerNew.setAccount_number(Integer.parseInt(request.getParameter("account")));
		customerService service = new customerService();
		
		cutomerNew cuNew = service.singleDataButton(cutomerNew);
		RequestDispatcher dispatcher = request.getRequestDispatcher("pos.jsp");
		request.setAttribute("customerSearch", cuNew );
		
		dispatcher.forward(request, response);
		
		
	}

}
