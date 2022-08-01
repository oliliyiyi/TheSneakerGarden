<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="../../components/head.jsp" %>
        <title>Forgot Password</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgot.css">
    </head>

    <body>
        <%@include file="../../components/header.jsp" %>
        <section class="h-100" style="margin-top: 130px; margin-bottom: 200px">
            <div class="container h-100">
                <div class="row justify-content-sm-center h-100">
                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-7 col-sm-9">
                        <div class="card shadow-lg">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4">Forgot Password</h1>
                                <form method="POST" class="needs-validation" novalidate="" autocomplete="off">
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                        <input id="email" type="email" class="form-control" name="email" value="" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            Email is invalid
                                        </div>
                                    </div>

                                    <div class="d-flex align-items-center">
                                        <button type="submit" class="btn btn-primary ms-auto">
                                            Send Link
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer py-3 border-0">
                                <div class="text-center">
                                    Remember your password? <a href="login" class="label-login">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../../components/footer.jsp" %>
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