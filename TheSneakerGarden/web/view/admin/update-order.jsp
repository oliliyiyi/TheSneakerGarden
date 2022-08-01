<%-- 
    Document   : add
    Created on : Mar 19, 2022, 10:21:47 PM
    Author     : Admin
--%>

<%@page import="model.Order"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("./login");
    } else {
        User user = (User) session.getAttribute("user");
        if (user.getRoleID() != 1) {
            response.sendRedirect("./login");
        } else {
            Order order = (Order) request.getAttribute("order");
%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="../../components/head.jsp" %>--%>  
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Update order</title>
        <style type="text/css">
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .container form .user-input {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin: 20px 60px 12px 60px;
            }
            form .user-input .input-user {
                margin-bottom: 15px;
                width: calc(100% / 2 - 20px);
            }
            .user-input .input-user .details {
                display: block;
                font-weight: 500;
                margin-bottom: 5px;
            }
            .user-input .input-user input {
                height: 45px;
                width: 100%;
                outline: none;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding-left: 15px;
                font-size: 16px;
                border-bottom-width: 2px;
                transition: all 0.3s ease;
            }
            .user-input .input-user select {
                height: 45px;
                width: 100%;
                outline: none;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding-left: 15px;
                font-size: 16px;
                border-bottom-width: 2px;
                transition: all 0.3s ease;
            }
            .user-input .input-user input:focus,
            .user-input .input-user input:valid {
                border-color: #9b59b6;
            }
            .user-input .input-user select:valid {
                border-color: #9b59b6;
            }

            .buttonAdd {
                display: flex;
                justify-content: center;
            }
            .buttonAdd button{
                width: 200px;
                height: 60px;
                color: white;
                background: #00C897;
                border-radius: 10px
            }
            @media (max-width: 584px) {
                .container {
                    max-width: 100%;
                }
                form .user-input .input-user {
                    margin-bottom: 15px;
                    width: 100%;
                }

            }

        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    </head>
    <body>
        <%@include file="../../components/sidebar-dashboard.jsp" %>  
        <div class="main-content">
            <header>
                <div class="search-wrapper"><span class="las la-search"></span>
                    <input type="search" placeholder="Search..."/>
                </div> 
                <div class="user-wrapper">
                    <div>
                        <h4><%=user.getUserFullName()%></h4>   
                        <a  style="color: black; text-decoration: none" href="login">Logout</a>    
                    </div>
                </div>
            </header>

            <main>
                <h3 style="display: flex;
                    justify-content: center;
                    font-size: 40px; color:#00C897  ">Update order</h3>
                <div class="container" >
                    <form action="order-management?action=update" class="needs-validation" 
                          method="POST" 
                          onsubmit="return validateOrderForm();" 
                          id="someFormId"
                          autocomplete="off"
                          >
                        <div class="user-input">
                            <input type="hidden" name="id" value="<%=order.getOrderId()%>">
                            <input type="hidden" name="username" value="<%=order.getFullName()%>">
                            <input type="hidden" name="phone" value="<%=order.getPhone()%>">
                            <input type="hidden" name="shipaddress" value="<%=order.getShipAddress()%>">
                            <input type="hidden" name="email" value="<%=order.getEmail()%>">
                            <input type="hidden" name="orderdate" value="<%=order.getOrderDate()%>">
                            <div class="input-user">
                                <span class="details">Username</span>
                                <input type="text" name="usernamea" value="<%=order.getFullName()%>" required disabled="" >
                            </div>
                            <div class="input-user">
                                <span class="details">Phone</span>
                                <input type="number" name="phonea" value="<%=order.getPhone()%>" required disabled="" >
                            </div>
                            <div class="input-user">
                                <span class="details">Ship Address</span>
                                <input type="string" name="shipaddressa" value="<%=order.getShipAddress()%>" required disabled="" >
                            </div>
                            <div class="input-user">
                                <span class="details">Email</span>
                                <input type="email" name="emaila" value="<%=order.getEmail()%>" required disabled="" >
                            </div>
                            <div class="input-user">
                                <span class="details">Order Date</span>
                                <input type="date"
                                       id="orderdate"
                                       name="orderdatea" value="<%=order.getOrderDate()%>" required disabled="" >
                            </div>

                            <div class="input-user">
                                <span class="details">Ship Date</span>
                                <input
                                    id="shipdate"
                                    type="date"
                                    name="shipdate"
                                    value="<%=order.getShipDate()%>"
                                    required
                                    />
                                <small style="color: red" id="shipdate-err" class="invalid-message"></small>
                            </div>
                            <div class="input-user">
                                <span class="details">Status</span>
                                <select name="status"  value="<%=order.getStatus()%>">
                                    <option value="0">
                                        Pending
                                    </option>
                                    <option value="1">
                                        Done
                                    </option>
                                </select>

                            </div>
                        </div>
                        <div class="buttonAdd"> 
                            <Button type="submit">
                                Update order
                            </Button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
        <script src="${pageContext.request.contextPath}/notification/notification.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/highlight.min.js"></script>
        <script>
                              document.querySelectorAll('pre code').forEach((el) => {
                                  hljs.highlightElement(el);
                              });
        </script>
        <script><%@include file="../../js/order-validation.js" %></script>
    </body>
</html>
<%
        }
    }
%>