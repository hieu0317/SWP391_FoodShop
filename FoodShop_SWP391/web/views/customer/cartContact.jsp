<%-- 
    Document   : cartContact
    Created on : Jun 8, 2023, 1:10:01 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../css/cartContact.css">
        <link rel="stylesheet" href="../../css/cart.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <div class="navbar">
                <button class="sidebar-button">&#9776; Menu</button>
                <h1 class="logo"><a href="../../">Fast Food Restaurant</a></h1>
                <nav class="header-link">
                    <ul class="navigation">
                        <li><a href="#">Combo</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                    <a href="../cart" class="cart-button">My Cart</a>
                    <div class="login">
                        <a href="../../profile" class="login-link">Hello-${acc.getFullName()}</a>
                    </div>
                </nav>
            </div>
        </header>
        <main>
            <div class="sidebar">
                <button class="close-button">&times;</button>
                <h2>Category</h2>
                <ul>
                    <c:forEach items="${requestScope.categories}" var="c">
                        <li><a href=""><h3>${c.categoryName} ></h3></a></li>
                        </c:forEach>
                </ul>
            </div>

            <div class="payment">
                <div class="cart-detail">
                    <h1>Payment</h1>
                    <div class="line"></div>
                </div>
                <form id="myForm" action="cartContact" method="post">
                    <div class="payment-content">
                        <div class="information">
                            <h2> Enter your information</h2>
                            <div class="input-group">
                                <label>Name<span>*</span></label> 
                                <input class="name" name="name" type="text" value="${acc.getFullName()}" required> 
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <p>Error Message</p>
                            </div> 

                            <div class="input-group">
                                <label>Email<span>*</span></label> 
                                <input class="email" name="email" type="text" value="${acc.getEmail()}" required> 
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <p>Error Message</p>
                            </div> 

                            <div class="input-group">
                                <label>Phone number<span>*</span></label> 
                                <input class="phonenum" name="phonenum" type="text" value="${acc.getPhoneNumber()}" required>
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <p>Error Message</p>
                            </div>

                            <div class="input-group">
                                <label>Address<span>*</span></label> 
                                <input class="address" name="address" type="text" value="${acc.getAddress()}" required>
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <p>Error Message</p>
                            </div>

                            <div>
                                <h3>Payment method<span>*</span></h3>
                                Cash on delivery <input type="radio" name="method" value="COD" required>
                            </div>

                            <div>
                                <h3>Note</h3>
                                <textarea name="note" ></textarea>
                            </div>
                        </div>
                        <div class="review-order">
                            <h2>Review Order</h2>
                            <table class="order" border="1px">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Unit Price</th>
                                        <th>Quantity</th>
                                        <th>Into Money</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="orderTotal" value="0"/>
                                    <c:forEach items="${requestScope.cds}" var="cds">        
                                        <tr>
                                            <td>${cds.p.productName}</td>
                                            <td>${cds.p.price} VNĐ</td>
                                            <td>${cds.quantity}</td>
                                            <c:set var="totalPrice" value="${cds.p.price * cds.quantity}" />
                                            <c:set var="orderTotal" value="${orderTotal + totalPrice}"/>
                                            <td>${totalPrice} VNĐ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" name="total" value="${orderTotal}">
                            <h4>Total: ${orderTotal} VNĐ</h4>
                        </div>
                    </div>
                    <div class="continue">
                        <a href="../../">Keep Buying</a>
                        <input type="submit" value="Order Confirmation">
                    </div>
                </form>
            </div>    
        </main>
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
        <script src="../../javascript/cartContact.js"></script>
    </body>
</html>
