<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: white;
            padding: 2em;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }
        h1 {
            margin-bottom: 1em;
        }
        label {
            display: block;
            margin-bottom: 0.5em;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"], button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }
        button {
            background-color: #008CBA;
            color: white;
            margin-top: 10px;
        }
        button:hover, input[type="submit"]:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form method="post" action="loginAction.jsp">
            <label for="userID">Username:</label>
            <input type="text" id="userID" name="userID" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <input type="submit" value="Login">
            <button type="button" onclick="window.location.href='join.jsp'">Join</button>
        </form>
    </div>
</body>
</html>
