<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="test">
<%
	String test=request.getParameter("test");
%>

<input type="text" name="test">
<input type="submit" name = "submit">

</form>
<%

if(test!=null){
	
	out.println("<br><h1>"+test+"</h1>");
}

%>

</body>
</html>