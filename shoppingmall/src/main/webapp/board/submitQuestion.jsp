	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
	<%="aaaaaaaaaaaaaaaaaaaaaaaaaaaa" %>
	<%
	    // 요청 파라미터에서 제목과 내용을 가져옴
	    String id = request.getParameter("id");
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        String url = "jdbc:mysql://localhost:3306/kdigital?serverTimezone=UTC";
	        String user = "root";
	        String password = "rpass";
	        conn = DriverManager.getConnection(url, user, password);
	
	        String sql = "INSERT INTO board (board_id, board_title, comments_content, board_date) VALUES (?, ?, ?, NOW())";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, request.getParameter("id"));
	        pstmt.setString(2, request.getParameter("title"));
	        pstmt.setString(3, request.getParameter("content"));
	        //pstmt.executeUpdate();
	
	        //out.print("asdf");
	        response.sendRedirect("qna.jsp"); // 리뷰 작성 후 리뷰 목록 페이지로 리디렉션
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (pstmt != null) pstmt.close();
	        if (conn != null) conn.close();
	    }
	
	%>