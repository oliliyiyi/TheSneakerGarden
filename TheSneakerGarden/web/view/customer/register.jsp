<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../components/head.jsp" %>
        <title>Register</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    </head>
    <body>
        <%@include file="../../components/header.jsp" %>
        <section class="h-100" style="margin-top: 130px; margin-bottom: 200px">
            <div class="container h-100">
                <div class="row justify-content-sm-center h-100">
                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-7 col-sm-9">
                        <div class="card shadow-lg">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4">Register</h1>
                                <form method="POST" action="./register" class="needs-validation" onsubmit="return validateForm();" autocomplete="off">
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="username">UserName</label>
                                        <input id="username" type="text" class="form-control" name="username" value="" 
                                               autofocus>
                                        <small id="username-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="fullname">FullName</label>
                                        <input id="fullname" type="text" class="form-control" name="fullname" value="" 
                                               autofocus>
                                        <small id="fullname-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                        <input id="email" type="email" class="form-control" name="email" value="" >
                                        <small id="email-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="phone">Phone</label>
                                        <input id="phone" type="text" class="form-control" name="phone" value="" 
                                               autofocus>
                                        <small id="phone-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="address">Address</label>
                                        <input id="address" type="text" class="form-control" name="address" value="" 
                                               autofocus>
                                        <small id="address-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="password">Password</label>
                                        <input id="password" type="password" class="form-control" name="password" >
                                        <small id="password-err" class="invalid-message"></small>
                                    </div>

                                    <p class="form-text text-muted mb-3">
                                        By registering you agree with our terms and condition.
                                    </p>

                                    <div class="align-items-center d-flex">
                                        <button type="submit" class="btn btn-primary ms-auto">
                                            Register
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer py-3 border-0">
                                <div class="text-center">
                                    Already have an account? <a href="login" class="lable-login">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="../../components/footer.jsp" %>
        <script><%@include file="../../js/form-validation.js" %></script>
        <!--<script src="${pageContext.request.contextPath}/js/form-validation.js"></script>-->
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