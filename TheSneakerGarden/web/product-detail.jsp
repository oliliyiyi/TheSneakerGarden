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
    //ArrayList<Size> listS = p.getAllSize();
    ArrayList<Product> listP = p.getAllProduct();
    ArrayList<Product> listP2 = new ArrayList<>();

%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <%@include file="components/head.jsp" %>    

        <title>The Sneaker Garden</title>
        <link rel="stylesheet" href="./css/product-detail.css" />
        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="./css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="./css/slick-theme.css">
        <link rel="stylesheet" href="./css/style.css">

    </head>

    <body>
        <%@include file="components/header.jsp" %>
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
                                    <div class="card-header" id="headingTwo">
                                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <i class="bi bi-chevron-down"></i>
                                            <span>Length - Width</span>
                                        </button>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="card-body">
                                            Length:  - Width: 
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

        <!-- Start Article -->
        <section class="py-5">
            <div class="container">
                <div class="row text-left p-2 pb-3">
                    <h4>Related Products</h4>
                </div>

                <!--Start Carousel Wrapper-->
                <div id="carousel-related-product">
                    <%
                        for (int i = 0; i < listP.size(); i++) {
                            if (listP.get(i).getbrandID() == product.getbrandID()) {
                                if (listP.get(i).getId() != product.getId()) {
                                    listP2.add(listP.get(i));
                                }
                            }
                        }

                        for (int i = 0; i < listP2.size(); i++) {
                    %>
                    <div class="p-2 pb-3">
                        <div class="product-wap card rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src=<%=listP2.get(i).getImage()%>>
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-main text-white mt-2" href="./product-detail?id=<%=listP2.get(i).getId()%>"><i
                                                    class="far fa-eye"></i></a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="./product-detail.jsp" class="h3 text-decoration-none">
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

        <%@include file="components/footer.jsp" %>

        <!-- Start Script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="./js/product-detail.js"></script>
        <!-- End Script -->

        <!-- Start Slider Script -->
        <script src="./js/slick.min.js"></script>
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