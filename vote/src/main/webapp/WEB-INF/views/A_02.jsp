<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
    pageEncoding="UTF-8"%>
<%@ page import="kopo.example.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
	int id=Integer.parseInt(request.getParameter("id"));
	String name=request.getParameter("name");
%>
<meta charset="UTF-8">
<title>A_02</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="nominate" name="menu"/> 
</jsp:include>
<%

kopo.example.service.Service_delete si=new kopo.example.service.Service_delete(id);
//객체 생겅과 동시에 삭제

%>
<h2>후보 삭제 결과 : <%=name%> 후보가 삭제 되었습니다.</h2>

<%
out.println("<button onclick=\"goBack();\">뒤로가기</button>");
out.println("<script language=\"javascript\">");
out.println("function goBack(){window.location=\"./\";}");
out.println("</script>");
%>
</body>
</html>