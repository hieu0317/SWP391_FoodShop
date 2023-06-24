<%-- 
    Document   : OrderList
    Created on : Jun 11, 2023, 11:52:17 PM
    Author     : toden
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="helper.helper"/>
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
        <div style="margin-top: 120px" class="container">
            <br>
            <h3>Order List</h3>
            <table  class="table table-dark table-striped">

                <thead>
                    <tr>
                        <td>#</td>
                        <td>Customer</td>
                        <td>Total</td> 
                        <td>Date</td>  
                        <td>Note</td>
                        <td>Address</td>
                        <td>OrderStatus</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.orders}" var="o">
                            <tr>
                                <td></td>
                                <td>${o.getAccount().getFullName()}</td>
                                <td>${helper.convertToVietnameseDong(o.getTotal())}</td>
                                <td>${o.getDate()}</td>
                                <td>${o.getNote()}</td>
                                <td>${o.getAddress()}</td>
                                <td>${o.getOrderStatus().getOrderStatusName()}</td>
                                <td></td>
                            </tr>

                    </c:forEach>
                </tbody>



            </table>

        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
