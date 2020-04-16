<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.regex.*"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.util.*"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<thead>
<th>리조트명</th>
<th>빈방</th>
<th>조회시간</th>
</thead>
<tbody>
<%
String url = "http://localhost:8080/JoaResort2/d_01.jsp";//크롤링하고 싶은 url생성

String[] s= {url,"조아리조트"};
List<String[]> list = new ArrayList<>();

//String

list.add(s);

LocalDateTime first = LocalDateTime.now();

for(int i=0;i<list.size();i++){

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
<td>list.get(i)[1]</td>
<td><%=cnt%></td>
<td><%=LocalDateTime.now()%></td>
<%
}

LocalDateTime last = LocalDateTime.now();

Duration d  = Duration.between(first,last);

%>
</tbody>
</table>
크롤링하는 데 걸린 시간 <%=d.getSeconds()/60%>분 <%=d.getSeconds()%60%>초
</body>
</html>