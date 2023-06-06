<%-- 
    Document   : changeProfile
    Created on : Jun 3, 2023, 1:50:46 PM
    Author     : PhuongAnh-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    </head>
    <body>
        <h1>Change Profile </h1>
        <form action="changeProfile" method="post">

                  

                <h1></h1>
                <section style="background-color: #eee;">
                    <div class="container py-5">
                        <div class="row">
                            <div class="col">
                                <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item"><a href="home">Home</a></li>


                                        <li class="breadcrumb-item"><a href="profile">User Profile</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Change Profile</li>


                                    </ol>
                                </nav>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card mb-4">
                                    <div class="card-body text-center">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                                             class="rounded-circle img-fluid" style="width: 150px;">
                                        <h5 class="my-3">${requestScope.accounts.getFullName()}</h5>
                                        <p class="text-muted mb-1">${requestScope.accounts.getFullName()}</p>
                                        <p class="text-muted mb-4"></p>
                                        <div class="d-flex justify-content-center mb-2">

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-8">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <!--                                        <form action="profile" method="POST">-->

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Full Name</p>
                                            </div>
                                            <div class="col-sm-9">

                                                <p class="text-muted mb-0"> <input name="fullname" value="${requestScope.accounts.getFullName()}" ></p>
                                            </div>
                                        </div>
                    

                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Phone Number</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input name="phone" value="${requestScope.accounts.getPhoneNumber()}" ></p>
                                            </div>
                                        </div>

                                        
                                        <hr>

                                        


                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Address</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input name="address" value="${requestScope.accounts.getAddress()}" ></p>
                                            </div>
                                        </div>
                                        <br>


                                        <div  style="justify-content: center;align-items:  center ;display: flex" >
                                            <input class="btn btn-outline-primary ms-1" type="submit" value="Save" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </section>


        </form>



    </body>
</html>
