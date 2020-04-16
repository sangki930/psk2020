<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"
		 import="java.text.*"
		 import="java.sql.*"
		 import="javax.sql.*"
		 import="java.net.*"
		 import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body BACKGROUND>
<%
	session.invalidate();
	//로그아웃 후 일반적으로는 홈으로 간다.(여기서는 login_test.jsp)
	response.sendRedirect("d_01.jsp");
%>
<h2>로그아웃 되었습니다.</h2>
<input type=button value='로그인' name='option' onClick="location.href='login_test.jsp';">
</body>
</html>