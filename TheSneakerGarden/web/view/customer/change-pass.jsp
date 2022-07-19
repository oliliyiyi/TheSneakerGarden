<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="../../components/head.jsp" %>
        <title>Change password</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
        <link href="${pageContext.request.contextPath}/notification/notification.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="../../components/header.jsp" %>
        <section class="h-100" style="margin-top: 130px; margin-bottom: 200px">
            <div class="container h-100">
                <div class="row justify-content-sm-center h-100">
                    <% if (request.getAttribute("tokenerror") != null) {
                    %>
                    <h1>Token is invalid! Please try again!</h1>
                    <% } else { %>
                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-7 col-sm-9">
                        <div class="card shadow-lg">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4">Change password</h1>
                                <form method="POST" class="needs-validation" novalidate="" autocomplete="off" action="changePassword"
                                      id="LoginForm">
                                    <input type="hidden" name="token" id="token" value="${token}" />
                                    <div class="mb-3">
                                        <div class="mb-2 w-100">
                                            <label class="text-muted" for="password" >New password</label>

                                        </div>
                                        <input id="password" type="password" class="form-control" name="password" value=""
                                               required>
                                    </div>
                                    <div class="mb-3">
                                        <div class="mb-2 w-100">
                                            <label class="text-muted" for="re-password" >Confirm password</label>

                                        </div>
                                        <input id="re-password" type="password" class="form-control" name="re-password" value=""
                                               required>
                                    </div>

                                    <div class="d-flex align-items-center">
                                        <button type="submit" class="btn btn-primary ms-auto">
                                            Change password
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </section>

        <%@include file="../../components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/notification/notification.js" type="text/javascript"></script>
        <% if (request.getAttribute("msg") != null) {
        %>
        <script>
            alert("<%=(String) request.getAttribute("msg")%>")
        </script>
        <% }%>
    </body>

</html>