<%-- 
    Document   : listCustomer
    Created on : Jun 10, 2023, 8:29:27 PM
    Author     : PhuongAnh-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />

        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
                text-align: center;
                width: 100%;
            }
            .container-xl {
                display: flex;
                flex-direction: row;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1200px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                max-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            #customer-details {
                flex: 1;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
        </style>

    </head>
    <body>
        
        <div class="container-xl">

            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">

                            <div class="col-sm-6">
                                <h2>Manage <b>Employees</b></h2>
                            </div>
                        </div>
                    </div>
                    <div style="margin-left: -700px">
                    <button>Search</button> <input style="search">
                    </div>
                    <div style="display: flex">
                    <div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Account Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Action</th> <!-- New column for the arrow icon -->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="account" items="${accountList}">
                                    <tr data-account-id="${account.accountID}"
                                        data-email="${account.email}"
                                        data-full-name="${account.fullName}"
                                        data-phone-number="${account.phoneNumber}"
                                        data-address="${account.address}">
                                        <td>${account.accountID}</td>
                                        <td>${account.email}</td>
                                        <td>${account.fullName}</td>
                                        <td>${account.phoneNumber}</td>
                                        <td>${account.address}</td>
                                        <td><i class="ion-arrow-right-c"></i></td> <!-- Ion arrow icon -->
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
                        </div>
                        <div id="customer-details">
                        </div> 
                        

                    </div>
                </div>        

            </div>
        </div>

        <script>
            // Lắng nghe sự kiện click trên các mũi tên
            var arrowIcons = document.getElementsByClassName("ion-arrow-right-c");
            for (var i = 0; i < arrowIcons.length; i++) {
                arrowIcons[i].addEventListener("click", showCustomerDetails);
            }

            // Hàm xử lý sự kiện click
            function showCustomerDetails(event) {
                // Lấy thông tin khách hàng từ dữ liệu đánh dấu (data attributes) trên phần tử tr
                var accountID = event.target.closest("tr").getAttribute("data-account-id");
                var email = event.target.closest("tr").getAttribute("data-email");
                var fullName = event.target.closest("tr").getAttribute("data-full-name");
                var phoneNumber = event.target.closest("tr").getAttribute("data-phone-number");
                var address = event.target.closest("tr").getAttribute("data-address");

                // Cập nhật nội dung trong phần tử "customer-details"
                var customerDetails = document.getElementById("customer-details");
                customerDetails.innerHTML = "<h3>Customer Details</h3>" +
                        "<p><strong>Account ID:</strong> " + accountID + "</p>" +
                        "<p><strong>Email:</strong> " + email + "</p>" +
                        "<p><strong>Full Name:</strong> " + fullName + "</p>" +
                        "<p><strong>Phone Number:</strong> " + phoneNumber + "</p>" +
                        "<p><strong>Address:</strong> " + address + "</p>";
            }
        </script>

    </body>
</html>
