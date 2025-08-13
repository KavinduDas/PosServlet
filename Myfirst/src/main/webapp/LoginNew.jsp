<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login - Fashion Paradise</title>
    <script src="Loginscripts.js"></script>
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

h1{
 font-size: 28px;
 font-family: Georgia, 'Times New Roman', Times, serif;
 font-weight:bold;
}

#titlename{
    position: absolute;
    bottom: 150px;
    left: 75px;
    font-size: 15px;

}

#quotes{
    position: absolute;
    bottom: 120px;
    left: 75px;
    font-size: 13px;
    color: white;

}


.auth-section h2{
    font-size: 16px;
    font-weight: bold;
    padding-top: 15px;
    text-align: center;
    
    
   }

p{
    font-size: 16px;
    font-weight: normal;
    padding-top: 15px;
    
   }

p{
    font-size: 15px;
    
}  

a{
    font-size: 15px;
    color: green;
    text-decoration: none;
    
}  

#subtopic{
    position: absolute;
    left: 225px;
    font-size: 27px;
    color: rgb(74, 74, 74);
    padding-bottom: 300px;
    
    
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
    padding-right: 50px;
    padding-left: 25px;
    padding-bottom: 15px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    background-color: rgba(45, 45, 45, 0.599);
    border: none;
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
}

.auth-btn:hover {
    background-color: #555;
    transform: scale(1.05);
}




</style>
<!-- Header-->
<div class="header">
    <div class="header-content">
     <img src="Image/gem.png" alt="Signature Cuisine Logo" class="logo">
     <h1>Welcome to the Fashion Paradise</h1>
    </div>
</div>

<!-- Form-->
<div class="login-container">
    <img src="Image/loging.png" alt="Description of Image" class="left-image">

    <h2 id="titlename"> Quotes of the day :</h2>
    <h3 id="quotes"></h3>

    <div class="auth-section">
    <h2>Login Portal</h2>
    
    <form action="login" method="post" id="login-form">

 <div class="auth-field">
     <label for="login-email">Email</label>
     <input type="email" id="login-email" name="email" required>
     <!-- Error message for email -->

 </div>

 <div class="auth-field">
     <label for="login-password">Password</label>
     <input type="password" id="login-password" name="password" required>
      <!-- Error message for password -->
     <span class='error'>
     
     </span>
 </div>

 <div class="btn-container">
     <button type="submit" class="auth-btn">Login</button>
 </div>

     <p>Don't have an account? <a href="signup.php">Sign Up</a></p>
</form>
 </div>

</div>

</body>



</html>


