<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../css/home.css">
<link rel="stylesheet" href="../css/blogManagement.css">
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
                        <c:if test="${sessionScope.acc.getRole().getRoleID()==4}">
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle">Marketing</a>
                            <ul class="dropdown-menu">
                                <li><a href="BlogSettings">Blog Management</a></li>
                                <li><a href="FeedbackList">Feedback List</a></li>
                            </ul>
                        </div>
                    </c:if>
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
