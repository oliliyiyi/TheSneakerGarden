<%-- 
    Document   : sidebar-dashboard
    Created on : Mar 19, 2022, 6:10:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale-1">

        <title>Admin</title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
        <style>
            .accordion {
                background-color: #eee;
                color: #444;
                cursor: pointer;
                padding: 18px;
                width: 100%;
                border: none;
                text-align: left;
                outline: none;
                font-size: 15px;
                transition: 0.4s;
            }

            .active, .accordion:hover {
                background-color: #ccc; 
            }

            .panel {
                padding: 0 18px;
                display: none;
                background-color: white;
                overflow: hidden;
                background-color: black;
            }
        </style>

    </head>
    <body>
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <a href="home"> <img src="${pageContext.request.contextPath}/images/LogoTheSneakerGarden.png" style="width: 180px"></a>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="homeAdmin" id="dashboard"><span class="las la-igloo"></span>
                            <span>Dashboard</span></a>
                    </li>
                    <li>
                        <button class="accordion"><span class="las la-users"></span> User</button>
                        <div class="panel">
                            <a href="admin-management" id="user-management">
                                <span>Admin</span></a>
                            <a href="user-management" id="user-management">
                                <span>Customer</span></a>
                        </div>
                    </li>
                    <li>
                        <a href="item-management" id="item-management"><span class="las la-clipboard-list"></span>
                            <span>Product</span></a>
                    </li>
                    <li>
                        <a href="order-management" id="order-management"><span class="las la-shopping-bag"></span>
                            <span>Order</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/header_dashboard.js"></script>
        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
        </script>
    </body>
</html>
