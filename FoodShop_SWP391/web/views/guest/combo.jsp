<%-- 
    Document   : combo
    Created on : Jun 24, 2023, 9:12:32 PM
    Author     : ngxso
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Combo Page</title>
    </head>
    <body>
        <header>
            <div class="navbar">
                <button class="sidebar-button">&#9776; Menu</button>
                <h1 class="logo"><a href="home">Fast Food Restaurant</a></h1>
                <nav class="header-link">
                    <ul class="navigation">
                        <li><a href="combo">Combo</a></li>
                        <li><a href="BlogController">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                            <c:if test="${sessionScope.acc.getRole().getRoleID()==4}">
                            <li><a href="BlogSettings">Blog Settings</a></li>
                            </c:if>
                            <c:if test="${sessionScope.acc.getRole().getRoleID()==3}">
                            <li><a href="ProductSettings">Product Settings</a></li>
                            </c:if>
                    </ul>
                    <c:if test="${not empty acc.accountID}">
                        <a href="home/cart" class="cart-button">My Cart</a>
                        <div class="login">
                            <a href="profile" class="login-link">Hello-${acc.getFullName()}</a>
                        </div>
                    </c:if>
                    <c:if test="${empty acc.accountID}">
                        <a href="login" class="cart-button">My Cart</a>
                        <div class="login">
                            <a href="login" class="login-link">Sign in</a>
                        </div>
                    </c:if>
                </nav>
            </div>
        </header>
        <div class="sidebar">
            <button class="close-button">&times;</button>
            <h2>Category</h2>
            <ul>
                <c:forEach items="${requestScope.categories}" var="c">
                    <li><a href=""><h3>${c.categoryName} ></h3></a></li>
                    </c:forEach>
            </ul>
        </div>
        <div class="recommend-food">
            <h1>Combo</h1>
            <div class="line"></div>
        </div>
        <div class="recFood-content">
            <c:forEach items="${requestScope.combo}" var="co">
                <form id="myForm" action="home" method="POST">
                    <div class="col-md-3">
                        <input type="hidden" name="productID" value="${co.comboID}"/>
                        <a href="comboDetails?id=${co.getComboID()}">
<img src="${co.image}"></a>
                        <a class="productName" href=""><h2>${co.comboName}</h2></a>
                        <button class="buyNow" type="submit">Add to cart</button>
                    </div>
                </form>    
            </c:forEach>
        </div>
<!--        <div class="footer">
            <h2>2023 Fast Food Company. All rights reserved.</h2>
            <div class="links">
                <a href="views/AboutUsPage.jsp">
                    <h2>About Us</h2>
                </a>
                <a href="">
                    <h2>Contact Us</h2>
                </a>
            </div>
            <p> 292 Ba Trieu St., Le Dai Hanh Ward, Hai Ba Trung Dist., Ha Noi City.</br>
                Tel: (028) 38489828 </br>
                Email: lienhe@kfcvietnam.com.vn </br>
                Tax code: 0100773885 </br>
                Date of issue: Oct 29 1998 by Ha Noi Tax Department
            </p>
        </div>-->
        <script src="javascript/home.js"></script>
    </body>
</html>
