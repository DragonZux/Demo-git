<%-- 
    Document   : RegisterAccount
    Created on : Apr 20, 2024, 1:15:15 PM
    Author     : DMX THANH SON
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Account</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            form {
                background-color: #fff;
                width: 400px;
                margin: 50px auto;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            td {
                padding: 10px;
                text-align: left;
            }

            input[type="text"],
            input[type="password"],
            input[type="submit"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .question-table {
                border-collapse: collapse;
                width: 100%;
            }

            .question-table td, .question-table th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            .question-table th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #007bff;
                color: white;
            }

            .answer-input {
                margin-top: 10px;
            }

            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <form action="register" method="post">
            <table>
                <tr>
                    <td>Full Name</td>
                    <td><input type="text" name="fullname"></td>
                </tr>
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="acc"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="pass"></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type="text" name="phone"></td>
                </tr>
            </table>



            List question(you must choose one question):<br><br>

            <table border = 1>
                <tr>
                    <td>Question Number</td>
                    <td>Question</td>                    
                </tr>
                <c:forEach items = "${content}" var = "q">
                    <tr> 
                        <td>${q.getId()}</td>
                        <td>${q.getContent()}</td> 

                    </tr>
                    <input type="radio" name="id" value="${q.getId()}" checked>${q.getContent()}
                </c:forEach>
            </table>


            Your Answer:<input type="text" name="answer"><br><br>
            <input type="submit" name="submit" value="BACK TO LOGIN">
            <input type="submit" name="submit" value="REGISTER"><br><br> 
        ${error}
        </form>
        
    </body>
</html>
