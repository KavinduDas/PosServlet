<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Fashion Paradise POS</title>
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

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background-color: rgba(45, 45, 45, 0.6);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin-top: 0;
            color: #ccc;
        }

        .card .value {
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
            color: white;
        }

        .card .change {
            color: #ccc;
        }

        /* Recent Orders Table */
        .recent-orders {
            background-color: rgba(45, 45, 45, 0.6);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #444;
            color: white;
        }

        th {
            background-color: rgba(0,0,0,0.2);
        }

        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }

        .status.completed {
            background-color: rgba(0, 200, 0, 0.2);
            color: #0f0;
        }

        .status.pending {
            background-color: rgba(200, 200, 0, 0.2);
            color: #ff0;
        }

        /* POS Button */
        .pos-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            display: inline-block;
        }

        .pos-button:hover {
            background-color: #45a049;
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
            <span></span>
        </div>
    </div>

    <!-- Sidebar -->
    <nav class="sidebar">
        <a href="JavaForm.jsp" class="menu-btn">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <form action = "adminCustomer" method = "post">
			<a href="Customer.jsp" class="menu-btn">
			    <i class="fas fa-user-circle"></i> Customer
			</a>

        </form>
        
        <a href="JavaForm.jsp" class="menu-btn">
            <i class="fa-solid fa-landmark"></i> Supplier
        </a>
        <a href="JavaForm.jsp" class="menu-btn">
            <i class="material-symbols-outlined">badge</i> Employee
        </a>
        <a href="Product.jsp" class="menu-btn">
            <i class="material-symbols-outlined">add_shopping_cart</i> Product
        </a>
        <a href="JavaForm.jsp" class="menu-btn">
            <i class="material-symbols-outlined">finance_mode</i> Sales
        </a>
        <a href="invoice.jsp" class="menu-btn">
            <i class="fas fa-file-invoice"></i> Invoice
        </a>
    
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Dashboard Content -->
        <h1>Dashboard</h1>
        
        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <div class="card">
                <h3>Today's Sales</h3>
                <div class="value">$<%= request.getAttribute("todaySales") != null ? request.getAttribute("todaySales") : "0.00" %></div>
                <div class="change">+5% from yesterday</div>
            </div>
            
            <div class="card">
                <h3>Total Orders</h3>
                <div class="value"><%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : "0" %></div>
                <div class="change">3 new orders today</div>
            </div>
            
            <div class="card">
                <h3>Inventory Items</h3>
                <div class="value"><%= request.getAttribute("inventoryCount") != null ? request.getAttribute("inventoryCount") : "0" %></div>
                <div class="change">5 items low in stock</div>
            </div>
        </div>

        <!-- Quick POS Button -->
        <button class="pos-button" onclick="location.href='${pageContext.request.contextPath}/pos.jsp'">
            <i class="fas fa-cash-register"></i> Open POS
        </button>

        <!-- Recent Orders Table -->
        <div class="recent-orders">
            <h2>Recent Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#1001</td>
                        <td>John Doe</td>
                        <td>2023-05-15</td>
                        <td>$120.00</td>
                        <td><span class="status completed">Completed</span></td>
                        <td><a href="#">View</a></td>
                    </tr>
                    <tr>
                        <td>#1002</td>
                        <td>Jane Smith</td>
                        <td>2023-05-15</td>
                        <td>$85.50</td>
                        <td><span class="status pending">Pending</span></td>
                        <td><a href="#">View</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Any initialization code
        });
    </script>
</body>
</html>