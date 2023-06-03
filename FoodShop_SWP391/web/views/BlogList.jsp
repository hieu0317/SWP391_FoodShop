<%-- 
    Document   : BlogList
    Created on : May 29, 2023, 4:04:26 AM
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
        <div style="margin-top: 90px" class="container">
            <div class="row">
                <div class="col-3">
                    <select style="width:300px" class="form-select" aria-label="Default select example">
                        <option value="">Diet</option>
                        <option value="">Fruit</option>
                        <option value="">Fast Food</option>
                        <option value="">Restaurant</option>
                    </select>
                </div>
                <div class="col-7">
                    <!--Section: News of the day-->
                    <div class="row gx-5">
                        <div class="col-md-6 mb-4">
                            <div class="bg-image hover-overlay ripple shadow-2-strong rounded-5" data-mdb-ripple-color="light">
                                <img src="https://mdbcdn.b-cdn.net/img/new/slides/080.webp" class="img-fluid" />
                                <a href="#!">
                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                </a>
                            </div>
                        </div>

                        <div class="col-md-6 mb-4">
                            <span class="badge bg-danger px-2 py-1 shadow-1-strong mb-3">News of the day</span>
                            <h4><strong>Facilis consequatur eligendi</strong></h4>
                            <p class="text-muted">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis consequatur
                                eligendi quisquam doloremque vero ex debitis veritatis placeat unde animi laborum
                                sapiente illo possimus, commodi dignissimos obcaecati illum maiores corporis.
                            </p>
                            <button type="button" class="btn btn-primary">Read more</button>
                        </div>
                    </div>

                    <c:forEach items="${sessionScope.blogs}" var="b">
                        <div class="row gx-5">
                            <div class="col-md-6 mb-4">
                                <div class="bg-image hover-overlay ripple shadow-2-strong rounded-5" data-mdb-ripple-color="light">
                                    <img src="./images/blogimage/${b.getBlogImage().getUrl()}" class="img-fluid" />
                                    <a href="#!">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </a>
                                </div>
                            </div>

                            <div class="col-md-6 mb-4">
                                <span class="badge bg-danger px-2 py-1 shadow-1-strong mb-3">News of the day</span>
                                <h4><strong>${b.getBlogTitle()}</strong></h4>
                                <p class="text-muted">
                                    ${b.getDate()}
                                </p>
                                <a href="BlogDetail?id=${b.getBlogID()}"><button type="button" class="btn btn-primary">Read more</button></a>
                            </div>
                        </div> 
                    </c:forEach>


                </div>
            </div>

            <!--Section: News of the day-->

        </div>
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
