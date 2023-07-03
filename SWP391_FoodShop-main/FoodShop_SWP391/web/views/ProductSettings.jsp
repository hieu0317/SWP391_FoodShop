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
            
            <form action="ProductSettings" method="get">
                <div style="display: flex">
                    <a href="views/ProductAdd.jsp" class="btn btn-primary">Add Product</a>

                    <div class="input-group" style="display: flex; justify-content:  flex-end">
                        <div style="width: 500px;"></div>
                        <div class="form-outline">
                            <label class="form-label" for="form1">Search</label>
                            <input type="search" value="${requestScope.search}" name="search" id="form1" class="form-control" />
                            
                        </div>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>


                </div>
            </form>
            
            <table  class="table table-dark table-striped">

                <thead>
                    <tr>
                        <td>#</td>
                        <td>Name</td>
                        <td>Img</td>
                        <td>Price</td> 
                        <td>Category</td>  
                        <td>Detail</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.products}" var="p">
                        <c:if test="${p.isStatus()}">
                            <tr>
                                <td>${p.getProductID()}</td>
                                <td>${p.getProductName()}</td>
                                <td><img src="${p.getProductImage().getUrl()}" width="300px" height="300px"></td>
                                <td>${p.getPrice()}</td>
                                <td>${p.getCategory().getCategoryName()}</td>
                                <td>${p.getDetails()}</td>
                                <td><a href="ProductUpdate?id=${p.getProductID()}"><button style="margin: 1px" class="btn btn-primary">Update</button></a>
                                    <a href="ProductSettings?id=${p.getProductID()}&del=1"><button style="margin: 1px" class="btn btn-danger">Delete</button></a></td>
                            </tr>
                        </c:if>

                    </c:forEach>
                </tbody>



            </table>

        </div>
        <%@include file="../component/footer.jsp" %>

    </body>
</html>
