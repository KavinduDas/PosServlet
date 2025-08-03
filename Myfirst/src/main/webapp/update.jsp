<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method = "post" action = "">
<div class="form-floating mb-3">
  <input type="text" class="form-control" id="floatingInput" name = "name" value = "${param.name }">
  <label for="floatingInput">Name</label>
</div>

<div class="form-floating mb-3">
  <input type="email" class="form-control" id="floatingInput" name= "email" value = "${param.email}">
  <label for="floatingInput">Email address</label>
</div>

<div class="form-floating mb-3">
  <input type="text" class="form-control" id="floatingInput" name= "age" value = "${param.age }">
  <label for="floatingInput">Age</label>
</div>
<div class="form-floating">
  <input type="text" class="form-control" id="floatingPassword" name = "password"value = "${param.password }">
  <label for="floatingPassword">Password</label>
</div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>