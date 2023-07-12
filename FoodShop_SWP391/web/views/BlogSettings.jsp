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
            <form action="BlogSettings" method="get">
                <div style="display: flex">
                    <a href="views/BlogAdd.jsp" class="btn btn-primary">Add Blog</a>
                    <div class="input-group" style="display: flex; justify-content:  flex-end">
                        <div style="width: 500px;"></div>
                        <div class="form-outline">
                            <input style="background-color: #D6D6D6" type="search" name="search" value="${requestScope.search}" id="form1" class="form-control" />
                        </div>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>

                </div>
            </form>
            <form id="orderByFrm" action="BlogSettings" method="get">
                Order By:<select id="mySelect" name="orderby">
                    <option value="blogID" >All</option>
                    <option value="blogTitle" ${orderby=="blogTitle"?"selected":""}>Title</option>
                    <option value="date" ${orderby=="date"?"selected":""}>CreateDate</option>
                </select>
            </form>
            <table  class="table table-dark table-striped">

                <thead>
                    <tr>
                        <td>#</td>
                        <td>Title</td>
                        <td>Image</td> 
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
                                <td><a href="BlogUpdate?id=${p.getBlogID()}"><button style="margin: 1px" class="btn btn-primary">Update</button></a>
                                    <a href="BlogSettings?id=${p.getBlogID()}&del=1"><button style="margin: 1px" class="btn btn-danger">Delete</button></a></td>
                            </tr>
                        </c:if>

                    </c:forEach>
                </tbody>



            </table>
        </div>
        <%@include file="../component/footer.jsp" %>
        <script>
            document.getElementById("mySelect").addEventListener("change", function () {
                document.getElementById("orderByFrm").submit();
            });
        </script>
    </body>
</html>
