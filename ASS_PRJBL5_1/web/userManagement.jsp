<%-- 
    Document   : userManagement
    Created on : Apr 20, 2024, 1:13:50 PM
    Author     : DMX THANH SON
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            a {
                text-decoration: none;
                color: #007bff;
            }

            a:hover {
                text-decoration: underline;
            }

            input[type="submit"] {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 20px;
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
            <table border = 1>
                <tr>
                    <td>ID</td>
                    <td>FULL NAME</td>
                    <td>USER NAME</td>
                    <td>PASSWORD</td>
                    <td>PHONE</td>

                </tr>

                <tr>
                    <td><a href="user?mode=updateUser&id=${u.getAid()}">${u.getAid()}</a></td>
                    <td>${u.getFullname()}</td>
                    <td>${u.getUsername()}</td>
                    <td>${u.getPassword()}</td>
                    <td>${u.getPhone()}</td>

                </tr>

            </table>
            <td><input type="submit" name="submit" value="BACK TO LOGIN"></td>
        </form>  
    </body>
</html>
