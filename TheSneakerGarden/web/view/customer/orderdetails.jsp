<%@page import="model.Order"%>
<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CartItem"%>
<%@page import="dbmanager.ProductManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User userInfo = (User) request.getAttribute("detail");
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
        <section class="mt-5 ">
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
                            
                            <div class="my-account mt-4">
                                <a class="account-profile" href="history?id=<%=userInfo.getUserId()%>">
                                    <div class="account-profile-img">
                                        <i class="bi bi-journal-text"></i>
                                    </div>
                                    <div class="account-profile-title" style="line-height: 1rem">
                                        <span>History</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>


                    <!--History-->
                    <div class="col-md-9 card-profile-4 card-body p-4">
                        <h3>Order Details</h3>
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1 align-items-center">
                            <%
                                if (session.getAttribute("user") != null && ((ArrayList<CartItem>) request.getAttribute("orderHistory")).size() > 0) {
                                    ProductManager pm = new ProductManager();
                                    ArrayList<CartItem> list = (ArrayList<CartItem>) request.getAttribute("orderHistory");
                                    for (int i = 0; i < list.size(); i++) {
                                        Product product = pm.getProductByID(list.get(i).getID());
                            %>
                            <div id="myCart">
                                <div class="card artItem rounded-3 mb-4">
                                    <div class="card-body p-4" style="background-color: #eee;">
                                        <div class="row d-flex justify-content-between align-items-center">
                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                <img src="<%=product.getImage()%>" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                            </div>
                                            <div class="col-md-4 col-lg-4 col-xl-4">
                                                <p class="lead fw-normal mb-2"><%=product.getName()%></p>
                                                <p><span class="text-muted">Size: </span><%=list.get(i).getSize()%>
                                            </div>
                                            <div class="col-md-1 col-lg-1 col-xl-1" style="font-size:1.2rem;">
                                                x <%=list.get(i).getQuantity()%>
                                            </div>
                                            <div class="col-md-3 col-lg-2 col-xl-3 offset-lg-1">
                                                <h5 class="mb-0 text-end"><%=Math.round(product.getPrice() * list.get(i).getQuantity())%> VNĐ</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
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
    </body>
</html>
