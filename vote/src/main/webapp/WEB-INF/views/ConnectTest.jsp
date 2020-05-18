<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="javax.sql.*"%>
    <%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

try{
	
	out.println("클래스 확인");
	Class.forName("com.mysql.cj.jdbc.Driver");
	out.println("클래스 확인완료");
	/*
	String dbURL = "jdbc:mysql://192.168.56.1:3306/kopo09";
	String dbID="root";
	String dbPW="tkdrl123";
	Connection con=DriverManager.getConnection(dbURL,dbID,dbPW);
	*/
	Connection con = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
	//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
	
	out.println("연결정보 : " + con);
	out.println("연결정보(toString) : " + con.toString());
}catch(Exception e){
	out.println("오류는 "+e);
}
	
%>


</body>
</html>