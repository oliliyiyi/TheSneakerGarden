<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../components/head.jsp" %>
        <title>The Sneaker Garden</title>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="../../components/header.jsp" %>
        <!-- Open Banner -->
        <section class="py-5" style="background: #333; margin-top: 130px">
            <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-md-8 text-white">
                        <h1>About Us</h1>
                        <p>
                            The Sneaker Garden is the place for those of you who have an intense love and vitality for sneakers. The Sneaker Garden places a lot of emphasis on customer service and ease of shopping experience.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <img src="${pageContext.request.contextPath}/images/LogoTheSneakerGarden.png" alt="About Hero">
                    </div>
                </div>
            </div>
        </section>
        <!-- Close Banner -->
        <!-- Start Map -->
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6053346211684!2d106.80785771538852!3d10.84148459227743!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1646891708112!5m2!1sen!2s"
            width="2000" height="600" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        <!-- Ena Map -->
        <!-- Start Section -->
        <section class="container py-5">
            <div class="row text-center pt-5 pb-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Our Services</h1>
                    <p><ul style="list-style-type:disc">
                        <li> Receiving orders, selling available all lines of shoes, sandals, shoe accessories from Nike, Adidas, Jordan... </li>
                        <li> Commitment to only sell genuine products, say no to fake. </li>
                        <li> Goods are shipped directly from foreign stores with full invoices and documents. </li>
                        <li> Offers free shipping, free exchanges, and free returns within 3 days of shoe purchase. </li>
                    </ul></p>
                    
                    
                </div>
            </div>
            <div class="row">

                <div class="col-md-6 col-lg-3 pb-5">
                    <div class="h-100 py-5 services-icon-wap shadow">
                        <div class="h1 text-dark text-center"><i class="fa fa-truck fa-lg"></i></div>
                        <h2 class="h5 mt-4 text-center">Delivery Services</h2>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <div class="h-100 py-5 services-icon-wap shadow">
                        <div class="h1 text-dark text-center pb-5"><i class="fas fa-exchange-alt"></i></div>
                        <h2 class="h5 mt-4 text-center">Shipping &amp; Return</h2>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <div class="h-100 py-5 services-icon-wap shadow">
                        <div class="h1 text-dark text-center"><i class="fa fa-percent"></i></div>
                        <h2 class="h5 mt-4 text-center">Promotion</h2>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 pb-5">
                    <div class="h-100 py-5 services-icon-wap shadow">
                        <div class="h1 text-dark text-center"><i class="fa fa-user"></i></div>
                        <h2 class="h5 mt-4 text-center">24 Hours Service</h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Section -->



        <%@include file="../../components/footer.jsp" %>
        <!-- Start Script -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>

</html>