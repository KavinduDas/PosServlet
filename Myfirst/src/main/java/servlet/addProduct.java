package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.cutomerNew;
import model.product;
import services.customerService;


@WebServlet("/addProduct")
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addProduct() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		product pro = new product();
		
		pro.setName(request.getParameter("name"));
		pro.setBarcode(Integer.parseInt(request.getParameter("barcode")));
		pro.setCategory(request.getParameter("category"));
		pro.setPrice(Integer.parseInt(request.getParameter("price")));
		pro.setSupplierid(request.getParameter("supplier"));
		
		customerService service = new customerService();
		service.addProduct(pro);
		
		request.setAttribute("success",true);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Product.jsp");
		dispatcher.forward(request, response);
		
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
