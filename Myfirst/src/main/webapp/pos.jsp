<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POS - Fashion Paradise</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <!-- Google Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <style>
        body {
            font-family: Tahoma, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1e1e1e;
            color: white;
            display: flex;
            min-height: 100vh;
        }

        /* Header Styles */
        .header {
            height: 60px;
            background: #1e1e1e;
            border-bottom: 2px solid #ccc;
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
        }
        .header img {
            padding-right: 10px;
            height: 40px;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 180px;
            background: #2d2d2d;
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
            transition: background-color 0.3s, border-color 0.3s;
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
        }

        /* POS Form Styles */
        .pos-form {
            background-color: rgba(45, 45, 45, 0.6);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .pos-input-group {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .pos-input {
            flex: 1;
            padding: 10px;
            background-color: #333;
            border: 1px solid #444;
            color: white;
            border-radius: 4px;
        }

        .pos-input:disabled {
            background-color: #444;
        }

        .pos-add-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .pos-add-btn:hover {
            background-color: #45a049;
        }

        /* Cart Table */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .cart-table th, .cart-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #444;
            color: white;
        }

        .cart-table th {
            background-color: rgba(0,0,0,0.2);
        }

        .remove-item {
            color: #ff4d4d;
            cursor: pointer;
        }

        .remove-item:hover {
            color: #ff0000;
        }

        /* Summary Section */
        .summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .summary-label {
            font-weight: bold;
        }

        .summary-value {
            font-size: 24px;
            font-weight: bold;
        }

        /* Buttons */
        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .pay-btn, .invoice-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .pay-btn:hover, .invoice-btn:hover {
            background-color: #45a049;
        }

        .invoice-btn {
            background-color: #2196F3;
        }

        .invoice-btn:hover {
            background-color: #1e88e5;
        }

        /* User Info */
        .user-info {
            display: flex;
            align-items: center;
            position: absolute;
            right: 50px;
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
            <span>Admin</span>
        </div>
    </div>

    <!-- Sidebar -->
    <nav class="sidebar">
        <a href="${pageContext.request.contextPath}/Dashboard.jsp" class="menu-btn <%= request.getRequestURI().contains("Dashboard.jsp") ? "active" : "" %>">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <form action = "adminCustomer" method = "post">
			<a href="${pageContext.request.contextPath}/adminCustomer" class="menu-btn">
			    <i class="fas fa-user-circle"></i> Products
			</a>

        </form>
        
        <a href="${pageContext.request.contextPath}/Supplier.jsp" class="menu-btn <%= request.getRequestURI().contains("Supplier.jsp") ? "active" : "" %>">
            <i class="fa-solid fa-landmark"></i> Supplier
        </a>
        <a href="${pageContext.request.contextPath}/Employee.jsp" class="menu-btn <%= request.getRequestURI().contains("Employee.jsp") ? "active" : "" %>">
            <i class="material-symbols-outlined">badge</i> Employee
        </a>
        <a href="${pageContext.request.contextPath}/Product.jsp" class="menu-btn <%= request.getRequestURI().contains("Product.jsp") ? "active" : "" %>">
            <i class="material-symbols-outlined">add_shopping_cart</i> Product
        </a>
        <a href="${pageContext.request.contextPath}/Sales.jsp" class="menu-btn <%= request.getRequestURI().contains("Sales.jsp") ? "active" : "" %>">
            <i class="material-symbols-outlined">finance_mode</i> Sales
        </a>
        <a href="${pageContext.request.contextPath}/Invoice.jsp" class="menu-btn <%= request.getRequestURI().contains("Invoice.jsp") ? "active" : "" %>">
            <i class="fas fa-file-invoice"></i> Invoice
        </a>
        <a href="${pageContext.request.contextPath}/Reports.jsp" class="menu-btn <%= request.getRequestURI().contains("Reports.jsp") ? "active" : "" %>">
            <i class="fas fa-chart-bar"></i> Reports
        </a>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Point of Sale (POS)</h1>
        
        <!-- POS Form -->
        <div class="pos-form">
            <div class="pos-input-group">
                <input type="text" id="barcode" class="pos-input" placeholder="Scan or Enter Barcode">
                <input type="text" id="productName" class="pos-input" placeholder="Product Name" disabled>
                <input type="text" id="price" class="pos-input" placeholder="Price" disabled>
                <input type="number" id="quantity" class="pos-input" placeholder="Quantity" value="1" min="1">
                <button class="pos-add-btn" onclick="addItem()">Add Item</button>
            </div>
            
            <!-- Cart Table -->
            <table class="cart-table" id="cartTable">
                <thead>
                    <tr>
                        <th>Barcode</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Items will be added here dynamically -->
                        <tr>
        <td>123456</td>
        <td>Sample Product</td>
        <td>$10.00</td>
        <td>1</td>
        <td>$10.00</td>
        <td><i class="fas fa-trash remove-item"></i></td>
    </tr>
                </tbody>
            </table>
            
            <!-- Customer and Payment Details -->
            <div class="pos-input-group">
                <input type="text" id="customerAccount" class="pos-input" placeholder="Customer Account Number">
                <select id="paymentType" class="pos-input">
                    <option value="">Select Payment Type</option>
                    <option value="cash">Cash</option>
                    <option value="card">Credit Card</option>
                    <option value="mobile">Mobile Payment</option>
                </select>
            </div>
            
            <!-- Summary -->
            <div class="summary">
                <span class="summary-label">Total Amount:</span>
                <span class="summary-value" id="totalAmount">$0.00</span>
            </div>
            
            <!-- Action Buttons -->
            <div class="action-buttons">
                <button class="pay-btn" onclick="payBill()">Pay Bill</button>
                <button class="invoice-btn" onclick="generateInvoice()">Generate Invoice</button>
            </div>
        </div>
    </div>

</body>
</html>