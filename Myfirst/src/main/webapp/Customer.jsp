<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Customer Management</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <!-- Google Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <style>
        :root {
            --bg-color: #f5f5f5;  /* Whitish grey background */
            --sidebar-color: #2d2d2d;
            --card-color: #ffffff;
            --text-color: #333333;
            --highlight-color: #e0e0e0;
            --border-color: #d0d0d0;
            --dark-text: #2d2d2d;
            --light-text: #666666;
        }
        
        body {
            font-family: 'Tahoma', sans-serif;
            margin: 0;
            padding: 0;
            background-color:#1e1e1e;
            color: var(--text-color);
            display: flex;
            min-height: 100vh;
        }

        /* Header Styles */
        .header {
            height: 60px;
            background: #1e1e1e;
            border-bottom: 2px solid var(--border-color);
            display: flex;
            align-items: center;
            padding-left: 15px;
            font-size: 20px;
            font-weight: bold;
            color: #ffffff;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .logo {
            height: 40px;
            margin-right: 15px;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 180px;
            background: var(--sidebar-color);
            border-right: 2px solid #444;
            display: flex;
            flex-direction: column;
            padding-top: 80px;
            position: fixed;
            height: 100vh;
        }

        .menu-btn {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin: 5px 10px;
            background: #3a3a3a;
            border: 1px solid #444;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
            color: #eee;
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .menu-btn i {
            margin-right: 10px;
            font-size: 18px;
            vertical-align: middle;
        }

        .menu-btn:hover {
            background: #4a4a4a;
            border-color: #555;
            color: #fff;
        }

        .menu-btn.active {
            background: #5a5a5a;
            border-color: #666;
            color: #fff;
            cursor: default;
        }

        /* Main Content Styles */
       .main-content {
            flex: 1;
            padding: 80px 20px 20px 200px;
            background-color: #1e1e1e;
            color: white;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: var(--card-color);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border: 1px solid var(--border-color);
        }

        .tabs {
            display: flex;
            border-bottom: 2px solid #ccc;
            margin-bottom: 20px;
        }
        .tab {
            padding: 10px 20px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 3px solid transparent;
            color: var(--dark-text);
        }
        .tab.active {
            border-bottom: 3px solid #007bff;
            color: #007bff;
        }
        .tab-content {
            display: none;
        }
        .tab-content.active {
            display: block;
        }
        .panel {
            border: 1px solid var(--border-color);
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            background-color: var(--card-color);
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-group label {
            width: 150px;
            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
            color: var(--dark-text);
        }
        .form-group input, .form-group textarea {
            flex: 1;
            padding: 8px;
            font-size: 14px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background-color: var(--card-color);
            color: var(--dark-text);
        }
        .form-group textarea {
            height: 80px;
            resize: vertical;
        }
        .contact-person {
            border: 1px solid var(--border-color);
            padding: 15px;
            border-radius: 5px;
            margin-left: 20px;
            background-color: var(--card-color);
        }
      /* Shared button group styles */
		.buttons, .buttons-search {
		    display: flex;
		    justify-content: center; /* Center horizontally */
		    gap: 15px; /* Space between buttons */
		    margin-top: 20px; /* Space above buttons */
		    padding: 10px 0;
		}
		
		/* Shared button styles */
		.buttons button,
		.buttons-search button {
		    width: 120px; /* Same length for all buttons */
		    padding: 10px 0;
		    font-size: 16px;
		    font-weight: bold;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		}
		
		/* Individual colors */
		.buttons button.save { background: #28a745; color: #fff; }
		.buttons button.delete { background: #dc3545; color: #fff; }
		.buttons-search button.search { background: #007bff; color: #fff; }
		.buttons-search button.update,
        .update { background: #28a745; color: #fff; } /* ✅ Green update button with white text */

        .checkbox-group {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid var(--border-color);
        }
        th, td {
            padding: 10px;
            text-align: left;
            color: var(--dark-text);
        }
        th {
            background: #f8f9fa;
            font-weight: bold;
        }
        tr:hover {
            background: #f1f1f1;
            cursor: pointer;
        }
        .report-panel button {
            display: block;
            width: 300px;
            padding: 15px;
            margin: 20px 0;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background: #007bff;
            color: #fff;
        }

        /* User Info */
        .user-info {
            display: flex;
            align-items: center;
            position: absolute;
            right: 20px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            background-color: #555;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        h1, h2, h3 {
            color: var(--dark-text);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="Image/gem.png" alt="Fashion Paradise Logo" class="logo">
        Fashion Paradise POS System
        <div class="user-info">
            <div class="user-avatar">
                <i class="fas fa-user"></i>
            </div>
            <span style="color: var(--dark-text);">Admin User</span>
        </div>
    </div>

    <!-- Sidebar -->
    <nav class="sidebar">
        <a href="JavaForm.jsp" class="menu-btn">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="Customer.jsp" class="menu-btn active">
            <i class="fas fa-user-circle"></i> Customers
        </a>
        <a href="Customer.jsp" class="menu-btn">
            <i class="fa-solid fa-landmark"></i> Supplier
        </a>
        <a href="Customer.jsp" class="menu-btn">
            <i class="material-symbols-outlined">badge</i> Employee
        </a>
        <a href="Product.jsp" class="menu-btn">
            <i class="material-symbols-outlined">add_shopping_cart</i> Product
        </a>
        <a href="Customer.jsp" class="menu-btn">
            <i class="material-symbols-outlined">finance_mode</i> Sales
        </a>
        <a href="Invoice.jsp" class="menu-btn">
            <i class="fas fa-file-invoice"></i> Invoice
        </a>

    </nav>

    <!-- Main Content -->
    
    <div class="main-content">
        <div class="container">
            <div class="tabs">
                <div class="tab active" data-tab="add-customer">Add Customer</div>
                <div class="tab" data-tab="search-customer">Search Customer</div>
                <div class="tab" data-tab="reports">Reports</div>
            </div>

            <!-- Add Customer Tab -->
            <form action ="CustomerAdding" method = "post">
            <div class="tab-content active" id="add-customer">
                <div class="panel">
                    <div style="display: flex;">
                        <div style="flex: 1;">
                            <div class="form-group">
                                <label>Name:</label>
                                <input type="text" id="c_name" name = "name">
                            </div>
                            <div class="form-group">
                                <label>T.P Number:</label>
                                <input type="text" id="c_tp" name = "telenumber">
                            </div>
                            <div class="form-group">
                                <label>Billing Address:</label>
                                <textarea id="c_billadd" name = "address"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Shipping Address:</label>
                                <textarea id="c_shipadd" name = "shippingAddress"></textarea>
                            </div>
                            <div class="checkbox-group">
                                <input type="checkbox" id="same" onclick="copyBillingAddress()">
                                <label for="same" style="width: auto; margin-left: 10px;">Same as Billing</label>
                            </div>
                            <div class="form-group">
                                <label>Bank Acc No:</label>
                                <input type="text" id="c_bank" name= "accountNumber">
                            </div>
                            <div class="form-group">
                                <label>City:</label>
                                <input type="text" id="c_city" name = "city">
                            </div>
                        </div>
                        
                        <div class="contact-person">
                            <h3>Contact Person</h3>
                            <div class="form-group">
                                <label>Name:</label>
                                <input type="text" id="cp_name">
                            </div>
                            <div class="form-group">
                                <label>Contact Person:</label>
                                <input type="text" id="c_person">
                            </div>
                            <div class="form-group">
                                <label>T.P Number:</label>
                                <input type="text" id="cp_tp">
                            </div>
                            <div class="form-group">
                                <label>Email:</label>
                                <input type="text" id="cp_email">
                            </div>
                            <div class="form-group">
                                <label>Online:</label>
                                <input type="text" id="cp_online">
                            </div>
                        </div>
                    </div>
                    
                    <div class="buttons">
                        <button type = "submit" class="save">Save</button>                       
                        <button class="delete" onclick="deleteCustomer()">Delete</button>
                    </div>
                </div>
                </form>
            </div>

            <!-- Search Customer Tab -->
            <form action = "customerSearch" method = "post">
            <input type="hidden" name="activeTab" value="search-customer">
            
            <div class="tab-content" id="search-customer">
                <div class="panel">
                    <div class="form-group">
                        <label>Customer Account:</label>
                        <input type="text" id="c_search_tbl" name = "account" value = "${cus.account_number}">
                    </div>
                    <div style="display: flex; gap: 20px;">
                        <div class="form-group">
                            <label>City:</label>
                            <input type="text" id="sh_city" name = "city" value ="${cus.city}">
                        </div>
                        <div class="form-group">
                            <label>Telephone:</label>
                            <input type="text" id="sh_tp"  name = "telephone" value ="${cus.phone_number}">
                        </div>
                        <div class="form-group">
                            <label>Name :</label>
                            <input type="text" id="sh_cp"  name = "name" value ="${cus.name}">
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input type="text" id="sh_pn" name = "address" value ="${cus.address}">
                        </div>
                          <div class="form-group">
                            <label>Shipping Address</label>
                            <input type="text" id="sh_pn2" name = "shipping_address" value ="${cus.shipping_Address}">
                        </div>
                    </div>
                </div>
                <table id="customerTable">
                    <thead>                        
                           <tr> 
                            <th>Account Number</th>
                            <th>Person Name</th>
                            <th>T.P Number</th>
                            <th>Billing Address</th>
                            <th>Shipping Address</th>                          
                            <th>City</th>                           
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                    <c:forEach var="cus" items="${customerSearch}">
                    <tr>
                    <td>${cus.account_number}</td>
                    <td>${cus.name}</td>
                    <td>${cus.phone_number}</td>
                    <td>${cus.address}</td>
                    <td>${cus.shipping_Address}</td>
                    <td>${cus.city}</td>  
                    <td>
				    <button class="edit-item">
				        <i class="fas fa-edit"></i> Edit
				    </button>
				</td>
				                    
                                
                    </tr>                    
                   </c:forEach>
                    </tbody>
                </table>
               
                <div class = "buttons-search">
                		<button type = "submit"  class="search">Search</button>     
                        <button type="submit" class="update">Submit</button>
                </div>
                
            </div>
            </form>
            
            <form action = "singleDataButton" method = "post">            
            <input type = "hidden" name = "account" value = "${cus.account_number}">
        
            
            </form>

            <!-- Reports Tab -->
            <div class="tab-content" id="reports">
                <div class="report-panel">
                    <button onclick="viewAllCustomerReport()">All Customer Reports</button>
                    <div class="form-group">
                        <label>Customer ID:</label>
                        <input type="text" id="cid">
                    </div>
                    <button onclick="viewCustomerReport()">View Report</button>
                </div>
            </div>
        </div>
        
    </div>

 <script>
    // Tab navigation
    document.querySelectorAll('.tab').forEach(tab => {
        tab.addEventListener('click', () => {
            document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));

            tab.classList.add('active');
            document.getElementById(tab.dataset.tab).classList.add('active');
        });
    });

    // Check URL parameter or form submission to set active tab
    window.onload = function () {
        const activeTab = '<%= request.getParameter("activeTab") != null ? request.getParameter("activeTab") : "add-customer" %>';
        document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
        document.querySelector(`.tab[data-tab="${activeTab}"]`).classList.add('active');
        document.getElementById(activeTab).classList.add('active');
    };
</script>
</body>
</html>
