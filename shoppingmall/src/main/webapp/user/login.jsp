<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
	<center>
		<h2>회원로그인</h2>
		<form action="<%=request.getContextPath() %>/loginProc.do" method="post">
		<input type="text" name="userId">
		<input type="password" name="password">
		<input type="submit" value="로그인">
		</form>
		<a href="<%=request.getContextPath() %>/join.do">회원가입</a>
	</center>
</body>
</html>