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
<table border=1>
<thead>
	<th>날짜</th>
	<th>종가</th>
	<th>전일비</th>
	<th>시가</th>
	<th>고가</th>
	<th>저가</th>
	<th>거래량</th>
</thead>

<% 
int p=1;

for(p=1;p<=10;p++){
String url = "https://finance.naver.com/item/sise_day.nhn?code=035420&page="+p;

Document doc = null;
try {
	doc = Jsoup.connect(url).get();
} catch (Exception e) {
	out.println(e);
}

Elements elem = doc.select("table.type2").select("td");
//table만 선택하면 page nav까지 되어 있는 테이블까지 고르게 된다.
//out.println("td의 개수 :" + elem.size());

List<String> list = new ArrayList<>();

for(int i=0;i<elem.size();i++){//불필요한 내용 ""이 들어간 td를 거르기 위해서 이작업을 함
	if(elem.get(i).text().equals("")==false){
		list.add(elem.get(i).html());
	}
}
//불필요한 td를 걸러내면 70개가 된다.
%>
<tbody>
<%
for(int i=0;i<list.size();i=i+7){	
%>
	<tr>
	<td><%=list.get(i)%></td>
	<td><%=list.get(i+1)%></td>
	<td align="right"><%=list.get(i+2)%></td>
	<td><%=list.get(i+3)%></td>
	<td><%=list.get(i+4)%></td>
	<td><%=list.get(i+5)%></td>
	<td><%=list.get(i+6)%></td>
	</tr>
<%
	}

}
%>
</tbody>
</table>
</body>
</html>