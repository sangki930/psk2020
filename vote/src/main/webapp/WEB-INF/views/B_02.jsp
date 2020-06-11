<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
	int id=Integer.parseInt(request.getParameter("nominate"));
	int age=Integer.parseInt((request.getParameter("choice")).replace("대",""));
%>
<meta charset="UTF-8">
<title>B_02</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="vote" name="menu"/> 
</jsp:include>
<%
	
	kopo.example.service.Service_insert s = new kopo.example.service.Service_insert();
	s.insert(id, age);
	
%>
<h2>투표 결과 :  투표하였습니다.</h2>
<br>
<%
out.println("<button onclick=\"goBack();\">뒤로가기</button>");
out.println("<script language=\"javascript\">");
out.println("function goBack(){window.location=\"./B_01\";}");
out.println("</script>");
%>
</body>
</html>