<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <!---<title> Responsive Registration Form | CodingLab </title>--->
        <link rel="stylesheet" href="css/registerCodeMail.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/register.js"></script>
    </head>

    <body>
        <div class="container">
            <div class="title">Enter the code from your email</div>
            <br>
            <div style="color: red;">${error}</div>
            <div class="content">
                <form action="active" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Please check the code in your email</span>
                            <input type="text" name="validateCode" placeholder="Enter your code" required>
                        </div>
                    </div>

                    <div class="button">
                        <input type="submit" value="Continue">
                    </div>
                    <div>
                        <p><a href="register"><button type="button" class="color-button">Cancel</button> </a></p>
                    </div>
                </form>
            </div>
        </div>
    </form>

</body>

</html>