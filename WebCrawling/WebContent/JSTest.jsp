<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String test="test";

%>
<script>

console.log('<%=test%>');

var tmp = '<%=test%>';

console.log(tmp);
document.write(tmp);
</script>
</body>
</html>