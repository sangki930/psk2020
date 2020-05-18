<%@page import="kopo.example.Repo.VoteRepo"%>
<%@page import="kopo.example.service.Service_Huboresult"%>
<%@page import="kopo.example.service.Service_AgeResult"%>
<%@page import="kopo.example.dto.HuboSIO"%>
<%@page import="kopo.example.domain.AgeCount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<style>
	.font-styletitle{
	font-family : 'Nanum Gothic';
	font-size : 30px;
	font-weight:bold;
	color : black;
}
.font-tdstyle{
font-family : 'Nanum Gothic';
	font-size : 15px;
	font-weight:bold;
	color : black;
}
</style>
<%
	request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
	int id=Integer.parseInt(request.getParameter("id"));//기호
	String name;//후보 이름
%>
<meta charset="UTF-8">
<title>C_02</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="vote_result" name="menu"/> 
</jsp:include>
<% 
HuboSIO h = new HuboSIO(id);
name = h.getName();

kopo.example.service.Service_AgeResult sa = new kopo.example.service.Service_AgeResult(id);

%>
<table border=1 bgcolor=lightgray>
<% 


List<AgeCount> l=new ArrayList<>();



l = sa.getList();


for(int i=0;i<9;i=i+1){
	
	 
	%>
	<tr>
<td width=75><p align=center><%=(i+1)*10%>대</p></td>
<td width=500><p align=left>
<% 
	
	if(l.get(i).getRate()<1){
		
		%>
		<img src='${pageContext.request.contextPath}/resources/bar.jpg' width=1 height=20><%=l.get(i).getCnt()%> (<%=l.get(i).getRate()%>%)
		<% 
		
	}
	else{
%>
<img src='${pageContext.request.contextPath}/resources/bar.jpg' width=<%=l.get(i).getRate()*5%> height=20><%=l.get(i).getCnt()%> (<%=l.get(i).getRate()%>%)

<%
	}
%>
</p></td>
</tr>
	<%
	
}	
	

%>
<h2 class="font-styletitle"><%=id%>.<%=name%>&nbsp후보 성향 분석</h2>
</table>
<br>
<table border=1 width=580>
<tr><td align=right>
<%
out.println("<button onclick=\"goBack();\">뒤로가기</button>");
out.println("<script language=\"javascript\">");
out.println("function goBack(){window.location=\"./C_01\";}");
out.println("</script>");
%>
</td></tr>
</table>
</body>
</html>