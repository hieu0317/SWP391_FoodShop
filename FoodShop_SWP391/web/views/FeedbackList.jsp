<%-- 
    Document   : FeedbackList
    Created on : Jun 10, 2023, 12:01:52 PM
    Author     : toden
--%>
<jsp:useBean id="helper" class="helper.helper"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h3>Feedback List</h3>
            <table  class="table table-dark table-striped">

                <thead>
                    <tr>
                        <td>#</td>
                        <td>Product</td>
                        <td>Img</td>
                        <td>Customer</td> 
                        <td>Content</td>  
                        <td>Date</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.feedbacks}" var="f">
                            <tr>
                                <td></td>
                                <td>${f.getProduct().getProductName()}</td>
                                <td><img src="${f.getProduct().getProductImage().getUrl()}" width="300px" height="300px"></td>
                                <td>${f.getAccount().getFullName()}</td>
                                <td>${f.getFcontent()}</td>
                                <td>${f.getDate()}</td>
                                <td></td>
                            </tr>

                    </c:forEach>
                </tbody>



            </table>

        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
