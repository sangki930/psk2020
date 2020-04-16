<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*,java.io.*,java.util.*,java.text.*"%>
<%@ page import="org.jsoup.nodes.*"%>
<%@ page import="org.jsoup.*"%>
<%@ page import="org.jsoup.select.Elements"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String url = "http://localhost:8080/JoaResort2/d_01.jsp";//본인의 '조아리조트' 예약현황 주소

Document doc = null;
try {
	doc = Jsoup.connect(url).get();//Jsoup으로 해당 URL에 접속
} catch (Exception e) {
	out.println(e);
}

int cnt=0;
Elements e=doc.select("html");//html의 태그 안부분을 가져옴
Pattern p = Pattern.compile("예약가능");//'예약가능'과 일치하는 부분을 찾음
Matcher m = p.matcher(e.text());//html안의 태그 포함 모두 출력된다.
while(m.find()){
	cnt++;
}

%>
<h2> 조아리조트 예약가능 방수 : <%=cnt%> 개</h2>
</body>
</html>