<%-- 
    Document   : cartCompletion
    Created on : Jun 11, 2023, 3:45:00 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <link rel="stylesheet" href="css/cartCompletion.css">
        <link rel="stylesheet" href="css/cart.css">
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
                    <a href="../cart" class="cart-button">My Cart</a>
                    <div class="login">
                        <a href="../profile" class="login-link">Hello-${acc.getFullName()}</a>
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
        <h1 class="thank">Thank you for using my service.Bon appetit!</h1>
        <h3>Order of ${requestScope.order.customerName} - Date:${requestScope.order.date}</h3>
        <h3>The order will be delivered to you as soon as possible - ${requestScope.order.orderStatus.orderStatusName}...</h3>
        <table class="order" border="1px">
            <thead>
                <tr>
                    <th></th>
                    <th>Name</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Into Money</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.ois}" var="ois">
                    <tr>
                        <td><img src="${ois.product.productImage.url}" alt="alt"/></td>
                        <td>${ois.product.productName}</td>
                        <td>${ois.product.price} VNĐ</td>
                        <td>${ois.quantity}</td>
                        <c:set  var="totalprice" value="${ois.product.price * ois.quantity}"/>
                        <td>${totalprice} VNĐ</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h3>Total: ${requestScope.order.total} VNĐ</h3>
        <footer>
            <h2 class="col-md-5">2023 Fast Food Company. All rights reserved.</h2>
            <div class="col-md-3 links">
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
        <script src="../../javascript/home.js"></script>
    </body>
</html>
