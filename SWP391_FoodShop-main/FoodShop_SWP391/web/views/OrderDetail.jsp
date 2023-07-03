<%-- 
    Document   : OrderDetail
    Created on : Jun 22, 2023, 11:27:32 AM
    Author     : toden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../component/head.jsp" %>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>
        <div class="container">
            <div class="card" style="margin-top: 20px">
                <div class="container-fliud">
                    <div class="wrapper row">

                        <h2>Order Detail</h2>
                        <form action="OrderDetail" method="post">
                            <div class="details col-md-6">
                                <input name="orderId" value="${requestScope.order.getOrderID()}" hidden>
                                <h3 id="name" class="product-title">Customer Name: ${requestScope.order.getAccount().getFullName()}</h3>


                                <p id="description" class="product-description">Order status: ${requestScope.order.getOrderStatus().getOrderStatusName()}</p>
                                <select name="orderStatus">
                                    <c:forEach items="${requestScope.orderStatuses}" var="o">
                                        <option value="${o.getOrderStatus()}" ${requestScope.order.getOrderStatus().getOrderStatus()==o.getOrderStatus()?"selected":""}>
                                            ${o.getOrderStatusName()}</option>
                                        </c:forEach>
                                </select>
                                <h4 class="price">total : <span id="price">${helper.convertToVietnameseDong(requestScope.order.getTotal())}</span></h4>



                                <h4 class="price" for="quantity">Date: ${requestScope.order.getDate()} </h4>
                                <h4 class="price" for="quantity">Address: ${requestScope.order.getAddress()}</h4>
                                <h4 class="price" for="quantity">Note: ${requestScope.order.getNote()}</h4>
                                
                                <button type="submit" class="btn btn-primary">Edit</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
