<%-- 
    Document   : BlogSettings
    Created on : Jun 4, 2023, 3:34:11 AM
    Author     : toden
--%>
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
            <a href="views/BlogAdd.jsp"><button class="btn btn-primary">Add Blog</button></a>
            <table  class="table table-dark table-striped">

                <thead>
                    <tr>
                        <td>#</td>
                        <td>Title</td>
                        <td>Img</td> 
                        <td>Author</td>  
                        <td>Date</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.blogs}" var="p">
                        <c:if test="${p.isStatus()}">
                            <tr>
                                <td>${p.getBlogID()}</td>
                                <td>${p.getBlogTitle()}</td>
                                <td><img width="100px" src="./images/blogimage/${p.getBlogImage().getUrl()}"></td>
                                <td>${p.getAccount().getFullName()}</td>
                                <td>${p.getDate()}</td>
                                <td><a href=""><button style="margin: 1px" class="btn btn-primary">Update</button></a>
                                    <a href="BlogSettings?id=${p.getBlogID()}&del=1"><button style="margin: 1px" class="btn btn-danger">Delete</button></a></td>
                            </tr>
                        </c:if>

                    </c:forEach>
                </tbody>



            </table>

        </div>
        <%@include file="../component/footer.jsp" %>

    </body>
</html>
