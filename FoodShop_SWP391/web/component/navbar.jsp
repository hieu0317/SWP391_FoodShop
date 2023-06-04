<%-- 
    Document   : head
    Created on : Jun 3, 2023, 10:16:45?PM
    Author     : toden
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <li><a href="BlogSettings">Blog Settings</a></li>
                    </c:if>
                    <c:if test="${sessionScope.acc.getRole().getRoleID()==3}">
                    <li><a href="ProductSettings">Product Settings</a></li>
                    </c:if>
            </ul>

            <a href="home/cart" class="cart-button">My Cart</a>
            <div class="login">
                <a href="login" class="login-link">My Account</a>
            </div>
        </nav>
    </div>
</header>

<div class="sidebar">
    <button class="close-button">&times;</button>
    <h2>Category</h2>
    <ul>
        <c:forEach items="${sessionScope.categories}" var="c">
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
