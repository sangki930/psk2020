<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	import="com.oreilly.servlet.MultipartRequest"
	import="com.oreilly.servlet.multipart.*"
	import="lecture07.CFTB"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>imgview</title>
</head>
<body>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");

String sql = "select * from stock";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);

rs.next();

out.clear();
Blob image = rs.getBlob(7);
byte[] imgData =null;

imgData = image.getBytes(1,(int)image.length());
response.setContentType("image/jpg");
OutputStream o =response.getOutputStream();
o.write(imgData);

%>

</body>
</html>