<%-- 
    Document   : add
    Created on : Mar 19, 2022, 10:21:47 PM
    Author     : Admin
--%>

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
            User user1 = (User) request.getAttribute("user1");
%>
<!DOCTYPE html>
<html>
    <head>
        <%--<%@include file="../../components/head.jsp" %>--%>  
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/LogoTheSneakerGarden.png" type="image/x-icon">
        <title>Update user</title>
        <link href="${pageContext.request.contextPath}/notification/notification.css" rel="stylesheet" type="text/css">
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
                margin: 20px 0 12px 0;
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
            .user-input .input-user textarea {
                height: 80px;
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
                    font-size: 40px; color:#00C897  ">Update user</h3>
                <div class="container">
                    <form action="user-management?action=update" method="POST" id="someFormId">

                        <div class="user-input">
                            <input type="hidden" name="id" value="<%=user1.getUserId()%>">
                            <input type="hidden" name="account" value="<%=user1.getUserAccount()%>">

                            <div class="input-user">
                                <span class="details">Account</span>
                                <input type="text" name="accounta" value="<%=user1.getUserAccount()%>" required disabled="" >
                            </div>

                            <div class="input-user">
                                <span class="details">Name</span>
                                <input
                                    name="name"
                                    value="<%=user1.getUserFullName()%>"
                                    required
                                    />
                            </div>
                            <div class="input-user">
                                <span class="details">Email</span>
                                <input type="email"
                                       name="email"
                                       value="<%=user1.getUserEmail()%>"

                                       required
                                       />
                            </div>
                            <div class="input-user">
                                <span class="details">Phone</span>
                                <input type="text"  
                                       name="phone"
                                       value="<%=user1.getUserPhone()%>"

                                       required
                                       />
                            </div>
                            <div class="input-user">
                                <span class="details">Address</span>
                                <input type="text"      
                                       name="address" 
                                       value="<%=user1.getUserAddress()%>"

                                       required
                                       >
                            </div>
                            <div class="input-user">
                                <span class="details">Role</span>
                                <input type="text"      
                                       name="role" 
                                       value="<%=user1.getRoleID()%>"

                                       required
                                       >
                            </div>
                        </div>
                        <div class="buttonAdd">
                            <Button type="submit">
                                Update user
                            </Button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
        <script src="${pageContext.request.contextPath}/notification/notification.js" type="text/javascript"></script>
        <script>
            window.addEventListener('DOMContentLoaded', function () {

                const form = document.querySelector('form');


                form.addEventListener('submit', function (e) {
                    e.preventDefault();

                    // Form elements
                    const title = "Success";
                    const message = "Update user successful";
                    const position = "bottom-right";
                    const duration = 3000;
                    /*
                     Available methods:
                     error
                     warning
                     success
                     info
                     dialog 
                     
                     If you use dialog - 
                     the third parameter is the callback function
                     */
                    const type = "success";
                    let callback = null;
                    const popup = Notification({
                        position: position,
                        duration: duration
                    });

                    if (!popup[type]) {
                        popup.error({
                            title: 'Error',
                            message: `Notification has no such method "${type}"`
                        });
                        return;
                    }

                    popup[type]({
                        title: title,
                        message: message,
                        callback: callback
                    });
                    sleep(3500).then(() => {
                        document.getElementById('someFormId').submit();
                    });
                });


            });
            function sleep(ms) {
                return new Promise(resolve => setTimeout(resolve, ms));
            }

        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/highlight.min.js"></script>
        <script>
            document.querySelectorAll('pre code').forEach((el) => {
                hljs.highlightElement(el);
            });
        </script>
    </body>
</html>
<%
        }
    }
%>