<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*,java.io.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
	URL url = new URL("");
	URLConnection urlConn  =url.openConnection();
	InputStreamReader is = new InputStreamReader(urlConn.getInputStream());
	BufferedReader br = new BufferedReader(is);
	String line;
	while((line = br.readLine())!=null){
		out.println(line+"<br>");
	}
	br.close();
	is.close();
}catch(Exception e){
	e.printStackTrace();
}
	
%>
</body>
</html>