<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .header img{
        	padding-right: 10px
        }

        /* Sidebar Styles - Using your existing sidebar styling */
        .sidebar {
            width: 180px;
            background: #2d2d2d;
            border-right: 2px solid #444;
            display: flex;
            flex-direction: column;
            padding-top: 80px; /* Adjusted for fixed header */
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

        /* Main Content Styles - Adjusted for sidebar */
        .main-content {
            flex: 1;
            padding: 80px 20px 20px 200px; /* Adjusted for header and sidebar */
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

    <!-- Sidebar - Using your existing sidebar structure -->
    <nav class="sidebar">
        <a href="dashboard?page=dashboard" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("dashboard") ? "active" : "" %>">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="dashboard?page=customers" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("customers") ? "active" : "" %>">
            <i class="fas fa-user-circle"></i> Customers
        </a>
        <a href="dashboard?page=supplier" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("supplier") ? "active" : "" %>">
            <i class="fa-solid fa-landmark"></i> Supplier
        </a>
        <a href="dashboard?page=employee" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("employee") ? "active" : "" %>">
            <i class="material-symbols-outlined">badge</i> Employee
        </a>
        <a href="dashboard?page=product" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("product") ? "active" : "" %>">
            <i class="material-symbols-outlined">add_shopping_cart</i> Product
        </a>
        <a href="dashboard?page=sales" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("sales") ? "active" : "" %>">
            <i class="material-symbols-outlined">finance_mode</i> Sales
        </a>
        <a href="dashboard?page=invoice" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("invoice") ? "active" : "" %>">
            <i class="fas fa-file-invoice"></i> Invoice
        </a>
        <a href="dashboard?page=reports" class="menu-btn <%= request.getParameter("page") != null && request.getParameter("page").equals("reports") ? "active" : "" %>">
            <i class="fas fa-chart-bar"></i> Reports
        </a>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <% 
            String pageParam = request.getParameter("page");
            if ("dashboard".equals(pageParam) || pageParam == null) {
        %>
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
            <button class="pos-button" onclick="location.href='pos.jsp'">
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
        <%
            } else if ("product".equals(pageParam)) {
        %>
            <jsp:include page="Product.jsp" />
        <% 
            } else if ("customers".equals(pageParam)) {
        %>
            <h2>Customers</h2>
            <p>Customer management content goes here.</p>
        <% 
            } else if ("supplier".equals(pageParam)) {
        %>
            <h2>Supplier</h2>
            <p>Supplier management content goes here.</p>
        <% 
            } else if ("employee".equals(pageParam)) {
        %>
            <h2>Employee</h2>
            <p>Employee management content goes here.</p>
        <% 
            } else if ("sales".equals(pageParam)) {
        %>
            <h2>Sales</h2>
            <p>Sales management content goes here.</p>
        <% 
            } else if ("invoice".equals(pageParam)) {
        %>
            <h2>Invoice</h2>
            <p>Invoice management content goes here.</p>
        <% 
            } else if ("reports".equals(pageParam)) {
        %>
            <h2>Reports</h2>
            <p>Reports content goes here.</p>
        <% 
            }
        %>
    </div>

    <script>
        // You can add JavaScript functionality here
        document.addEventListener('DOMContentLoaded', function() {
            // Any initialization code
        });
    </script>
</body>
</html>