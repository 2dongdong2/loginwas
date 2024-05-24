<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Join</title>
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
        .join-container {
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
        input[type="text"], input[type="password"], input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
        }
        input[type="submit"]:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="join-container">
        <h1>Join</h1>
        <form method="post" action="joinAction.jsp">
            <label for="userID">ID:</label>
            <input type="text" id="userID" name="userID" required>
            <br>
            <label for="userPassword">Password:</label>
            <input type="password" id="userPassword" name="userPassword" required>
            <br>
            <label for="userName">Name:</label>
            <input type="text" id="userName" name="userName" required>
            <br>
            <label for="userEmail">Email:</label>
            <input type="email" id="userEmail" name="userEmail" required>
            <br>
            <input type="submit" value="Join">
        </form>
    </div>
</body>
</html>
