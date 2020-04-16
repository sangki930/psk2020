<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adm.Repo.admRepo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 계정 생성 완료</h1>
<%
	admRepo.createDB();
	admRepo.insertDB("admin","1111");
%>
</body>
</html>