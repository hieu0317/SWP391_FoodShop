<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <!---<title> Responsive Registration Form | CodingLab </title>--->
        <link rel="stylesheet" href="css/login.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="javascript/register.js"></script>
    </head>

    <body>
        <div class="container">
            <div class="title">Login</div>
            <br>
            <div style="color: red;">${error}</div>
            <div class="content">
                <form action="login" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Username</span>
                            <input type="text" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" name="password" placeholder="Enter your password" required>
                        </div>
                    </div>

                    <div class="button">
                        <input type="submit" value="Login">
                    </div>
                    <div>
                        <p>Don't have account ? <a href="register">Register</a> 
                                <a href="home"><button type="button" class="color-button">Cancel</button> </a></p>
                    </div>
                </form>
            </div>
        </div>
    </form>

</body>

</html>