<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <meta charset="UTF-8">
  <title>Home</title>
  <style>
    body {
      background: linear-gradient(to right, #f8f9fa, #e0f7fa);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: Arial, sans-serif;
    }
    .container {
      text-align: center;
      background-color: white;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }
    .btn {
      margin: 10px;
      width: 150px;
    }
    form {
      margin-top: 20px;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2 class="mb-4 text-primary">Welcome</h2>

    <a href="login.jsp">
      <button type="button" class="btn btn-outline-primary">Login</button>
    </a>
    <a href="register.jsp">
      <button type="button" class="btn btn-outline-success">Register</button>
    </a>

    <form action="adminCustomer" method="post">
      <button type="submit" class="btn btn-outline-dark">All Customers</button>
    </form>
  </div>

</body>
</html>
