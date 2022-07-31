<%@page import="model.Order"%>
<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CartItem"%>
<%@page import="dbmanager.ProductManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User userInfo = (User) request.getAttribute("detail");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String name = (String) request.getAttribute("javax.servlet.forward.request_uri");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="../../components/head.jsp" %>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>Profile</title>
    </head>

    <body>
        <%@include file="../../components/header.jsp" %>
        <!-- Navbar -->
        <section class="mt-5 " style="margin-top: 15rem !important ">
            <div class="container py-5 px-5 h-100">
                <div class="row d-flex justify-content-center align-items-start h-100">
                    <div class="col-md-3 gradient-custom text-start text-white py-4"
                         style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; background-color: #333">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="Avatar"
                                     class="img-fluid" style="width: 85px;" />
                            </div>
                            <div class="col-8 px-0">
                                <h5 class="d-inline-block"><%=userInfo.getUserFullName()%></h5>
                            </div>
                        </div>


                        <div class="list-down mt-4">
                            <div class="my-account">
                                <a class="account-profile" href="profile?id=<%=userInfo.getUserId()%>">
                                    <div class="account-profile-img">
                                        <i class="bi bi-person"></i>
                                    </div>
                                    <div class="account-profile-title" style="line-height: 1rem">
                                        <span>My account</span>
                                    </div>
                                </a>
                            </div>
                            <%if (name.substring(18).equals("profile")) {%>
                            <div class="my-account-list">
                                <div class="my-account-item">
                                    <div class="my-account-itemlist active" id="1" tab="1">
                                        <span>Profile</span>
                                    </div>
                                    <div class="my-account-itemlist" tab="2">
                                        <span>Address</span>
                                    </div>
                                    <div class="my-account-itemlist" tab="3">
                                        <span>Change password</span>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <div class="my-account mt-4">
                                <a class="account-profile" href="history?id=<%=userInfo.getUserId()%>">
                                    <div class="account-profile-img">
                                        <i class="bi bi-journal-text"></i>
                                    </div>
                                    <div class="account-profile-title <%if (name.substring(18).equals("history")) {%>active<%}%>" style="line-height: 1rem">
                                        <span>History</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card-profile-1 card-body p-4 <%if (name.substring(18).equals("history")) {%>d-none<%}%>" tab="1">
                            <h3>Information</h3>
                            <hr class="mt-0 mb-4">
                            <form action="profile?id=<%=userInfo.getUserId()%>" method="POST">
                                <div class="row pt-1 align-items-center">
                                    <!--<input type="hidden" name="id" value="<%=userInfo.getUserId()%>"/>-->
                                    <div class="col-3 mb-4 text-center">
                                        <h6>Username</h6>
                                    </div>
                                    <div class="col-9 mb-4">
                                        <p style="padding-bottom:2.5px " class="text-muted"><%=userInfo.getUserAccount()%></p>
                                    </div>
                                    <div class="col-3 mb-4 text-center">
                                        <h6>Full name</h6>
                                    </div>
                                    <div class="col-9 mb-4">
                                        <input type="text" class="input-profile" name="fullname" value="<%=userInfo.getUserFullName()%>"/>
                                    </div>
                                    <div class="col-3 mb-4 text-center">
                                        <h6>Email</h6>
                                    </div>
                                    <div class="col-9 mb-4">
                                        <input type="text" class="input-profile" name="email" value="<%=userInfo.getUserEmail()%>"/>
                                    </div>
                                    <div class="col-3 mb-4 text-center">
                                        <h6>Phone</h6>
                                    </div>
                                    
                                    <div class="col-9 mb-4">
                                        <input type="text" class="input-profile" name="phone" value="<%=userInfo.getUserPhone()%>"/>
                                    </div>
                                    <div class="col-3 mb-4 text-center">
                                        <h6>Address</h6>
                                    </div>
                                    <div class="col-9 mb-4">
                                        <input type="text" class="input-profile" name="address" value="<%=userInfo.getUserAddress()%>"/>
                                    </div>
                                    <div class="offset-3 col-9 mb-4">
                                        <button class="btn btn-black">Update</button>
                                    </div>
                                </div>
                            </form>
                            <hr class="mt-0 mb-4">
                            <div class="d-flex justify-content-start">
                                <a href="#!"><i class="fab fa-facebook-f fa-lg me-3 text-warning"></i></a>
                                <a href="#!"><i class="fab fa-twitter fa-lg me-3 text-warning"></i></a>
                                <a href="#!"><i class="fab fa-instagram fa-lg text-warning"></i></a>
                            </div>
                        </div>
                        <div class="card-profile-2 card-body p-4 d-none" tab="2">
                            <h3>My Address</h3>
                            <hr class="mt-0 mb-4">
                            <div class="row align-items-center">
                                <div class="col-9">
                                    <div class="row pt-1 align-items-center">
                                        <div class="col-3 mb-3 text-center">
                                            <h6>Full name</h6>
                                        </div>
                                        <div class="col-9 mb-3">
                                            <p class="text-muted" style="font-size:1.4rem;"><%=userInfo.getUserFullName()%></p>
                                        </div>
                                        <div class="col-3 text-center">
                                            <h6>Phone</h6>
                                        </div>
                                        <div class="col-9">
                                            <p class="text-muted"><%=userInfo.getUserPhone()%></p>
                                        </div>
                                        <div class="col-3 text-center">
                                            <h6>Address</h6>
                                        </div>
                                        <div class="col-9">
                                            <p class="text-muted"><%=userInfo.getUserAddress()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <button class="btn" style="font-size:1.1rem;" disabled>Set default</button>
                                </div>
                            </div>
                        </div>
                        <div class="card-profile-3 card-body p-4 d-none" tab="3">
                            <h3>Change Password</h3>
                            <hr class="mt-0 mb-4">
                            <div class="mx-5">
                                <p>Change password by your email:</p>
                                <form action="EmailSendingControl" method="POST">
                                    <input type="hidden" name="recipient" value="<%=userInfo.getUserEmail()%>"/>
                                    <button class="btn btn-black my-2" type="submit">Click to change password</button>
                                </form>
                            </div>
                        </div>

                        <!--History-->
                        <div class="card-profile-4 card-body p-4 <%if (name.substring(18).equals("profile")) {%>d-none<%}%>">
                            <h3>History</h3>
                            <hr class="mt-0 mb-4">
                            <div class="row pt-1 align-items-center">
                                <%
                                    if (session.getAttribute("user") != null && ((ArrayList<CartItem>) request.getAttribute("orderHistory")).size() > 0) {
                                        ProductManager pm = new ProductManager();
                                        ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrderHistory");
                                        ArrayList<CartItem> list = (ArrayList<CartItem>) request.getAttribute("orderHistory");
                                        CartItem product1 = list.get(1);
                                        Product product = pm.getProductByID(product1.getProductID());
                                        for (Order order : listOrder) {
                                %>
                                <div id="myCart">
                                    <div class="card artItem rounded-3 mb-4">
                                        <div class="card-body p-4" style="background-color: #eee;">
                                            <div class="row d-flex justify-content-between align-items-center">
                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                    <img src="<%=product.getImage()%>" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </div>
                                                <div class="col-md-4 col-lg-4 col-xl-4">
                                                    <p class="lead fw-normal mb-2">Invoice: <%=order.getOrderId()%> </p>
                                                    <p><span class="text-muted">Ship Address: </span><%=order.getShipAddress()%>
                                                    <p><span class="text-muted">Order Date: </span><%=order.getOrderDate()%></p>    
                                                </div>

                                                <div class="col-md-3 col-lg-2 col-xl-3 offset-lg-1">
                                                    <p><a class="view-detail" href="detail-history?id=<%=order.getOrderId()%>"><span>View detail</span></a></p> 
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <%}
                                        }
                                    %>
                                    <%
                                        if (session.getAttribute(
                                                "user") == null) {
                                    %>   
                                    <div id="emptyCart"
                                         class="container d-flex align-items-center justify-content-center border rounded bg-white pt-5 pb-5"
                                         style="visibility: visible;">
                                        <div class="text-center">
                                            <img src=" ./img/empty_cart.png" alt="">
                                            <p class="">There are no products in your history.</p>
                                            <a href="shop.jsp">
                                                <button type="button" class="btn btn-lg"
                                                        style="background: #ff7c03; color: #fff">Continue
                                                    shopping</button>
                                            </a>
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
        </section>

        <%@include file="../../components/footer.jsp" %>
        <% if (session.getAttribute(
                    "Message") != null) {
        %>
        <script>
            alert("<%=(String) session.getAttribute("Message")%>")
        </script>
        <% }%>

        <!-- MDB -->
        <!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
          <script>var prevScrollpos = window.pageYOffset;

            /* Get the header element and it's position */
            var headerDiv = document.querySelector("header");
            var headerBottom = headerDiv.offsetTop + headerDiv.offsetHeight;

            window.onscroll = function () {
                var currentScrollPos = window.pageYOffset;

                /* if we're scrolling up, or we haven't passed the header,
                 show the header at the top */
                if (prevScrollpos > currentScrollPos || currentScrollPos < headerBottom) {
                    headerDiv.style.top = "0";
                } else {
                    /* otherwise we're scrolling down & have passed the header so hide it */
                    headerDiv.style.top = "-20rem";
                }

                prevScrollpos = currentScrollPos;
            }
        </script>
    </body>
</html>
