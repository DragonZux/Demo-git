<%-- 
    Document   : Fogetpass
    Created on : Apr 23, 2024, 10:30:17 AM
    Author     : DMX THANH SON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset</title>
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

            h1 {
                text-align: center;
                color: #333;
            }

            input[type="text"],
            input[type="password"],
            select {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            select {
                cursor: pointer;
            }

            button {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 3px;
                color: #fff;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            a {
                display: block;
                text-align: center;
                margin-top: 10px;
                color: #007bff;
                text-decoration: none;
            }

            p {
                color: red;
            }
        </style>
    </head>
    <body>
        <form action="fogot" method="post">
            <h1>Password Reset</h1>
            <p>${mess}</p>
            <input name="username" type="text" placeholder="Username" required="" autofocus="">
            <div class="form-group">
                <select name="question" required>
                    <option value="" disabled selected>Select Security Question</option>
                    <option value="Noi Song">Noi Song</option>
                    <option value="Ten cua ban">Ten cua ban</option>
                </select>
            </div>
            <input name="answer" type="text" placeholder="Security Answer" required=""><br>
            <input name="resetpass" type="password" placeholder="New Password" required=""><br>
            <button type="submit">Reset Password</button><br>
            <a href="Login.jsp">Back to Login</a>
            ${error}
        </form>

    </body>
</html>
