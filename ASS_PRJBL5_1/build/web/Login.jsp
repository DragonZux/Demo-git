<%-- 
    Document   : Login
    Created on : Apr 20, 2024, 11:13:39 AM
    Author     : DMX THANH SON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            form {
                background-color: #fff;
                width: 300px;
                margin: 50px auto;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
            }

            td {
                padding: 10px;
                text-align: left;
            }

            input[type="text"],
            input[type="password"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            input[type="submit"],
            a {
                display: inline-block;
                padding: 10px 20px;
                margin: 5px;
                background-color: #007bff;
                border: none;
                border-radius: 3px;
                color: #fff;
                text-decoration: none;
                cursor: pointer;
            }

            input[type="submit"]:hover,
            a:hover {
                background-color: #0056b3;
            }

            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <form action="login" method="post">
            <table>
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="acc" value="${acc}"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="pass" value="${pass}"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="login" value="LOGIN"></td>
                    <td><a href="register">REGISTER</a></td>
                </tr>
                <td><a href="Fogetpass.jsp">Fogot Password</a></td>
            </table>
            ${error}
        </form>
    </body>
</html>
