package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.customer;
import model.cutomerNew;
import model.product;
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
	
	// Adding Customer
	public void addCustomer(cutomerNew cutomerNew) {
		try {
			String query = "INSERT INTO customer VALUES ('"+ cutomerNew.getAccount_number()+"','"+cutomerNew.getName()+"','"+cutomerNew.getPhone_number()+"','"+cutomerNew.getAddress()+"' ,'"+ cutomerNew.getShipping_Address()+"','"+ cutomerNew.getCity()+"')";
			
			Statement statement = DB_connect.getConnection().createStatement();
			int rows = statement.executeUpdate(query);
			System.out.println("Inserted rows: " + rows);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Adding Product 
	public void addProduct(product pro) {
		try {
			String query = "INSERT INTO product VALUES ('"+ pro.getBarcode()+"','"+pro.getName()+"','"+pro.getPrice()+"','"+pro.getCategory()+"' ,'"+ pro.getSupplierid()+"')";
			Statement statement = DB_connect.getConnection().createStatement();
			
			statement.executeUpdate(query);
			
		} catch (Exception e) {
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
	// I commented this beacuse i deletd catch block accidently .
	
//	public cutomerNew getOne(cutomerNew cutomerNew) {
//		try {
//			String query = "SELECT * FROM cashier WHERE AccountNumber = '"+ cutomerNew.getAccount_number()+"'";
//			
//			Statement statement = DB_connect.getConnection().createStatement();
//			
//			ResultSet result_set = statement.executeQuery(query);
//			
//			if(result_set.next()) {
//				cutomerNew.setName(result_set.getString("name"));
//				cutomerNew.setAccount_number(result_set.getInt("account_number"));
//				cutomerNew.setCity(result_set.getString("city"));
//				cutomerNew.setPhone_number(result_set.getInt("phone_number"));
//				cutomerNew.setAddress(result_set.getString("address"));
//				
//				
//				return cutomerNew;
//			}
//			

	
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
	// Get All Products
	
	public ArrayList<product> getAllCustomer(){
		try {
			ArrayList<product> listCus = new ArrayList<product>();
			
			String query = "SELECT * FROM product";
			Statement statement = DB_connect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
	
			
			while(rs.next()) {
				product pro = new product();
				pro.setBarcode(rs.getInt("barcode"));				
				pro.setName(rs.getString("name"));
				pro.setCategory(rs.getString("category"));
				pro.setPrice(rs.getInt("price"));
				pro.setSupplierid(rs.getString("supplier"));
				System.out.println("Found product: " + rs.getString("name"));
				listCus.add(pro);
				
				
			}
			System.out.println("Total products found: " + listCus.size());
			return listCus;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	// Customer Search
	
	public ArrayList<cutomerNew> customerSerach(String account_number ){
		cutomerNew cutomerNew = null;
		try {
			ArrayList<cutomerNew> cussearch  =  new ArrayList<cutomerNew>();
			
			String query = "SELECT * FROM customer ";
			if (account_number != null && !account_number.isEmpty()) {
	            query += " WHERE AccountNumber = '" + account_number + "'";
	        }
			Statement statement = DB_connect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while (rs.next()) {
	            cutomerNew = new cutomerNew();
	            cutomerNew.setAccount_number(rs.getInt("AccountNumber"));
	            cutomerNew.setName(rs.getString("Name"));
	            cutomerNew.setAddress(rs.getString("Address"));
	            cutomerNew.setShipping_Address(rs.getString("ShippingAddress"));
	            cutomerNew.setCity(rs.getString("City"));
	            cutomerNew.setPhone_number(rs.getInt("Telephone"));
	            
	            cussearch.add(cutomerNew);
	        }
            System.out.println("Query: " + query + ", Results: " + cussearch.size());
            return cussearch;	
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	

	//Object Search 
	
	
	public ArrayList<product> productSearch(String barcode , int quantity){
		product product = null;
		try {
			ArrayList<product> productsearch = new ArrayList<product>();
			
			String query = "SELECT barcode , Name , price  FROM product ";
			if (barcode != null && !barcode.isEmpty()) {
	            query += " WHERE barcode = '" + barcode + "'";
	        }
			Statement statement = DB_connect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				product = new product();
				product.setBarcode(rs.getInt("barcode"));
				product.setName(rs.getString("Name"));
				product.setPrice(rs.getInt("price"));
				product.setQuantity(quantity); // this from form 
				
				productsearch.add(product);
				
				
			}
			System.out.println("Query : "+ query + "Results : " + productsearch.size() );
			return productsearch;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	public cutomerNew singleDataButton(cutomerNew cutomerNew) {
		 
	
		try {
			String query = "SELECT * FROM customer WHERE AccountNumber = '"+ cutomerNew.getAccount_number() +"' ";
			
			Statement statement = DB_connect.getConnection().createStatement();
			
			ResultSet result_set = statement.executeQuery(query);
			
			if(result_set.next()) {
				cutomerNew.setName(result_set.getString("name"));
				cutomerNew.setAccount_number(result_set.getInt("AccountNumber"));
				cutomerNew.setPhone_number(result_set.getInt("Telephone"));
				cutomerNew.setAddress(result_set.getString("Address"));
				cutomerNew.setShipping_Address(result_set.getString("ShippingAddress"));
				cutomerNew.setCity(result_set.getString("City"));

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cutomerNew;
	}
	
	public void updateCustomer(cutomerNew cutomerNew) {
		try {
			String query = "UPDATE customer SET AccountNumber = '" +cutomerNew.getAccount_number() +"' , name = '"+cutomerNew.getName() +"' , Telephone = '"+ cutomerNew.getPhone_number()+"' , Address = '" + cutomerNew.getAddress()+ "' , ShippingAddress = '" + cutomerNew.getShipping_Address()+"' , City = '" + cutomerNew.getCity()+"' WHERE  AccountNumber = '"+cutomerNew.getAccount_number() +"' ";
			Statement statement = DB_connect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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


