<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Review"%>
<%@page import="dbmanager.ReviewManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    DecimalFormat formatter = new DecimalFormat("###,###,###");
    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("listProduct");
    ReviewManager reviewManager = new ReviewManager();
    int tab = (int) list.size() / 6;
    if (tab * 6 < list.size()) {
        tab += 1;
    }
    int paramBId = -1;
    String paramPrice = "";
    int paramType = -1;
    if (request.getAttribute("paramBId") != null) {
        paramBId = Integer.valueOf(request.getAttribute("paramBId").toString());
    }
    if (request.getAttribute("paramPrice") != null) {
        paramPrice = request.getAttribute("paramPrice").toString();
    }
    if (request.getAttribute("paramType") != null) {
        paramType = Integer.valueOf(request.getAttribute("paramType").toString());
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../components/head.jsp" %>

        <title>The Sneaker Garden</title>


        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("select.form-control").change(function () {
                    var selected = $(this).children("option:selected").val();
                    var data = "";
                    if (selected === "High To Low") {
                        data = "descending";
                    } else {
                        data = "ascending";
                    }
                    window.location.replace("./shop?bId=" +<%=paramBId%> + "&type=" +<%=paramType%> + "&price=" + data);
                });
            });
        </script>

    </head>

    <body>
        <%@include file="../../components/header.jsp" %>
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
                                <li><a class="text-decoration-none" href="shop?bId=<%=paramBId%>&type=1&price=<%=paramPrice%>">Shoes</a></li>
                                <li><a class="text-decoration-none" href="shop?bId=<%=paramBId%>&type=2&price=<%=paramPrice%>">Socks</a></li>
                                <li><a class="text-decoration-none" href="shop?bId=<%=paramBId%>&type=3&price=<%=paramPrice%>">Hats</a></li>
                                <li><a class="text-decoration-none" href="shop?bId=<%=paramBId%>&type=4&price=<%=paramPrice%>">Backpacks</a></li>
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
                                       href="shop">All</a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="h3 text-decoration-none mr-1 ps-3 pe-3 pt-1 pb-1 rounded button-category ${param.bId==1?"active text-white btn-black":"text-dark not-active"}" href="shop?bId=1&type=<%=paramType%>&price=<%=paramPrice%>">Nike</a>
                                </li>
                                <li class="list-inline-item">
                                    <a class="h3 text-decoration-none ps-3 pe-3 pt-1 pb-1 rounded button-category ${param.bId==2?"active text-white btn-black":"text-dark not-active"}" href="shop?bId=2&type=<%=paramType%>&price=<%=paramPrice%>">Adidas</a>
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
                        <%
                            int index = 6;
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
                            <a class="card mb-4 product-wap rounded-0" href="product-detail?id=<%=list.get(i).getId()%>" tabindex="0">
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
                                        <%
                                            float averageRating = reviewManager.getRatingProductByProductID(list.get(i).getId());
                                            if (averageRating != 0) {
                                        %>
                                        <li>
                                            <%
                                                if (averageRating == 5) {
                                            %>        
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <%
                                            } else if (averageRating < 5 & averageRating >= 4) {
                                            %>        
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <%
                                            } else if (averageRating < 4 & averageRating >= 3) {
                                            %>        
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <%
                                            } else if (averageRating < 3 & averageRating >= 2) {
                                            %>        
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <%
                                            } else if (averageRating < 2 & averageRating >= 1) {
                                            %>        
                                            <i aria-hidden="true" class="fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <%
                                            } else if (averageRating < 1 & averageRating >= 0) {
                                            %>        
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <%
                                                }
                                            %>
                                            <%
                                            } else {
                                            %>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <%
                                                }
                                            %>
                                        </li>
                                    </ul>
                                    <p class="text-center mb-0" style="color: #333"><b><span><%=formatter.format(list.get(i).getPrice())+" VNĐ"%></span></b></p>
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
                                    <a id="<%=i+1%>" class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="shop?tab=<%=i + 1%>&bId=<%=paramBId%>&type=<%=paramType%>&price=<%=paramPrice%>"
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
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End First slide-->

                                        <!--Second slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_04.png" alt="Brand Logo" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End Second slide-->

                                        <!--Third slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_01.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_02.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_03.png" alt="Brand Logo" /></a>
                                                </div>
                                                <div class="col-3 p-md-5">
                                                    <a href="#"><img class="img-fluid brand-img" src="${pageContext.request.contextPath}/img/brand_04.png" alt="Brand Logo" /></a>
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

        <%@include file="../../components/footer.jsp" %>

        <!-- Start Script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="${pageContext.request.contextPath}/js/shop.js"></script>
        <!-- End Script -->
    </body>

</html>