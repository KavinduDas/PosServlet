<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // You can store error messages in session like in PHP
    HttpSession sess = request.getSession();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="portalstyles.css">
    <title>Signup - Fashion Paradise</title>
</head>
<body>
<style>

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #1e1e1e;
    color: white;
}

.header {
    background-color: rgba(45, 45, 45, 0.599);
    padding: 10px 20px;
}

h1 {
    font-size: 28px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    font-weight: bold;
}

#titlename {
    position: absolute;
    bottom: 150px;
    left: 75px;
    font-size: 15px;
}

#quotes {
    position: absolute;
    bottom: 120px;
    left: 75px;
    font-size: 13px;
    color: white;
}

.auth-section h2 {
    font-size: 16px;
    font-weight: bold;
    padding-top: 15px;
    text-align: center;
}

p {
    font-size: 15px;
    padding-top: 15px;
}

a {
    font-size: 15px;
    color: green;
    text-decoration: none;
}

.header-content {
    display: flex;
    align-items: center;
    justify-content: center;
}

.logo {
    height: 50px;
    margin-right: 15px;
}

.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: calc(100vh - 80px);
    transition: transform 0.3s ease;
}

.left-image {
    position: absolute;
    left: 350px;
    top: 175px;
    padding-bottom: 20px;
    width: 350px;
}

span.error {
    color: #D8000C;
    font-size: 0.85rem;
    display: block;
    margin-bottom: 10px;
    max-width: 90%;
    word-wrap: break-word;
}

.auth-section {
    position: absolute;
    width: 300px;
    padding: 25px 50px 15px 25px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    background-color: rgba(45, 45, 45, 0.599);
    border-radius: 15px;
    margin-bottom: 110px;
    right: 140px;
}

.auth-field label {
    display: block;
    margin-bottom: 5px;
    font-size: 14px;
    padding-top: 5px;
}

.auth-field input {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 2px solid #989696;
    border-top: none;
    border-left: none;
    border-right: none;
    background-color: transparent;
    font-size: 13px;
    color: white;
}

.btn-container {
    text-align: center;
}

.auth-btn {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: 1px solid #989696;
    cursor: pointer;
    border-radius: 5px;
    transition: transform 0.2s ease;
}

.auth-btn:hover {
    background-color: #555;
    transform: scale(1.05);
}

</style>

<!-- Header -->
<div class="header">
    <div class="header-content">
        <img src="Image/gem.png" alt="Fashion Paradise Logo" class="logo">
        <h1>Welcome to the Fashion Paradise</h1>
    </div>
</div>

<!-- Signup -->
<div class="login-container">
    <!-- Left image -->
    <img src="Image/Signup.png" alt="Signup Illustration" class="left-image">

    <!-- Quotes section -->
    <h2 id="titlename">Quotes of the day :</h2>
    <h3 id="quotes"></h3>

    <!-- Auth form -->
    <div class="auth-section">
        <h2>Signup Portal</h2>
        <form action="addCustomer" method="post" id="signup-form">

            <div class="auth-field">
                <label for="signup-username">Username</label>
                <input type="text" id="signup-username" name="name" 
                       value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>" 
                       required>
                <%
                    if (sess.getAttribute("error_field") != null && sess.getAttribute("error_field").equals("username")) {
                        out.print("<span class='error'>" + sess.getAttribute("error_message") + "</span>");
                    }
                %>
            </div>

            <div class="auth-field">
                <label for="signup-email">Email</label>
                <input type="email" id="signup-email" name="email" 
                       value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" 
                       required>
                <%
                    if (sess.getAttribute("error_field") != null && sess.getAttribute("error_field").equals("email")) {
                        out.print("<span class='error'>" + sess.getAttribute("error_message") + "</span>");
                    }
                %>
            </div>

            <div class="auth-field">
                <label for="signup-password">Password</label>
                <input type="password" id="signup-password" name="password" required>
                <%
                    if (sess.getAttribute("error_field") != null && sess.getAttribute("error_field").equals("password")) {
                        out.print("<span class='error'>" + sess.getAttribute("error_message") + "</span>");
                    }
                %>
            </div>

            <div class="auth-field">
                <label for="signup-confirm-password">Confirm Password</label>
                <input type="password" id="signup-confirm-password" name="confirmPassword" required>
            </div>

            <div class="btn-container">
                <button type="submit" class="auth-btn">Signup</button>
            </div>
        </form>

        <p>Already have an account? <a href="loginNew.jsp">Login</a></p>
    </div>
</div>

<script src="loginscripts.js"></script>

<%
    // Clear error messages after displaying
    sess.removeAttribute("error_field");
    sess.removeAttribute("error_message");
%>

</body>
</html>
