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
<br><br>
<%

	kopo.example.service.Service_insert si=new kopo.example.service.Service_insert();
	si.insert(id,name);

//객체 생성과 동시에 삽입

%>
<h2>후보 등록 결과 : <%=name%>후보가 추가 되었습니다.</h2>
<br>
<%
out.println("이름 : "+name+"<br>");
out.println("기호 : "+id);
%>

<%
out.println("<button onclick=\"goBack();\">뒤로가기</button>");
out.println("<script language=\"javascript\">");
out.println("function goBack(){window.location=\"./\";}");
out.println("</script>");
%>
</body>
</html>