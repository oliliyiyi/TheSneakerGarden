<%@page import="model.Review"%>
<%@page import="model.Inventory"%>
<%@page import="model.Size"%>
<%@page import="dbmanager.ProductManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Product product = (Product) request.getAttribute("detail");

    ProductManager p = new ProductManager();
    ArrayList<Inventory> list = p.getProductQuantityByProID(product.getId());
    ArrayList<Product> listP = p.getAllProduct();
    ArrayList<Product> listP2 = new ArrayList<>();

%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <%@include file="../../components/head.jsp" %>    

        <title>The Sneaker Garden</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-detail.css" />
        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slick-theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <style>
            .form-review{
                font-family: 'Barlow Semi Condensed', sans-serif;
            }
            .main-section{
                background:#FFFFFF;
                width:80%;
                margin: 0 auto;
                padding: 10px;
                margin-top:50px;
                box-shadow:0px 2px 7px 1px #aa9191;
            }
            .hedding-title h1{
                margin:0px;
                padding:0px 0px 10px 0px;
                font-size:25px;
            }
            .average-rating{
                float:left;
                text-align: center;
                width:30%;
            }
            .average-rating h2{
                margin:0px;
                font-size:80px;
            }
            .average-rating p{
                margin:0px;
                font-size:20px;
            }
            .fa-star,.fa-star-o,.fa-star-half-o{
                color:#FDC91B;
                font-size:25px !important;
            }
            .progress,.progress-2,.progress-3,.progress-4,.progress-5{
                background:#F5F5F5;
                border-radius: 13px;
                height:18px;
                width:97%;
                padding:3px;
                margin:5px 0px 3px 0px;
            }
            .progress:after,.progress-2:after,.progress-3:after,.progress-4:after,.progress-5:after{
                content: '';
                display: block;
                background: #337AB7;
                width:80%;
                height: 100%;
                border-radius: 9px;
            }
            .progress-2:after{
                width: 60%;
            }
            .progress-3:after{
                width:40%;
            }
            .progress-4:after{
                width:20%;
            }
            .progress-5:after{
                width:10%;
            }
            .loder-ratimg{
                display: inline-block;
                width:40%;
            }
            .start-part{
                float:right;
                width:30%;
                text-align: center;
            }
            .start-part span{
                color:#337AB7;
                font-size:23px;
            }
            .reviews h1{
                margin:10px 0px 20px 30px;
            }
            .user-img img{
                height: 80px;
                width: 80px;
                border:1px solid blue;
                border-radius: 50%;
            }
            .user-img-part{
                width:30%;
                float:left;
            }
            .user-img{
                width:48%;
                float:left;
                text-align: center;
            }
            .user-text{
                float:left;
            }
            .user-text h4,.user-text p{
                margin:0px 0px 5px 0px;
            }
            .user-text p{
                font-size: 20px;
                font-weight: bold;
            }
            .user-text h4,.user-text span{
                color:#B3B5B4;
            }
            .comment{
                width:68%;
                float:right;
            }
        </style>
    </head>

    <body>
        <%@include file="../../components/header.jsp" %>
        <!-- Open Content -->
        <section class="bg-white">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-lg-5 mt-5">
                        <div class="card mb-3">
                            <img class="card-img img-fluid" src="<%=product.getImage()%>" alt="Card image cap" id="product-detail">
                        </div>
                    </div>
                    <!-- col end -->
                    <div class="col-lg-7 mt-5">
                        <div class="card no-border">
                            <div class="card-body pt-0">
                                <h1 class="h2 product-name">
                                    <%=product.getName()%>
                                </h1>
                                <ul class="list-unstyled d-flex justify-content-start mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul>
                                <p class="h3 py-2 mb-0"><%=Math.round(product.getPrice())%>₫</p>
                                <hr class="mb-2 h-auto"/>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <%
                                            if (product.getbrandID() == 1) {
                                        %>

                                        <h6 class="branch-name">Brand:&nbsp Nike</h6>
                                        <%
                                        } else {
                                        %>
                                        <h6 class="branch-name">Brand:&nbsp Adidas</h6>
                                        <%
                                            }
                                        %>
                                    </li>
                                </ul>

                                <form action="addToCart" onsubmit="return validateAddToCart();">

                                    <%
                                        if (list != null) {
                                            if (list.size() > 0 && list.get(0).getSizeNum() != 0) {
                                    %>
                                    <ul class="list">
                                        <li class="list-item">
                                            <input hidden value="" name="size" id="size"/>
                                            <div class="size-block">
                                                <div class="row">
                                                    <div class="col-1 m-auto">
                                                        <h6>Size:</h6>
                                                    </div>
                                                    <div class="col-11 pl-5">

                                                        <%
                                                            for (Inventory inv : list) {
                                                        %>
                                                        <div class="size-box" style="display:inline-block">
                                                            <button type="button" value="<%= inv.getSizeNum()%>" stock="<%=inv.getQuantity()%>" class="size-button"><%= inv.getSizeNum()%></button>
                                                        </div>
                                                        <%
                                                            }
                                                        %>

                                                    </div>

                                                </div>
                                                <div class="row mt-2">
                                                    <div class="col-1 m-auto">
                                                    </div>
                                                    <div class="col-11 pl-5">
                                                        <small id="size-err" class="invalid-message"></small>
                                                    </div>

                                                </div>


                                            </div>
                                        </li>
                                    </ul>
                                    <%
                                            }
                                        }
                                    %>


                                    <input type="hidden" name="action" value="add">

                                    <input type="hidden" name="id" value="<%=product.getId()%>">
                                    <div class="row">
                                        <div class="col-auto">
                                            <ul class="list-inline pb-3">
                                                <li class="list-inline-item text-right">
                                                    Quantity
                                                    <input type="hidden" name="product-quantity" id="product-quanity" value="1">
                                                </li>
                                                <li class="list-inline-item">
                                                    <span class="btn btn-black" id="btn-minus">-</span>
                                                    <span class="badge bg-secondary quantity-select" id="var-value">1</span>
                                                    <span class="btn btn-black" id="btn-plus">+</span>
                                                </li>
                                                <li class="list-inline-item">
                                                    <div class="col d-grid">
                                                        <button type="submit" class="btn btn-black btn-lg">
                                                            <a>Add to cart</a>
                                                        </button>
                                                    </div>
                                                </li>
                                                <li class="list-inline-item">
                                                    <span class="product-availble">
                                                        <%
                                                            if (list != null) {
                                                                if (list.size() > 0 && list.get(0).getSizeNum() == 0) {
                                                        %>
                                                        In stock: <%=list.get(0).getQuantity()%>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </form>

                                <div id="accordion" class="accordion">
                                    <div class="card-header plain" id="headingOne">
                                        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <i class="bi bi-chevron-down"></i>
                                            <span>Description</span>
                                        </button>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card-body">
                                            <%=product.getDescription()%>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Close Content -->
        <section class="form-review">
            <div class="main-section">
                <div class="hedding-title"><h1>Star Rating System</h1></div>
                <div class="rating-part">
                    <div class="average-rating">
                        <h2>2.5</h2>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <p>Average Rating</p>
                    </div>
                    <div class="loder-ratimg">
                        <div class="progress"></div>
                        <div class="progress-2"></div>
                        <div class="progress-3"></div>
                        <div class="progress-4"></div>
                        <div class="progress-5"></div>
                    </div>
                    <div class="start-part">
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <span>80%</span><br>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <span>60%</span><br>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <span>40%</span><br>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <span>20%</span><br>
                        <i aria-hidden="true" class="fa fa-star"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <i aria-hidden="true" class="fa fa-star-o"></i>
                        <span>10%</span>
                    </div>
                    <div style="clear: both;"></div>
                    <div class="reviews"><h1>Reviews</h1></div>
                    <div class="comment-part">
                        <%
                            ArrayList<Review> listReview = (ArrayList<Review>) request.getAttribute("listReview");
                            ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
                            if (listReview != null) {
                                for (Review rv : listReview) {
                                    for (User u : userList) {
                                        if (u.getUserId() == rv.getCustomerID()) {
                        %>
                        <div class="user-img-part">
                            <div class="user-img">
                                <img src="/demo/man01.png">
                            </div>
                            <div class="user-text">
                                <h4><%=rv.getReviewDate()%></h4>
                                <p><%=u.getUserFullName()%></p> 
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                        <div class="comment">
                            <i aria-hidden="true" class="fa fa-star"></i>
                            <i aria-hidden="true" class="fa fa-star"></i>
                            <i aria-hidden="true" class="fa fa-star"></i>
                            <i aria-hidden="true" class="fa fa-star"></i>
                            <i aria-hidden="true" class="fa fa-star-o"></i>
                            <p><%=rv.getMessage()%></p>
                        </div>
                        <div style="clear: both;"></div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>

                        <%
                            if (session.getAttribute("user") != null) {
                                User userSession = (User) session.getAttribute("user");
                        %>
                        <div class="user-img-part">
                            <div class="user-img">
                                <img src="/demo/man01.png">
                            </div>
                            <div class="user-text">
                                <p><%=userSession.getUserFullName()%></p>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                        <div class="comment">
                            <form action="product-detail?action=add&id=<%=product.getId()%>" method="POST">
                                <div>
                                    <textarea style="width: 70%; resize: none" class="form-control" name='feedback' placeholder="Enter your feedback"></textarea>
                                </div>
                                <input type="submit" value="Post" class="btn btn-primary" style="margin: 10px 0px 50px 0px">
                            </form>
                        </div>
                        <div style="clear: both;"></div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </section>
        <!-- Start Article -->
        <section class="py-5">
            <div class="container">
                <div class="row text-left p-2 pb-3">
                    <h4>Related Products</h4>
                </div>

                <!--Start Carousel Wrapper-->
                <div id="carousel-related-product">
                    <%                        for (int i = 0;
                                i < listP.size();
                                i++) {
                            if (listP.get(i).getbrandID() == product.getbrandID()) {
                                if (listP.get(i).getId() != product.getId()) {
                                    listP2.add(listP.get(i));
                                }
                            }
                        }

                        for (int i = 0;
                                i < listP2.size();
                                i++) {
                    %>
                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src=<%=listP2.get(i).getImage()%>>
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="product-detail?id=<%=listP2.get(i).getId()%>" class="h3 text-decoration-none">
                                    <h5><%=listP2.get(i).getName()%></h5>
                                </a>
                                <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                </ul>
                                <p class="text-center mb-0" style="color: #333"><b><%=Math.round(listP2.get(i).getPrice())%> VNĐ</b></p>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>
        <!-- End Article -->

        <%@include file="../../components/footer.jsp" %>

        <!-- Start Script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="${pageContext.request.contextPath}/js/product-detail.js"></script>
        <!-- End Script -->

        <!-- Start Slider Script -->
        <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
        <script>
                                    $('#carousel-related-product').slick({
                                        infinite: true,
                                        arrows: true,
                                        slidesToShow: 4,
                                        slidesToScroll: 3,
                                        dots: true,
                                        responsive: [{
                                                breakpoint: 1024,
                                                settings: {
                                                    slidesToShow: 3,
                                                    slidesToScroll: 3
                                                }
                                            },
                                            {
                                                breakpoint: 600,
                                                settings: {
                                                    slidesToShow: 2,
                                                    slidesToScroll: 3
                                                }
                                            },
                                            {
                                                breakpoint: 480,
                                                settings: {
                                                    slidesToShow: 2,
                                                    slidesToScroll: 3
                                                }
                                            }
                                        ]
                                    });
        </script>
        <!-- End Slider Script -->
    </body>

</html>