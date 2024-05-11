<%-- 
    Document   : UpdateUser
    Created on : Apr 22, 2024, 12:59:18 AM
    Author     : DMX THANH SON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
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

            input[type="text"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 3px;
                color: #fff;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <form action="user" method="post">
            AccountID : <input type="text" name="id"  value="${u.getAid()}"><br>
            Full Name: <input type="text" name="name"  value="${u.getFullname()}"><br>
            Username: <input type="text" name="username"  value="${u.getUsername()}"><br>
            Password: <input type="text" name="password"  value="${u.getPassword()}"><br>
            Phone: <input type="text" name="phone"  value="${u.getPhone()}"><br>
            <input type="submit" name="submit" value="Update">
        </form>
    </body>
</html>
