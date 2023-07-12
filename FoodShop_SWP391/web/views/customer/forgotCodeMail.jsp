<%-- 
    Document   : forgotCodeMail
    Created on : Jun 10, 2023, 11:50:24 AM
    Author     : ngxso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verification Forgot Password Page</title>
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
                <form id="form-6" action="activeforgot" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Please check the code in your email<span style="color: red"> *</span></span>
                            <input id="code" type="text" name="validateCode" placeholder="Enter your code" class="form-control"required>
                            <span class="form-message"></span>
                        </div>
                    </div>

                    <div class="button">
                        <input type="submit" value="Continue">
                    </div>
                    <div>
                        <p><a href="login"><button type="button" class="color-button">Cancel</button> </a></p>
                    </div>
                </form>
            </div>
        </div>
        <script src="javascript/validate.js"></script>
        <script>
            Validator({
                form: "#form-6",
                errrorSelector: ".form-message",
                rule: [
                    Validator.isRequired('#code')
                ]
            });
        </script>
    </body>
</html>
