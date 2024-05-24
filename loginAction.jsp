<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Action</title>
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
        .message-container {
            background-color: white;
            padding: 2em;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }
        h2 {
            color: #333;
        }
        a {
            display: inline-block;
            margin-top: 1em;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <%
            String userID = request.getParameter("userID"); // loginAction에서 가젼온 "userID" 를 입력받아와서 현제 loginAction.jsp에서 userID로 사용한다는 의미 
            String password = request.getParameter("password"); //// loginAction에서 가젼온 "userID" 를 입력받아와서 현제 loginAction.jsp에서 userID로 사용한다는 의미

            String dbURL = "jdbc:mysql://database-1.crio22gqiskt.ap-northeast-2.rds.amazonaws.com/WebTest"; // 내 RDS URL에서 정보를 읽어들어온다는 의미이다
            String dbUser = "admin"; // 데이터베이스 사용자명
            String dbPassword = "123wkdtndi!"; // 데이터베이스 비밀번호

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            String dbuserId = null;
            String dbuserPassword = null;

            try {
                Class.forName("com.mysql.jdbc.Driver"); // 다운받아놓은 mysql.jdbc.Driver을이용해서 RDS와 연동을 해준다. 
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword); // RDB에서 dbURL, dbUser, dbPassword

                String sql = "SELECT * FROM user WHERE userID=? AND userPassword=?"; // RDB에 user에있는 
                pstmt = conn.prepareStatement(sql); 
                pstmt.setString(1, userID);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    out.println("Login Successful");
                    dbuserId = rs.getString("userID");
                    dbuserPassword = rs.getString("userPassword");
                } else {
                    out.println("<script>showPopup();</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            if(userID.equals(dbuserId) && password.equals(dbuserPassword)){
                String RsessionId = request.getRequestedSessionId();
                String sessionId = session.getId();
                response.sendRedirect("/member?userId=" + userID + "&sessionId=" + sessionId);
            } else {
                out.println("Session Error");
            }
        %>
    </div>
</body>
</html>

