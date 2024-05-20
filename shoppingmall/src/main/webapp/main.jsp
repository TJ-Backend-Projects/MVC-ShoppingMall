<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /* HttpSession session = request.getSession(false); // 기존 세션이 있으면 가져오고, 없으면 null */
    String userId = (session != null) ? (String) session.getAttribute("userId") : null;
    String userName = (session != null) ? (String) session.getAttribute("userName") : null;
    String userAddress = (session != null) ? (String) session.getAttribute("userAddress") : null;
    String email = (session != null) ? (String) session.getAttribute("email") : null;
    String tel = (session != null) ? (String) session.getAttribute("tel") : null;
    Integer age = (session != null) ? (Integer) session.getAttribute("age") : null;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session Check</title>
</head>
<body>
    <center>
        <h2>세션 정보 확인</h2>
        <%
            if (session == null || userId == null) {
                out.println("<p>로그인 정보가 없습니다. <a href='" + request.getContextPath() + "/user/login.jsp'>로그인</a></p>");
            } else {
                out.println("<p>아이디: " + userId + "</p>");
                out.println("<p>이름: " + userName + "</p>");
                out.println("<p>주소: " + userAddress + "</p>");
                out.println("<p>이메일: " + email + "</p>");
                out.println("<p>전화번호: " + tel + "</p>");
                out.println("<p>나이: " + (age != null ? age : "미입력") + "</p>");
                out.println("<a href='" + request.getContextPath() + "/logout.do'>로그아웃</a>");
            }
        %>
    </center>
</body>
</html>