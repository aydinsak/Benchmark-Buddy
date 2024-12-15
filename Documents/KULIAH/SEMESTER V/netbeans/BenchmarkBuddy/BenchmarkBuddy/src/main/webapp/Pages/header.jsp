<%-- 
    Document   : header
    Created on : 6 Dec 2024, 21.21.39
    Author     : Aydin Shidqi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        header {
            background-color: #ff6600;
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header h1 {
            margin: 0;
        }

        header input {
            padding: 5px;
            width: 50%;
        }

        header a {
            text-decoration: none;
            color: white;
            margin-left: 20px;
            font-weight: bold;
        }
    </style>
    <body>
        <header>
            <h1>Benchmark Buddy</h1>
            <input type="text" placeholder="Search...">
            <a href="#">HOME</a>
            <!--<a href="#"><img src="user-icon.png" alt="Profile" height="30"></a>-->
            <a href="#">👤 Profile</a>
        </header>    
    </body>

</html>
