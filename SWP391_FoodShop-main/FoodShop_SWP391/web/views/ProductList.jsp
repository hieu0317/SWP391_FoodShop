<%-- 
    Document   : ProductList
    Created on : Jun 11, 2023, 5:51:33 PM
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
        <div class="container">
            <div class="col-sm-12">
                <div class="row" style="margin-top: 20px">
                    <c:forEach items="${requestScope.products}" var="p">

                        <c:if test="${p.isStatus()}">
                            <div style="margin: 10px;" class="card col-sm-3">
                                
                                    <img height="170rem" src="${p.getProductImage().getUrl()}" class="card-img-top" alt="...">
                                
                                <div class="card-body">
                                    <h5 style="height: 100px" class="card-title">${p.getProductName()}</h5>
                                    <p class="card-text">Price: ${helper.convertToVietnameseDong(p.getPrice())}</p>
                                    <a href="ProductDetail?id=${p.getProductID()}" class="btn btn-primary">Detail</a>
                                </div>
                            </div>
                        </c:if>

                    </c:forEach> 
                </div>

            </div>
        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
