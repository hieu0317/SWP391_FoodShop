<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="css/register.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="js/register.js"></script>
   </head>
<body>
  <div class="container">
    <div class="title">Registration</div>
    <br>
    <div style="color: red">${error}</div>
    <div style="color: red">${errorPass}</div>
    <div class="content">
        <form action="register" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" name="fullname" placeholder="Enter your name" required>
          </div>
          <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="address" placeholder="Enter your address" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email" placeholder="Enter your email" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="tel" name="phone" placeholder="Enter your phone number" name="phone" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="pass" placeholder="Enter your password" required>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" name="repass" placeholder="Confirm your password" required>
          </div>
        </div>
        
        <div class="button">
          <input type="submit" value="Register">
        </div>
        <div>
          <p>Already have account ? <a href="login">Login</a> 
              <a href="login"><button type="button" class="color-button">Canncel</button> </a></p>
        </div>
        
      </form>
    </div>
  </div>
</form>
</body>

</html>
