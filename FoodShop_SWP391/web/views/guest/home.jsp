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
                        <li><a href="BlogController">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                            <c:if test="${sessionScope.acc.getRole().getRoleID()==4}">
                            <div class="dropdown">
                                <a href="#" class="dropdown-toggle">Marketing</a>
                                <ul class="dropdown-menu">
                                    <li><a href="BlogSettings">Blog Management</a></li>
                                    <li><a href="FeedbackList">Feedback List</a></li>
                                </ul>
                            </div>

                        </c:if>
                        <c:if test="${sessionScope.acc.getRole().getRoleID()==3}">
                            <div class="dropdown">
                                <a href="#" class="dropdown-toggle">Sale</a>
                                <ul class="dropdown-menu">
                                    <li><a href="ProductSettings">Product Management</a></li>
                                    <li><a href="OrderList">Order List</a></li>
                                </ul>
                            </div>

                        </c:if>
                    </ul>
                    <c:if test="${not empty acc.accountID}">
                        <a href="home/cart" class="cart-button">My Cart</a>
                        <div class="login">
                            <a href="profile" class="login-link">My Account</a>
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
            <style>
                .dropdown {
                    margin-left: 7px;
                    margin-right: 7px;
                }

                .dropdown-toggle {
                    display: block;
                    padding: 8px;
                    font-size: 16px;
                    background-color: #f2f2f2;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    text-decoration: none;
                    color: #333;
                }

                .dropdown-toggle::after {
                    content: "\25BE"; /* Unicode character for down arrow */
                    margin-left: 5px;
                }

                .dropdown-menu {
                    position: absolute;
                    top: 100%;
                    left: 0;
                    z-index: 1;
                    display: none;
                    padding: 0;
                    margin: 0;
                    list-style: none;
                    background-color: #f2f2f2;
                    border: 1px solid #ccc;
                    border-top: none;
                    border-radius: 0 0 4px 4px;
                }

                .dropdown-menu li {
                    padding: 8px;
                }

                .dropdown-menu li a {
                    display: block;
                    text-decoration: none;
                    color: #333;
                }

                .dropdown:hover .dropdown-menu {
                    display: block;
                }

            </style>
        </header>

        <div class="sidebar">
            <button class="close-button">&times;</button>
            <h2>Category</h2>
            <ul>
                <c:forEach items="${requestScope.categories}" var="c">
                    <li><a href="ProductList?id=${c.getCategoryID()}"><h3>${c.categoryName} </h3></a></li>
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
                    <a href="ProductList?id=${c.getCategoryID()}"><img src="${c.catImage}"></a>
                    <a class="categoryName" href="ProductList?id=${c.getCategoryID()}"><h2>${c.categoryName}</h2></a>
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
        </div>
        <script src="javascript/home.js"></script>
    </body>
</html>
