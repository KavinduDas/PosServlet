<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customer Profile</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <style>
    body {
      background: linear-gradient(to right, #e0f7fa, #fce4ec);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Segoe UI', sans-serif;
    }
    .profile-card {
      width: 100%;
      max-width: 500px;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    }
    .form-floating {
      margin-bottom: 15px;
    }
    .btn-update {
      margin-top: 20px;
      width: 100%;
      background-color: #007bff;
      color: white;
      border: none;
      padding: 10px;
      border-radius: 8px;
    }
    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #007bff;
    }
  </style>
</head>
<body>

<c:set var="cus" value="${customer}" />

<div class="profile-card">
  <h2>Welcome to Your Profile</h2>

  <fieldset disabled>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingName" name="name" value="${cus.name}" placeholder="Kavindu">
      <label for="floatingName">Name</label>
    </div>

    <div class="form-floating">
      <input type="email" class="form-control" id="floatingEmail" name="email" value="${cus.email}" placeholder="email@example.com">
      <label for="floatingEmail">Email</label>
    </div>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingAge" name="age" value="${cus.age}" placeholder="Age">
      <label for="floatingAge">Age</label>
    </div>

    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="password" value="${cus.password}" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
  </fieldset>

  <form action="update.jsp" method="post">
    <input type="hidden" name="name" value="${cus.name}">
    <input type="hidden" name="email" value="${cus.email}">
    <input type="hidden" name="age" value="${cus.age}">
    <input type="hidden" name="password" value="${cus.password}">
    <input type="submit" value="Update" class="btn-update">
  </form>
</div>

</body>
</html>
