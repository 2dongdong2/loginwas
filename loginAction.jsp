<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, redis.clients.jedis.Jedis"%>
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
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String dbuserId = null; // 변수 추가
            String dbuserPassword = null; // 변수 추가

            // RDS 연결 정보
            String dbURL = "jdbc:mysql://database-1.crio22gqiskt.ap-northeast-2.rds.amazonaws.com/WebTest";
            String dbUser = "admin";
            String dbPassword = "123wkdtndi!";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // DB 연결
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // 사용자 인증 쿼리 실행
                String sql = "SELECT * FROM user WHERE userID=? AND userPassword=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userID);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    dbuserId = rs.getString("userID");
                    dbuserPassword = rs.getString("userPassword");
    
                    // Redis에 세션 저장
                    try {
                        Jedis jedis = new Jedis("pj2.tcnvoh.ng.0001.apn2.cache.amazonaws.com", 6379);
                        String sessionId = session.getId();
                        jedis.set(userID, sessionId);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
    
                    response.sendRedirect("https://4tier.store/member/?userId=" + userID);
                } else {
                    out.println("<script>showPopup();</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('오류가 발생했습니다: " + e.getMessage() + "');</script>");
            } finally {
                // 리소스 해제
                if (rs != null) {
                    try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (pstmt != null) {
                    try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (conn != null) {
                    try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
            
        %>
    </div>
</body>
</html>
