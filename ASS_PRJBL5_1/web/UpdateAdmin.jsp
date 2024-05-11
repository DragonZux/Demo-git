<%-- 
    Document   : UpdateAdmin
    Created on : Apr 21, 2024, 11:07:35 PM
    Author     : DMX THANH SON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Admin</title>
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
            margin: 5px;
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
        <form action="admin" method="post">
            AccountID : <input type="text" name="id" readonly value="${u.getAid()}"><br>
            Full Name: <input type="text" name="name" readonly value="${u.getFullname()}"><br>
            Username: <input type="text" name="username" readonly value="${u.getUsername()}"><br>
            Password: <input type="text" name="pass" readonly value="${u.getPassword()}"><br>
            Phone: <input type="text" name="phone" readonly value="${u.getPhone()}"><br>
            Role: <input type="text" name="role"  value="${u.getIsAdmin()}"><br>
            Question:<input type="text" name="question" readonly value="${u.getId()}"><br>
            Answer:<input type="text" name="answer" readonly value="${u.getAnswer()}"><br>
            <input type="submit" name="submit" value="Update">
            <input type="submit" name="submit" value="BACK TO ADMIN MANAGEMENT">
        </form>
    </body>
</html>
