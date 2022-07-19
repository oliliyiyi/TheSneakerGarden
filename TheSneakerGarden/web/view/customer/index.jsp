<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="./../../components/head.jsp" %>
        <title>The Sneaker Garden</title>
        <!-- Link To CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <%@include file="./../../components/header.jsp" %>

        <!-- Home -->
        <section class="home" id="home">
            <div id="demo" class="carousel slide w-100 carousel-height" data-bs-ride="carousel">

                <!-- Indicators/dots -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                </div>

                <!-- The slideshow/carousel -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://sneakerbardetroit.com/wp-content/uploads/2015/10/nike-flash-pack-1.jpg" alt="Los Angeles" class="d-block w-100 carousel-image">
                    </div>
                    <div class="carousel-item">
                        <img src="https://thietkewebaio.com/wp-content/uploads/2021/08/thiet-ke-banner-chuan.png" alt="Chicago" class="d-block w-100 carousel-image">
                    </div>
                    <div class="carousel-item">
                        <img src="https://ordixi.com/wp-content/uploads/2019/04/giay-chay-bo-49b814ac.jpg" alt="New York" class="d-block w-100 carousel-image">
                    </div>
                </div>

                <!-- Left and right controls/icons -->
                <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>
        </section>
        <!-- Featured -->
        <section class="featured" id="featured">
            <!-- Heading -->
            <div class="heading">
                <h2>Featured <span>Items</span></h2>
            </div>

            <div class="featured-container container">
                <!-- Box 1 -->
                <div class="box">
                    <img src="${pageContext.request.contextPath}/img/featured1.png" alt="">
                    <div class="text">
                        <h2>New Collection <br>Of Shoes</h2>
                        <a href="#">View More</a>
                    </div>
                </div>
                <!-- Box 2 -->
                <div class="box">
                    <div class="text">
                        <h2>20% Discount <br>On Shoes</h2>
                        <a href="#">View More</a>
                    </div>
                    <img src="${pageContext.request.contextPath}/img/featured2.png" alt="">
                </div>


            </div>
        </section>
        <!-- Shop -->
        <section class="shop" id="shop">
            <div class="heading">
                <h2><Span>Shop</Span> Now</h2>
            </div>
            <!-- Shop Content -->
            <div class="shop-container container">
                <%                    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("listProduct");
                    for (int i = 0; i < list.size(); i++) {
                %>
                <div class="box">
                    <img src="<%=list.get(i).getImage()%>" alt="">
                    <h2><%=list.get(i).getName()%></h2>
                    <span><%=Math.round(list.get(i).getPrice())%> VNĐ</span>
                    <a href="product-detail?id=<%=list.get(i).getId()%>"><i class='bx bx-cart-alt'></i></a>
                </div>
                <%
                    }
                %>
            </div>
        </section>



        <%@include file="./../../components/footer.jsp" %>
        <script>
            function changeTheme() {
                var theme = document.querySelector('.lightmode');
                if (document.body.style.background == "white") {
                    document.body.style.background = "black";
                    document.body.style.color = "black";
                    document.querySelectorAll("span").style.color = "white"

                } else {
                    document.body.style.background = "white";
                    document.body.style.color = "black";

                }
            }
        </script>


    </body>

</html>