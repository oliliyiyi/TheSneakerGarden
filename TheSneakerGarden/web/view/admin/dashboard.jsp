<%-- 
    Document   : dashboard
    Created on : Mar 18, 2022, 11:29:23 PM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Order"%>
<%@page import="model.Product"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%
    DecimalFormat formatter = new DecimalFormat("###,###,###");
    if (session.getAttribute("user") == null) {
        response.sendRedirect("./login");
    } else {
        User user = (User) session.getAttribute("user");
        if (user.getRoleID() != 1) {
            response.sendRedirect("./login");
        } else {
            ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
            ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProduct");
            ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrder");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="../../components/head.jsp" %>--%>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Admin</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            body{
                overflow: hidden !important;
            }
        </style>
    </head>
    <body>
        <%@include file="../../components/sidebar-dashboard.jsp" %>
        <div class="main-content">
            <header>
                <div class="search-wrapper">
                    <form action="Search">
                        <input type="text" placeholder="Search..."/>
                        <button style="submit" class="btn btn-warning"><span class="las la-search"></span></button>
                    </form>
                </div> 
                <div class="user-wrapper">
                    <div>
                        <h4><%=user.getUserFullName()%></h4>   
                        <a  style="color: black; text-decoration: none" href="login">Logout</a>    
                    </div>
                </div>
            </header>
            <main>
                <div class="cards">
                    <div class="card-sigle">
                        <div>   <h1><%=listUser.size()%></h1><span>Users</span></div>
                        <div> <span class="las la-users"></span> </div>
                    </div>
                    <div class="card-sigle">
                        <div>   <h1><%=listProduct.size()%></h1><span>Products</span></div>
                        <div> <span class="las la-clipboard"></span> </div>
                    </div>
                    <div class="card-sigle">
                        <div>   <h1><%=listOrder.size()%></h1><span>Orders</span></div>
                        <div> <span class="las la-shopping-bag"></span> </div>
                    </div>
                </div>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Recent products</h3>
                                <a href="item-management"><button>See all<span class="las la-arrow-right"></span></button></a>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">   
                                    <table style="width: 100%">
                                        <thead>
                                            <tr>
                                                <td>Name</td>
                                                <td>Brand</td>
                                                <td>Category</td>
                                                <td>Price</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String brand = null;
                                                String cate = null;
                                                Product p1 = listProduct.get(listProduct.size() - 1);
                                                Product p2 = listProduct.get(listProduct.size() - 2);
                                                Product p3 = listProduct.get(listProduct.size() - 3);
                                                Product p4 = listProduct.get(listProduct.size() - 4);
                                                Product p5 = listProduct.get(listProduct.size() - 5);
                                                ArrayList<Product> listRecentProduct = new ArrayList<Product>();
                                                listRecentProduct.add(p1);
                                                listRecentProduct.add(p2);
                                                listRecentProduct.add(p3);
                                                listRecentProduct.add(p4);
                                                listRecentProduct.add(p5);

                                                for (Product product : listRecentProduct) {
                                                    if (product.getbrandID() == 1) {
                                                        brand = "Nike";
                                                    } else {
                                                        brand = "Adidas";
                                                    }

                                                    if (product.getcId() == 1) {
                                                        cate = "Shoes";
                                                    } else if (product.getcId() == 2) {
                                                        cate = "Shock";
                                                    } else if (product.getcId() == 3) {
                                                        cate = "Hat";
                                                    } else {
                                                        cate = "Backpack";
                                                    }
                                            %>
                                            <tr>
                                                <td><%=product.getName()%></td>
                                                <td><%=brand%></td>
                                                <td><%=cate%></td>
                                                <td><%=formatter.format(product.getPrice())+" VNĐ"%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="customers">
                        <div class="card-user"> 
                            <div class="card-header">
                                <h3>Users</h3>
                                <a href="user-management"><button>See all<span class="las la-arrow-right"></span></button></a>
                            </div>
                            <div class="card-body">
                                <%
                                    User u1 = listUser.get(listUser.size() - 1);
                                    User u2 = listUser.get(listUser.size() - 2);
                                    User u3 = listUser.get(listUser.size() - 3);
                                    ArrayList<User> listRecentUser = new ArrayList<User>();
                                    listRecentUser.add(u1);
                                    listRecentUser.add(u2);
                                    listRecentUser.add(u3);
                                    String role = null;
                                    for (User userRecent : listRecentUser) {
                                        if (userRecent.getRoleID() == 1) {
                                            role = "Admin";
                                        } else {
                                            role = "Customer";
                                        }
                                %>
                                <div class="customer">
                                    <div class="infor">
                                        <div>
                                            <h5><%=userRecent.getUserFullName()%></h5>
                                            <small><%=role%></small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </main>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
<%
        }
    }
%>
