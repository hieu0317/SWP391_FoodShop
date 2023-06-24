<%-- 
    Document   : BlogUpdate
    Created on : Jun 10, 2023, 11:38:42 AM
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
            <h1>Update Blog</h1>
            <form action="BlogUpdate" method="post" enctype="multipart/form-data">
                <div class="form-outline">
                    <label class="form-label" for="formControlLg">Title</label>

                    <input required name="title" value="${requestScope.blog.getBlogTitle()}"  type="text" id="formControlLg" class="form-control form-control-lg" />
                </div>
                <div class="md-form">
                    <label for="form7">Detail</label>
                    <textarea id="content" required name="detail" id="form7" class="md-textarea form-control" rows="3">${requestScope.blog.getBlogDetail()}</textarea>

                </div>
                    <br>
                
                <div class="form-outline">
                    <label for="formFileMultiple" class="form-label">Images</label>
                    <input required name="images" class="form-control" type="file" id="formFileMultiple" />
                </div>
                <span style="color: red">${requestScope.err}</span>
                <br>
                <input hidden value="${requestScope.blog.getBlogID()}" name="id">
                <button type="submit" class="btn btn-primary">Update</button>
            </form>

        </div>
        <%@include file="../component/footer.jsp" %>
        

    </body>
</html>

