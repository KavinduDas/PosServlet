<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <meta charset="UTF-8">
  <title>Customer List</title>
  <style>
    body {
      background: linear-gradient(to right, #e0f7fa, #fce4ec);
      font-family: 'Segoe UI', sans-serif;
      padding: 50px 0;
    }
    .container {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    }
    .table th {
      background-color: #007bff;
      color: white;
    }
    .btn {
      margin: 2px;
    }
    .btn-data {
      background-color: #17a2b8;
      color: white;
    }
    .btn-delete {
      background-color: #dc3545;
      color: white;
    }
  </style>
</head>
<body>

<div class="container">
  <h2 class="text-center text-primary mb-4">Customer List</h2>
  <div class="table-responsive">
    <table class="table table-bordered table-hover text-center align-middle">
      <thead class="table-primary">
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Age</th>
          <th>Password</th>
          <th>View</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="cus" items="${customer}">
          <tr>
            <td>${cus.name}</td>
            <td>${cus.email}</td>
            <td>${cus.age}</td>
            <td>${cus.password}</td>
            <td>
              <form action="singleDataButton" method="post">
                <input type="hidden" name="email" value="${cus.email}" />
                <button type="submit" class="btn btn-sm btn-data">Data</button>
              </form>
            </td>
            <td>
              <form action="deleteCus" method="post">
                <input type="hidden" name="email" value="${cus.email}" />
                <button type="submit" class="btn btn-sm btn-delete">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
