package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.customer;
import utils.DB_connect;

public class customerService {
	public void regCustomer(customer cus) {
		try{
			String query = "INSERT INTO cashier VALUES ('"+cus.getEmail()+"','"+cus.getName()+"','"+cus.getConfirm_password()+"','"+cus.getPassword()+"')";
			 System.out.println("Query: " + query);
			
			Statement statement = DB_connect.getConnection().createStatement();
			
			int rows = statement.executeUpdate(query);
			System.out.println("Inserted rows: " + rows);

		}catch(Exception e) {
			System.out.println("Error during registration: " + e.getMessage());
			e.printStackTrace();
			
		}
		
	}
	public boolean validate(customer cus) {
		try {
			String query = "SELECT * FROM cashier WHERE email = '"+ cus.getEmail()+"' AND password = '"+cus.getPassword()+"' ";
			
			Statement statement = DB_connect.getConnection().createStatement();
			
			ResultSet result_set = statement.executeQuery(query);
			
			if(result_set.next()) {
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public customer getOne(customer cus) {
		try {
			String query = "SELECT * FROM cashier WHERE email = '"+ cus.getEmail()+"' AND password = '"+cus.getPassword()+"' ";
			
			Statement statement = DB_connect.getConnection().createStatement();
			
			ResultSet result_set = statement.executeQuery(query);
			
			if(result_set.next()) {
				cus.setName(result_set.getString("name"));
				cus.setEmail(result_set.getString("email"));
				cus.setConfirm_password(result_set.getString("confirm_password"));
				cus.setPassword(result_set.getString("password"));
				
				return cus;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public customer getCustomerByEmailAndPassword(String email, String password) {
	    customer cus = null;
	    try {
	        String query = "SELECT * FROM cashier WHERE email = '" + email + "' AND password = '" + password + "'";
	        
	        Statement statement = DB_connect.getConnection().createStatement();
	        ResultSet result_set = statement.executeQuery(query);

	        if (result_set.next()) {
	            cus = new customer();
	            cus.setEmail(result_set.getString("email"));
	            cus.setName(result_set.getString("name"));
	            cus.setConfirm_password(password);
	            cus.setPassword(result_set.getString("password"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return cus;
	}
	
	public void updateCustomer(customer customer) {
		try {
			String query = "UPDATE cashier SET name = '"+customer.getName()+"',email = '"+customer.getEmail() +"', age = '"+customer.getConfirm_password() +"' , password = '"+customer.getPassword()+"' WHERE email = '"+customer.getEmail() +"'  ";
			
			Statement statement = DB_connect.getConnection().createStatement();
			statement.executeUpdate(query);
			
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<customer> getAllCustomer(){
		try {
			ArrayList<customer> listCus = new ArrayList<customer>();
			
			String query = "SELECT * FROM customer";
			Statement statement = DB_connect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				customer cus = new customer();
				cus.setName(rs.getString("name"));
				cus.setEmail(rs.getString("email"));
				cus.setConfirm_password(rs.getString("confirm_password"));
				cus.setPassword(rs.getString("password"));
				
				listCus.add(cus);
				
			}
			return listCus;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public customer singleDataButton(customer cus) {
		try {
			String query = "SELECT * FROM cashier WHERE email = '"+ cus.getEmail()+"' ";
			
			Statement statement = DB_connect.getConnection().createStatement();
			
			ResultSet result_set = statement.executeQuery(query);
			
			if(result_set.next()) {
				cus.setName(result_set.getString("name"));
				cus.setEmail(result_set.getString("email"));
				cus.setConfirm_password(result_set.getString("confirm_password"));
				cus.setPassword(result_set.getString("password"));
				
				return cus;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void deleteCus(customer cus) {
		try {
			String query = "DELETE  FROM cashier WHERE email = '"+cus.getEmail()+"' ";
			
			Statement statement = DB_connect.getConnection().createStatement();
			statement.executeUpdate(query);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	
	
}


