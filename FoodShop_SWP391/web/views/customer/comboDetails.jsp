<%-- 
    Document   : comboDetails
    Created on : Jun 25, 2023, 11:54:38 PM
    Author     : PhuongAnh-PC
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
      <div class="recommend-food">
            <h1>Combo Details</h1>
            <div class="line"></div>
        </div>

    <form id="myForm" action="home" method="POST" onsubmit="return confirm('Are you sure to add to cart?');">
        <c:if test="${not empty comboDetails}">
            <input type="hidden" name="productID" value="${comboDetails.comboID}"/>
            <div style="display: flex; justify-content: center">
                <div style="margin: 70px;">
                    <img src="${comboDetails.image}" alt=""/>
                </div>
                <div style="box-shadow: 0px 0px 10px #000; max-width: 40%; max-height:10%;  border-radius: 10px; margin: 100px;">
                    <div style="margin: 50px 40px">
                        <h2 style="font-weight: 700;">${comboDetails.comboName} ${comboDetails.price}VNĐ</h2>
                        <h3 style="color: #666666; font-weight: 300 ">${comboDetails.describe}</h3>
                    </div>
                    <div >
                        <button class="buyNow" style="margin-bottom: 20px;margin-left: 250px; border-radius: 10px; padding: 15px 20px; background-color: #f0f0f0; border: none; color: #333; font-size: 16px;" type="submit">Add to cart</button>
                    </div>
                </div>
            </div>
        </c:if>
    </form>

    <script src="javascript/home.js"></script>
</body>
</html>
