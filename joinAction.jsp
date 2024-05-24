<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
    // 데이터베이스 연결 변수
    Connection conn = null;
    PreparedStatement pstmt = null;

    // 사용자 입력 값 받기
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");
    String userName = request.getParameter("userName");
    String userEmail = request.getParameter("userEmail");

    try {
        // 데이터베이스 연결
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbUrl = "jdbc:mysql://database-1.crio22gqiskt.ap-northeast-2.rds.amazonaws.com:3306/WebTest";
        String dbUser = "admin"; // 데이터베이스 사용자 이름
        String dbPassword = "123wkdtndi!"; // 데이터베이스 비밀번호
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL 쿼리
        String sql = "INSERT INTO user (userID, userPassword, userName, userEmail) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userID);
        pstmt.setString(2, userPassword);
        pstmt.setString(3, userName);
        pstmt.setString(4, userEmail);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('회원가입 성공!'); location.href='login.jsp';</script>");
        } else {
            out.println("<script>alert('회원가입 실패! 다시 시도해주세요.'); history.back();</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('SQL 오류 발생: " + e.getMessage() + "'); history.back();</script>");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>alert('JDBC 드라이버 오류 발생: " + e.getMessage() + "'); history.back();</script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
    } finally {
        // 리소스 해제
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
