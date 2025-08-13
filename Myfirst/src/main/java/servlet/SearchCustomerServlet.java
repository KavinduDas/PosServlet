package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DB_connect;

@WebServlet("/SearchCustomerServlet")
public class SearchCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SearchCustomerServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String accountNumberStr = request.getParameter("account"); // form input name="accountNumber"

        if (accountNumberStr == null || accountNumberStr.trim().isEmpty()) {
            request.setAttribute("error", "Please enter an account number.");
            request.getRequestDispatcher("Customer.jsp").forward(request, response);
            return;
        }

        try (Connection con = DB_connect.getConnection()) {
            String sql = "SELECT * FROM customers WHERE AccountNumber = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(accountNumberStr));

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // Save data in request scope to forward to JSP
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("shippingAddress", rs.getString("shipping_address"));
                request.setAttribute("phoneNumber", rs.getString("phone_number"));
                request.setAttribute("city", rs.getString("city"));
                request.setAttribute("accountNumber", rs.getInt("account_number"));

                request.getRequestDispatcher("customerDetails.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No customer found for account number " + accountNumberStr);
                request.getRequestDispatcher("searchCustomer.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching customer data: " + e.getMessage());
            request.getRequestDispatcher("searchCustomer.jsp").forward(request, response);
        }
    }
}
