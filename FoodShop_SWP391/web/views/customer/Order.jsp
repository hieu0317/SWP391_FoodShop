<%-- 
    Document   : Order
    Created on : Jun 17, 2023, 1:03:31 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="css/order.css">
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

                    <a href="cart" class="cart-button">My Cart</a>
                    <div class="login">
                        <a href="profile" class="login-link">Hello-${acc.getFullName()}</a>
                    </div>

                </nav>
            </div>
        </header>
        <main>
            <div class="Orders">
                <h1>MY ORDERS</h1>
                <div class="line"></div>
            </div>
            <div class="tool">
                <form action="myOrder" method="GET">
                    <input type="text" name="name" placeholder="Input name of food">
                    <input type="submit" value="Search">
                </form>
                <select id="mySelect" name="value">
                    <option>Sort order by:</option>
                    <option value="0">Sort by price:high to low</option>
                    <option value="1">Sort by price:low to high</option>
                    <option value="2">Sort by date</option>
                </select>
            </div>
            <div id="container">
                <div class="title">                    
                    <h4>Customer Name</h4>
                    <h4>Payment method</h4>
                    <h4>Total</h4>
                    <h4>Date</h4>
                    <h4>Status</h4>
                </div>
                <c:forEach items="${requestScope.orders}" var="o" varStatus="loop">
                    <div class="order-content">
                        <div class="order-info">
                            <h4>${loop.index + 1}</h4>
                            <h4>${o.getCustomerName()}</h4>
                            <h4>${o.getPaymentMethod()}</h4>
                            <h4>${o.getTotal()} VNĐ</h4>
                            <h4>${o.getDate()}</h4>
                            <h4>${o.orderStatus.getOrderStatusName()}</h4>
                        </div>
                        <a href=""><img src="images/icon/eye.png" alt="alt"/></a>
                    </div>
                </c:forEach>
            </div>
            <button id="viewMoreBtn" onclick="showMoreDivs()">View more</button>
        </main>
        <footer>
            <h2 class="col-md-4">2023 Fast Food Company. All rights reserved.</h2>
            <div class="col-md-4 links">
                <a href="">
                    <h2>About Us</h2>
                </a>
                <a href="">
                    <h2>Contact Us</h2>
                </a>
            </div>
            <p class="col-md-4"> 292 Ba Trieu St., Le Dai Hanh Ward, Hai Ba Trung Dist., Ha Noi City.</br>
                Tel: (028) 38489828 </br>
                Email: lienhe@kfcvietnam.com.vn </br>
                Tax code: 0100773885 </br>
                Date of issue: Oct 29 1998 by Ha Noi Tax Department
            </p>
        </footer>        
    <script src="javascript/myOrder.js"></script>
    </body>
</html>
