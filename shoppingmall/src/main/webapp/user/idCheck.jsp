<%@ page import="mvc.dao.UserDAO" %>
<%@ page import="mvc.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%// idcheck
String userId = request.getParameter("userId");
UserDTO dto = new UserDTO();
dto.setUserId(userId);
%>
<% // id db
UserDAO dao = new UserDAO();
/* dto = dao.getUser(dto); */
%>
<%
int rs = 0;
if(dto != null){
	rs = 1;	
}
%>
{"rs":"<%=rs %>"}

