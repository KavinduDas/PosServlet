<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management - Fashion Paradise POS</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <!-- Google Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <style>
        :root {
            --bg-color: #f5f5f5;
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
            background-color: #1e1e1e;
            color: white;
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
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .container {
            max-width: 1000px;
            width: 100%;
            margin: 20px 0;
            background: var(--card-color);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            display: flex;
            gap: 20px;
            align-items: stretch;
        }

        .left-panel {
            flex: 1;
            padding-right: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .right-panel {
            flex: 1;
        }

        .panel {
            border: 1px solid var(--border-color);
            padding: 20px;
            border-radius: 5px;
            background-color: var(--card-color);
            transition: all 0.3s ease;
        }

        .panel:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 8px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .form-group:hover {
            background-color: var(--highlight-color);
        }

        .form-group label {
            width: 100px;
            font-size: 14px;
            font-weight: bold;
            margin-right: 15px;
            color: var(--dark-text);
        }

        .form-group input {
            flex: 1;
            padding: 10px;
            font-size: 14px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background-color: var(--card-color);
            color: var(--dark-text);
        }

        .buttons {
            display: flex;
            gap: 12px;
            justify-content: center;
            margin-top: 20px;
        }

        .buttons button {
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .buttons button.save { background: #28a745; color: #fff; }
        .buttons button.search { background: #007bff; color: #fff; }
        .buttons button.update { background: #ffc107; color: #000; }
        .buttons button.delete { background: #dc3545; color: #fff; }

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

        h3 {
            color: var(--dark-text);
            text-align: center;
            margin: 0 0 15px 0;
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
            <span>Admin User</span>
        </div>
    </div>

    <!-- Sidebar -->
    <nav class="sidebar">
        <a href="dashboard?page=dashboard" class="menu-btn">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="Customer.jsp" class="menu-btn">
            <i class="fas fa-user-circle"></i> Customers
        </a>
        <a href="dashboard?page=supplier" class="menu-btn">
            <i class="fa-solid fa-landmark"></i> Supplier
        </a>
        <a href="dashboard?page=employee" class="menu-btn">
            <i class="material-symbols-outlined">badge</i> Employee
        </a>
        <a href="Product.jsp" class="menu-btn active">
            <i class="material-symbols-outlined">add_shopping_cart</i> Product
        </a>
        <a href="dashboard?page=sales" class="menu-btn">
            <i class="material-symbols-outlined">finance_mode</i> Sales
        </a>
        <a href="dashboard?page=invoice" class="menu-btn">
            <i class="fas fa-file-invoice"></i> Invoice
        </a>
        <a href="dashboard?page=reports" class="menu-btn">
            <i class="fas fa-chart-bar"></i> Reports
        </a>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="left-panel">
                <div class="panel">
                    <h3>Product Info</h3>
                </div>
                <form action="addProduct" method="post">
                    <div class="panel">
                        <div class="form-group">
                            <label>Name:</label>
                            <input type="text" id="p_name" name="name">
                        </div>
                        <div class="form-group">
                            <label>Bar Code:</label>
                            <input type="text" id="p_bcode" name="barcode">
                        </div>
                        <div class="form-group">
                            <label>Price:</label>
                            <input type="text" id="p_price" name="price">
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <input type="text" id="p_qty" name="category">
                        </div>
                        <div class="form-group">
                            <label>Supplier ID:</label>
                            <input type="text" id="p_sid" name="supplier">
                        </div>
                        <div class="buttons">
                            <button class="save" type="submit">Save</button>                           
                            <button class="delete" onclick="deleteProduct()">Delete</button>
                        </div>
                    </div>
                    <c:if test="${success}">
                        <script>
                            alert("Successfully updated!");
                        </script>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</body>
</html>