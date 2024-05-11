<%-- 
    Document   : adminManagement
    Created on : Apr 20, 2024, 1:12:24 PM
    Author     : DMX THANH SON
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            h3 {
                color: #555;
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
        <h1>Admin Management</h1>
        <h3>List Users Of System </h3>
        <form action="search" >
            Search User:<input type="text" name="search">
            <input type="submit"  value="SEARCH">
        </form>
        <form action="admin" method="post">
            
<!--            Search User:<input type="text" name="search">
            <input type="submit" name="search" value="SEARCH">-->
            <table border = 1>
                <tr>
                    <td>ID</td>
                    <td>FULL NAME</td>
                    <td>USER NAME</td>
                    <td>PASSWORD</td>
                    <td>PHONE</td>
                    <td>Role</td>
                    <td>QUESTION</td>
                    <td>ANSWER</td>
                    <td>Delete</td>

                </tr>

                <c:forEach items = "${data}" var = "u">
                    <tr>
                        <td><a href="admin?mode=adminupdate&id=${u.getAid()}">${u.getAid()}</a></td>
                        <td>${u.getFullname()}</td>
                        <td>${u.getUsername()}</td>
                        <td>${u.getPassword()}</td>
                        <td>${u.getPhone()}</td>
                        <td>${u.getIsAdmin()}</td>
                        <td>${u.getId()}</td>
                        <td>${u.getAnswer()}</td>                       
                        <td><a href = "admin?mode=delete&id=${u.getAid()}">Delete</a></td>
                    </tr>
                </c:forEach>

            </table>
            <td><input type="submit" name="submit" value="BACK TO LOGIN"></td>
        </form>
    </body>
</html>
