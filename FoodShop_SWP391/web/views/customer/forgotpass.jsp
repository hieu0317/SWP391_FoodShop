<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/login.css">
        <title>Forgot Password Page</title>
    </head>
    <body>
        <div class="container">
            <div class="title">Forgot Password</div>
            <br>
            <div style="color: red">${error}</div>
            <div class="content">
                <form id="form-5" action="forgotpass" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <p class="details">Email<span style="color: red"> *</span></p>
                            <input id="email" type="text" name="email" placeholder="Enter your email" required>
                            <span class="form-message"></span>
                        </div>
                    </div>                  
                    <div class="button">
                        <input type="submit" value="Reset Password">
                    </div>
                </form>
            </div>
        </div>
        <script src="javascript/validate.js"></script>
        <script>
            Validator({
                form: "#form-5",
                errrorSelector: ".form-message",
                rule: [
                    Validator.isEmail('#email')
                ]
            });
        </script>
    </body>
</html>
