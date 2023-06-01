<%-- 
    Document   : home.jsp
    Created on : May 27, 2023, 6:05:55 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <div class="navbar">
                <button class="sidebar-button">&#9776; Menu</button>
                <h1 class="logo"><a href="home">Fast Food Restaurant</a></h1>
                <nav class="header-link">
                    <ul class="navigation">
                        <li><a href="#">Combo</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                    
                    <a href="home/cart" class="cart-button">Cart(${requestScope.total})</a>
                    <div class="login">
                        <a href="#" class="login-link">My Account</a>
                    </div>
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
        <div class="slider-wrapper">
            <div class="slider">
                <div class="slide">
                    <a href=""><img src="images/slider/buatruavuive.jpg" alt="Slide 1"></a>
                </div>
                <div class="slide">
                    <a href=""><img src="images/slider/gahoangkim.jpg" alt="Slide 2"></a>
                </div>
            </div>
        </div>
        <div class="category">
            <h1>BROWSE CATEGORIES</h1>
            <div class="line"></div>
        </div>
        <div class="category-content">
            <c:forEach items="${requestScope.categories}" var="c">
                <div class="col-md-3">
                    <input type="hidden" name="categoryID" value="${c.categoryID}"/>
                    <a href=""><img src="${c.catImage}"></a>
                    <a class="categoryName" href=""><h2>${c.categoryName}</h2></a>
                </div>
            </c:forEach>
        </div>
        <div class="recommend-food">
            <h1>YOU MAY LIKE</h1>
            <div class="line"></div>
        </div>
        <div class="recFood-content">
            <c:forEach items="${requestScope.recProduct}" var="rd">
                <form id="myForm" action="home" method="POST">
                    <div class="col-md-3">
                        <input type="hidden" name="productID" value="${rd.productID}"/>
                        <a href=""><img src="${rd.productImage.url}"></a>
                        <a class="productName" href=""><h2>${rd.productName}</h2></a>
                        <button class="buyNow" type="submit">Add to cart</button>
                    </div>
                </form>    
            </c:forEach>
        </div>

        <div class="footer">
            <h2>2023 Fast Food Company. All rights reserved.</h2>
            <div class="links">
                <a href="">
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
        </div>
        <script src="javascript/home.js"></script>
    </body>
</html>
