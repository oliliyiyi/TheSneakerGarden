<%@page import="model.PaymentType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbmanager.UserManager"%>
<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page import="java.util.Map"%>
<%@page import="model.CartItem"%>
<%@page import="model.CartItem"%>
<%@page import="dbmanager.ProductManager"%>
<%
    UserManager userManager = new UserManager();
    ArrayList<PaymentType> types = (ArrayList<PaymentType>) request.getAttribute("type");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../components/head.jsp" %>
        <title>The Sneaker Garden</title>

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/form-validation.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/checkout.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>
    <body class="bg-light" style="margin-bottom: 20%;">
        <%@include file="../../components/header.jsp" %>

        <div class="container">
            <main>
                <div class="py-5 text-center">
                    <h2>Checkout</h2>
                </div>

                <div class="row g-5">
                    <div class="col-12 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary label-title">Your cart</span>
                        </h4>
                        <form class="needs-validation" novalidate action="checkout" method="POST">
                            <ul class="list-group mb-3">
                                <%      if (session.getAttribute("cart") != null) {
                                        ProductManager pro = new ProductManager();

                                        double total = 0;
                                        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
                                        for (Map.Entry<Integer, CartItem> en : cart.entrySet()) {
                                            Object key = en.getKey();
                                            CartItem val = en.getValue();
                                            Product product = pro.getProductByID(en.getValue().getProductID());
                                            total += product.getPrice() * en.getValue().getQuantity();

                                %>
                                <li class="list-group-item d-flex justify-content-between align-items-center lh-sm py-4">
                                    <div class="d-flex justify-content-between">
                                        <div style="width:50px">
                                            <img src="<%=product.getImage()%>"/>
                                        </div>
                                        <div class="my-2 mx-5">
                                            <h6 class="my-0"><%=product.getName()%>x<%=en.getValue().getQuantity()%></h6>
                                            <small class="text-muted"><%=product.getPrice()%></small>
                                        </div>
                                    </div>
                                    <span class="text-muted my-2"><%=product.getPrice() * en.getValue().getQuantity()%></span>
                                </li>
                                <%

                                    }
                                %>
                                <% if (session.getAttribute("user") == null) {%>
                                <li class="list-group-item d-flex align-items-center justify-content-between py-4">
                                    <div class="col-12">
                                        <h4 class="mb-3">Billing address</h4>
                                        <div class="row g-3">
                                            <div class="col-sm-6">
                                                <label for="fullname" class="form-label">Full name</label>
                                                <input type="text" class="form-control" placeholder="" name="fullname" value="" required>
                                                <div class="invalid-feedback">
                                                    Valid Full name is required.
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <label for="phone" class="form-label">Phone</label>
                                                <input type="text" class="form-control" placeholder="" name="phone" value="" required>
                                                <div class="invalid-feedback">
                                                    Valid Phone is required.
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="email" class="form-label">Email</label>
                                                <input type="email" class="form-control" name="email" value="">
                                                <div class="invalid-feedback">
                                                    Please enter a valid email address for shipping updates.
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="address" class="form-label">Address</label>
                                                <input type="text" class="form-control" name="address" value="" required>
                                                <div class="invalid-feedback">
                                                    Please enter your shipping address.
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="my-4">
                                    </div>
                                </li>
                                <% } else {%>
                                <li class="list-group-item d-flex align-items-center justify-content-between py-4">
                                    <h5 class="my-0">Payment Method</h5>
                                    <div class="">
                                            <img class="payment-image-type mx-2 d-none" style="width:50px" src="#"/>
                                        <select onchange="handleChange()" class="custom-select text-uppercase p-1" id="inputGroupSelect01" name="typeId">
                                            <%
                                                for (PaymentType type : types) {
                                            %>
                                            <option value="<%=type.getTypeId()%>" <%if (type.getTypeId() == 1) {%>selected<%}%>><%=type.getTypeName()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <!--<span class="text-muted text-uppercase">Change</span>-->
                                    </div>
                                </li>
                                <% }%>
                                <li class="list-group-item d-flex justify-content-between align-items-center py-4">
                                    <span class="my-0">Total</span>
                                    <strong style="font-size: 1.5rem;"><%=total%></strong>
                                    <input type="hidden" value="<%=total%>" name="amount"/>
                                </li>
                                <button class="btn btn-black btn-lg mt-5" onclick="" type="submit">Continue to checkout</button>
                                <%
                                    }
                                %>
                            </ul>
                        </form>

                    </div>

                </div>
            </main>
        </div>

        <script>
            function handleChange() {
                if($('.custom-select').val()==="1"){
                    $('.payment-image-type').addClass('d-none')
                }
                if($('.custom-select').val()==="2"){
                    $('.payment-image-type').css('width','50px')
                    $('.payment-image-type').removeClass('d-none')
                    $('.payment-image-type').attr('src','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1bHjHnPSDXgBS2WSVOAm57BdPvoAmwBMcqXwjTGUiiJGYrkvUZuVgZHXeZJWWX7kLlCg&usqp=CAU')
                }
                if($('.custom-select').val()==="3"){
                    $('.payment-image-type').css('width','50px')
                    $('.payment-image-type').removeClass('d-none')
                    $('.payment-image-type').attr('src','https://monfin.vn/images/source/Congty/viettelpay.png')
                }
                if($('.custom-select').val()==="4"){
                    $('.payment-image-type').css('width','200px')
                    $('.payment-image-type').removeClass('d-none')
                    $('.payment-image-type').attr('src','http://hangkhong247.vn/image/thanhtoanvisa.png')
                }
                if($('.custom-select').val()==="5"){
                    $('.payment-image-type').css('width','50px')
                    $('.payment-image-type').removeClass('d-none')
                    $('.payment-image-type').attr('src','https://brademar.com/wp-content/uploads/2022/05/Visa-Logo-PNG-1976-%E2%80%93-1992.png')
                }
            }
            
        </script>
        <%@include file="../../components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/form-validation.js"></script>
    </body>

</html>