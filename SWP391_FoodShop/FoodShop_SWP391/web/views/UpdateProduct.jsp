<%-- 
    Document   : UpdateProduct
    Created on : Jun 11, 2023, 3:28:10 PM
    Author     : toden
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/home.css">
        <%@include file="../component/head.jsp" %>

    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>
        <div id="editor" style="margin-top: 120px" class="container">
            <h1>Update Product</h1>
            <form method="post" action="ProductUpdate" enctype="multipart/form-data">
                <div class="form-outline">
                    <label class="form-label" for="formControlLg">Product Name</label>

                    <input required name="title" value="${requestScope.product.getProductName()}" type="text" id="formControlLg" class="form-control form-control-lg" />
                </div>
                <div class="md-form">
                    <label for="form7">Detail</label>
                    <textarea id="content" required name="detail" id="form7" class="md-textarea form-control" rows="3">${requestScope.product.getDetails()}</textarea>

                </div>
                <div class="md-form">
                    <label for="form7">price</label>
                    <input required name="price"  value="${requestScope.product.getPrice()}" type="number" id="formControlLg" class="form-control form-control-lg" />

                </div>
                <br>
                <select required name="category" class="select">
                    <c:forEach items="${sessionScope.categories}" var="b">
                        <option value="${b.getCategoryID()}" ${requestScope.product.getCategory().getCategoryID()==b.getCategoryID()?"selected":""} >${b.getCategoryName()}</option> 
                    </c:forEach>
                </select>
                <br>
                <div class="form-outline">
                    <label for="formFileMultiple" class="form-label">Images</label>
                    <input required name="images" class="form-control" type="file" id="formFileMultiple" />
                </div>
                <span style="color: red">${requestScope.err}</span>
                <br>
                <input hidden value="${requestScope.product.getProductID()}" name="id">
                <button type="submit" class="btn btn-primary">Update</button>
            </form>

        </div>
        <%@include file="../component/footer.jsp" %>
        <script>
           CKEDITOR.replace( 'detail' );
        </script>

    </body>
</html>
