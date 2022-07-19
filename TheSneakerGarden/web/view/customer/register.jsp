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
                                        <input id="username" type="text" class="form-control" name="username" value="" required
                                               autofocus>
                                        <small id="username-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="fullname">FullName</label>
                                        <input id="fullname" type="text" class="form-control" name="fullname" value="" required
                                               autofocus>
                                        <small id="fullname-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                        <input id="email" type="email" class="form-control" name="email" value="" required>
                                        <small id="email-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="phone">Phone</label>
                                        <input id="phone" type="text" class="form-control" name="phone" value="" required
                                               autofocus>
                                        <small id="phone-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="address">Address</label>
                                        <input id="address" type="text" class="form-control" name="address" value="" required
                                               autofocus>
                                        <small id="address-err" class="invalid-message"></small>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="password">Password</label>
                                        <input id="password" type="password" class="form-control" name="password" required>
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
    </body>
    
</html>