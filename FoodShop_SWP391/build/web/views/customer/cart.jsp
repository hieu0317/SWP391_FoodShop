<%-- 
    Document   : cart
    Created on : May 28, 2023, 7:53:08 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../css/cart.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <div class="navbar">
                <button class="sidebar-button">&#9776; Menu</button>
                <h1 class="logo">Fast Food Restaurant</h1>
                <nav class="header-link">
                    <ul class="navigation">
                        <li><a href="#">Combo</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                    <a href="#" class="cart-button">Cart( )</a>
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

        <div class="cart-detail">
            <h1>CART DETAIL</h1>
            <div class="line"></div>
        </div>
        <form>
            <c:forEach items="cds" var="cds">
                    <div class="cart-content">
                        <img src="../${cds.Product.ProductImage.url}">
                        <h2 class="cart-name" name="productID" value="1">${cds.product.productName}</h2>
                        <div class="input-wrapper">
                            <button id="decrease-btn">-</button>
                            <input  id="number-input" value="${cds.quantity}">
                            <button id="increase-btn">+</button>
                        </div>
                        <a class="delete-button" href=""><img src="../../images/icon/delete.png"></a>
                    </div>

            </c:forEach>
            <button class="buyNow" type="submit">Buy now</button>
        </form> 
                
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
        <script src="../../javascript/cart.js"></script>
         <script src="../../javascript/home.js"></script>
    </body>
</html>
