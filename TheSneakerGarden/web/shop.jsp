<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("listProduct");
    int tab = (int) list.size() / 6;
    if (tab * 6 < list.size()) {
        tab += 1;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/head.jsp" %>

        <title>The Sneaker Garden</title>

        <link rel="stylesheet" href="./css/shop.css" />
        <link rel="stylesheet" href="./css/style.css">

    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Start Content -->
        <div class="container py-5 mt-0" style="margin-top: 80px">
            <div class="row mt-5">
                <div class="col-lg-3">
                    <h1 class="h2 pb-4">Categories</h1>
                    <ul class="list-unstyled type-group">

                        <li class="pb-3">
                            <a class="d-flex justify-content-between h3 text-decoration-none" href="#">
                                Type
                            </a>
                            <ul class="pl-3">
                                <li><a class="text-decoration-none" href="#">Shoes</a></li>
                                <li><a class="text-decoration-none" href="#">Socks</a></li>
                                <li><a class="text-decoration-none" href="#">Hats</a></li>
                                <li><a class="text-decoration-none" href="#">Backpacks</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-md-9">
                            <ul class="list-inline shop-top-menu pb-3 pt-1">
                                <li class="list-inline-item">
                                    <a class="h3 text-decoration-none mr-1 ps-3 pe-3 pt-1 pb-1 rounded button-category ${param.bId==null?"active text-white btn-black":"text-dark not-active"}"
                                       href="./shop">All</a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="h3 text-decoration-none mr-1 ps-3 pe-3 pt-1 pb-1 rounded button-category ${param.bId==1?"active text-white btn-black":"text-dark not-active"}" href="shop?bId=1">Nike</a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="h3 text-decoration-none ps-3 pe-3 pt-1 pb-1 rounded button-category ${param.bId==2?"active text-white btn-black":"text-dark not-active"}" href="shop?bId=2">Adidas</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-3 pb-4">
                            <div class="d-flex">
                                <select class="form-control">
                                    <option>Newest</option>
                                    <option>Low To High</option>
                                    <option>High To Low</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <%                            int index = 6;
                            int step = 0;
                            if (list.size() < 6) {
                                index = list.size();
                            } else if (request.getAttribute("tab") != null) {
                                if (6 * Integer.valueOf(request.getAttribute("tab").toString()) < list.size()) {
                                    index = 6 * Integer.valueOf(request.getAttribute("tab").toString());
                                } else {
                                    index = list.size();
                                }

                                step = (Integer.valueOf(request.getAttribute("tab").toString()) - 1) * 6;
                            }
                            for (int i = step; i < index; i++) {
                        %>
                        <div class="col-md-4">
                            <a class="card mb-4 product-wap rounded-0" href="./product-detail?id=<%=list.get(i).getId()%>" tabindex="0">
                                <div class="card rounded-0">
                                    <img class="card-img-product card-img rounded-0 img-fluid" src="<%=list.get(i).getImage()%>" />
                                    <div class="card-img-overlay rounded-0 product-card-img d-flex align-items-center justify-content-center">
                                        <ul class="list-unstyled">
                                            <li>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body card-body-height">
                                    <h5 class="h3 text-decoration-none text-dark"><%=list.get(i).getName()%></h5>
                                    <ul class="list-unstyled d-flex justify-content-center mb-1">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                    </ul>
                                    <p class="text-center mb-0" style="color: #333"><b><%=Math.round(list.get(i).getPrice())%> VNĐ</b></p>
                                </div>
                            </a>
                        </div>
                        <%
                            }
                        %>
                        <div div="row">
                            <ul class="pagination pagination-lg justify-content-end">
                                <%
                                    for (int i = 0; i < tab; i++) {
                                %>
                                <li class="page-item text-dark">
                                    <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="./shop?tab=<%=i + 1%>"
                                       ><%=i + 1%></a>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>      
        </div>

        <!-- End Content -->

        <!-- Start Brands -->
        <section class="bg-light py-5 mt-5">
            <div class="container my-4">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="header">Our Brands</h1>
                        <p>
                            Whether you make it loud or keep it neutral, customise a shoe
                            that's more like you with Nike's co-creation service.
                        </p>
                    </div>
                    <div class="col-lg-9 m-auto tempaltemo-carousel">
                        <div class="row d-flex flex-row">
                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                    <i class="text-light fas fa-chevron-left"></i>
                                </a>
                            </div>
                            <!--End Controls-->

                            <!--Carousel Wrapper-->
                            <div class="col">
                                <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example"
                                     data-bs-ride="carousel">
                                    <!--Slides-->
                                    <div class="carousel-inner product-links-wap" role="listbox">
                                        <!--First slide-->
                                        <div class="carousel-item active">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End First slide-->

                                        <!--Second slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Second slide-->

                                        <!--Third slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="./img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Third slide-->
                                    </div>
                                    <!--End Slides-->
                                </div>
                            </div>
                            <!--End Carousel Wrapper-->

                            <!--Controls-->
                            <div class="col-1 align-self-center">
                                <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                    <i class="text-light fas fa-chevron-right"></i>
                                </a>
                            </div>
                            <!--End Controls-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Brands-->

        <%@include file="components/footer.jsp" %>

        <!-- Start Script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="./js/shop.js"></script>
        <!-- End Script -->
    </body>

</html>