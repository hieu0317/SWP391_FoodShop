<%-- 
    Document   : recoveryPass
    Created on : Jun 10, 2023, 1:45:40 PM
    Author     : ngxso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <title>Reset Password Page</title>
    </head>
    <body>
        <div class="container">
            <div class="title">Reset Password</div>
            <br>
            <div style="color: red">${passError}</div>

            <div class="content">
                <form id="form-4" action="repass" method="post">
                    <div class="user-details">
                        <input hidden="" name="email"/>
                        <div class="input-box">
                            <span class="details">New Password<span style="color: red"> *</span></span>
                            <input id="pass" type="password" name="pass" placeholder="Enter your new password" class="form-control"required>
                            <span class="form-message" style="color: red"></span>
                        </div>
                        <script>
                            var passwordInput = document.getElementById('pass');
                            var formMessage = document.querySelector('.form-message');

                            passwordInput.addEventListener('input', function () {
                                var password = passwordInput.value;
                                var message = '';

                                if (password.length < 8) {
                                    message = 'Password must be at least 8 characters long.';
                                } else if (!/[A-Z]/.test(password)) {
                                    message = 'Password must contain at least one uppercase letter.';
                                } else if (!/[!@#$%^&*()]/.test(password)) {
                                    message = 'Password must contain at least one special character (!@#$%^&*()).';
                                }

                                formMessage.textContent = message;
                            });
                        </script>
                    </div>
                    <ul class="tds-s-list" style="color:#01175e;
                        display:list-item;
                        font-family:Red Hat Display;
                        font-size:15px;
                        line-height:23px;
                        margin:0px 0px 7px 16px;
                        text-align:left">
                        <li class="tds-s-list-item">must contain at least 8 characters in length</li>
                        <li class="tds-s-list-item">must contain at least one upper case (A..Z)</li>
                        <li class="tds-s-list-item">must contain at least one lower case (a..z)</li>
                        <li class="tds-s-list-item">must contain at least 1 special character</li>
                    </ul>

                    <div class="button">
                        <input type="submit" value="Reset Password">
                    </div>

                </form>
            </div>
        </div>
        <script src="javascript/validate.js"></script>
        <script>
    Validator({
        form: "#form-4",
        errrorSelector: ".form-message",
        rule: [
            Validator.isPassword('#pass'),
            Validator.isRequired('#repass')
        ]
    });
        </script>
    </body>
</html>
