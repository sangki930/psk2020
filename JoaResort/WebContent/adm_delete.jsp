<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	import="java.net.*"
    pageEncoding="UTF-8"%>
<%@ page import="joa.DTO.*"%>
<%@ page import="joa.Domain.*"%>
<%@ page import="joa.Repo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="joa.Resv_service.*" %>
<%@ page import="joa.Resv_Repo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String act="";
	String date="";
	String room="";
	
	if(request.getParameter("date")!=null){
		date=request.getParameter("date");
	}
	if(request.getParameter("room")!=null){
		date=request.getParameter("room");
	}
	if(request.getParameter("act")!=null){
		date=request.getParameter("act");
	}


	ResvService r = new ResvService();
	
	if(act.equals("delete")){
	if(r.cancel(date,room)==1){
	
	response.sendRedirect("d_01.jsp");
	}
	else{
%>
	<h3> 예약 취소</h3>
	<hr>
	<a href="d_01.jsp">돌아가기</a>
	
<%
	}
	}else if(act.equals("delete")){
		
		response.sendRedirect("d_01.jsp");
		
	}
%>
</body>
</html>