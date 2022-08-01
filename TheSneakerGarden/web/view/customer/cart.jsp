<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="dbmanager.ProductManager"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    DecimalFormat formatter = new DecimalFormat("###,###,###");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../components/head.jsp" %>
        <title>Cart</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    </head>
    <body>
        <%@include file="../../components/header.jsp" %>

        <section class="h-100" style="margin-top: 15rem">
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-25">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
                            <!--                            <a href="shop.jsp">
                                                            <button class="btn" style="background: #ff7c03; color: #fff">Go to
                                                                shopping</button>
                                                        </a>-->
                            <button type="button" onclick="location.href = './shop'" class="btn btn-primary ms-auto">
                                Go to shopping
                            </button>
                        </div>


                        <div id="myCart">
                            <%                                if (session.getAttribute("cart") != null) {
                                    ProductManager pro = new ProductManager();
                                    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
                                    for (Map.Entry<Integer, CartItem> en : cart.entrySet()) {
                                        Object key = en.getKey();
                                        CartItem val = en.getValue();
                                        Product product = pro.getProductByID(en.getValue().getProductID());
                            %>
                            <div class="card cartItem rounded-3 mb-4">
                                <div class="card-body p-4" style="background-color: #eee;">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="<%=product.getImage()%>" class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <% if (en.getValue().getSize() != 0) {%>
                                        <input type="hidden" name="size" value="<%=en.getValue().getSize()%>">
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2"><%=product.getName()%> - Size: <%=en.getValue().getSize()%></p>
                                        </div>
                                        <% } else {%>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2"><%=product.getName()%></p>
                                        </div>
                                        <% }%>

                                        <div class="col-md col-xl d-flex">
                                            <button class="btn btn-link px-2" 
                                                    onclick="location.href = '/TheSneakerGarden/addToCart?action=minus&id=<%=en.getValue().getProductID()%>&size=<%=en.getValue().getSize()%>'" style="margin-right: 1em">
                                                <i class="bi bi-dash"></i>
                                            </button>

                                            <input id="form1" class="quantity" min="0" name="quantity" value="<%=en.getValue().getQuantity()%>" type="number"
                                                   class="form-control form-control-sm" style="margin-right: 1em"/>

                                            <button class="btn btn-link px-2"
                                                    onclick="location.href = '/TheSneakerGarden/addToCart?action=plus&id=<%=en.getValue().getProductID()%>&size=<%=en.getValue().getSize()%>'">
                                                <i class="bi bi-plus"></i>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0"><%=formatter.format(product.getPrice())+" VND"%></h5>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="#!" class="text-danger"><i class="bi bi-trash-fill"
                                                                                onclick="location.href = '/TheSneakerGarden/addToCart?action=remove&id=<%=en.getValue().getProductID()%>&size=<%=en.getValue().getSize()%>'"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <div class="card" style="background-color: #eee;">
                                <div class="card-body">
                                    <a href="checkout">
                                        <button type="button" class="btn">Proceed to
                                            Pay</button>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                            if (session.getAttribute("cart") == null) {
                        %>
                        <div id="emptyCart"
                             class="container d-flex align-items-center justify-content-center border rounded bg-white pt-5 pb-5"
                             style="visibility: visible;">
                            <div class="text-center">
                                <img src=" ./img/empty_cart.png" alt="">
                                <p class="">There are no products in your shopping cart.</p>
                                <a href="shop">
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
        </section>

        <%@include file="../../components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/product-detail.js"></script>
        <!-- MDB -->
        <!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>-->
  <script>
      
            document.querySelectorAll('.quantity').forEach((item, index) => {
              item.addEventListener('change', event => {
                var x = document.getElementsByClassName('quantity');
                window.location.href = '/TheSneakerGarden/addToCart?action=add&quantity='+x[index].value+'&index='+index+'&id=0'
                console.log(x[index].value);
              });
            });
//            selectElement.forEach(item => {
//            item.addEventListener('click', event => {
//              //handle click
//              
//            })
//          });
            
            var prevScrollpos = window.pageYOffset;

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