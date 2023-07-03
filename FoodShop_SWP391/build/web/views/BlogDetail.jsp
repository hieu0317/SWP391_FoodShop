<%-- 
    Document   : BlogDetail
    Created on : May 29, 2023, 4:04:36 AM
    Author     : toden
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/blogdetail.css">
        <%@include file="../component/head.jsp" %>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>
        <section class="post-content-section">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 post-title-block">

                        <h1 style="color: black" class="text-center">${requestScope.blog.getBlogTitle()}</h1>
                        <ul class="list-inline text-center">
                            <li style="color: black">${requestScope.blog.getAccount().getFullName()} |</li>
                            <li style="color: black">Type |</li>
                            <li style="color: black">${requestScope.blog.getDate()} |</li>
                        </ul>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12">


                        <div class="image-block">
                            <img width="800px" src="./images/blogimage/${requestScope.blog.getBlogImage().getUrl()}" class="img-responsive" >
                        </div>

                        <p>${requestScope.blog.getBlogDetail()}
                        </p>

                    </div>
                    <div class="col-lg-4  col-md-4 col-sm-12">

                        <div class="well">
                            <img src="" class="img-rounded" />
                            <a href="#" class="btn btn-default">Read more</a>
                        </div>
                        <div class="list-group">
                            <c:forEach items="${sessionScope.blogs}" var="b">
                                <a class="list-group-item" href="BlogDetail?id=${b.getBlogID()}"> <h4 class="list-group-item-heading">${b.getBlogTitle()}</h4> <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> </a>

                            </c:forEach>

                            <a class="list-group-item" href="#"> <h4 class="list-group-item-heading">List group item heading</h4> <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> </a>
                            <a class="list-group-item" href="#"> <h4 class="list-group-item-heading">List group item heading</h4> <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> </a> </div>
                        <div class="well">
                        </div>
                    </div>
                </div>


            </div> <!-- /container -->
        </section>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
