<%-- 
    Document   : login
    Created on : 4 Dec 2024, 01.54.15
    Author     : Aydin Shidqi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="stylesheet" href="style.css" />
        <style>
            /* Import Google font - Poppins */
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }
            body {
                min-height: 100vh;
                width: 100%;
                background: #ff6a00;
            }
            .container {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                max-width: 430px;
                width: 100%;
                background: #fff;
                border-radius: 7px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
            }
            .container .registration {
                display: block; /* Set to block to ensure form is visible */
            }
            .container .form {
                padding: 2rem;
            }
            .form header {
                font-size: 2rem;
                font-weight: 500;
                text-align: center;
                margin-bottom: 1.5rem;
            }
            .form input {
                height: 60px;
                width: 100%;
                padding: 0 15px;
                font-size: 17px;
                margin-bottom: 1.3rem;
                border: 1px solid #ddd;
                border-radius: 6px;
                outline: none;
            }
            .form input:focus {
                box-shadow: 0 1px 0 rgba(0, 0, 0, 0.2);
            }
            .form a {
                font-size: 16px;
                color: #00bbf0;
                text-decoration: none;
            }
            .form a:hover {
                text-decoration: underline;
            }
            .form input.button {
                color: #fff;
                background: #00bbf0;
                font-size: 1.2rem;
                font-weight: 500;
                letter-spacing: 1px;
                margin-top: 1rem;
                cursor: pointer;
                transition: 0.4s;
            }
            .form input.button:hover {
                background: #009edc;
            }
            .signup {
                font-size: 17px;
                text-align: center;
            }
            .signup label {
                color: #00bbf0;
                cursor: pointer;
            }
            .signup label:hover {
                text-decoration: underline;
            }
            .error-msg {
                text-align: center;
                color: #d8000c;
                background-color: #ffbaba;
                border: 1px solid #d8000c;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 10px;
                font-size: 16px;
            }

            .reg-msg {
                text-align: center;
                color: #4f8a10;
                background-color: #dff2bf;
                border: 1px solid #4f8a10;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 10px;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login form">
                <header>Login</header>
                    <% if (request.getParameter("error") != null) {%>
                <div class="error-msg">
                    <%= request.getParameter("error")%>
                </div>
                <% } %>
                <% if (request.getParameter("regMsg") != null) {%>
                <div class="reg-msg">
                    <%= request.getParameter("regMsg")%>
                </div>
                <% }%>
                <form action="${pageContext.request.contextPath}/UserServlet" method="get">
                    <input type="hidden" name="action" value="login">
                    <input type="text" placeholder="Enter your email"   name="email"  required />
                    <input type="password" placeholder="Enter your password"  name="password" required />
                    <input type="submit" class="button" value="login">
                </form>

                <div class="signup">
                    <span class="signup">
                        Don't have an account?
                        <a href="registration.jsp">Signup</a>
                    </span>
                </div>

            </div>
        </div>
    </body>
</html>