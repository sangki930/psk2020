<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ page import="kopo.example.dto.HuboSIO" %>
<%@ page import="kopo.example.service.*" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!-- 이미지를 불러 오기 위해, JSTL을 쓰기 위해 import한다. -->
<!DOCTYPE html>
<html>
<head>
<script>
function page_move(id,fname){
    var f=document.paging1; //폼 name
    f.id.value = id; //POST방식으로 넘기고 싶은 값
    f.action="./C_02";//이동할 페이지
    f.method="post";//POST방식
    f.submit();
}
</script>
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
<meta charset="UTF-8">
<title>C_01</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="vote_result" name="menu"/> 
</jsp:include>


 
 <div>
	<img src="controller/resources/bar.jpg" width="100px" height="20px">
 </div>

<p class="font-styletitle">후보별 득표율</p>

<!-- 

<img src='${pageContext.request.contextPath}/resources/bar.jpg' width=80 height=20>

-->
<%
//이미지를 불러올 때는 ${pageContext.request.contextPath}/resources/형태로 불러온다.

kopo.example.service.Service_allview sa = new kopo.example.service.Service_allview();
kopo.example.service.Service_Huboresult sar = null;

out.println("<table border=1 bgcolor=lightgray class=\"font-tdstyle\">");
int index=0;
int age=10;
int count=0;
String formname=null;


for(HuboSIO h:sa.getList()){//향상된 for문
	
	
	index++;
	formname="paging"+index;
	
	int id=h.getId();
	String name=h.getName();
	sar = new kopo.example.service.Service_Huboresult(h);
	count=sar.getCount();
	
	System.out.println("기호 "+id+"번의 득표수(화면) :" + count);
	%>
<form name="<%=formname%>">
<tr>

<td width=75><p align=center name="name">
<input type="hidden" name="id" value=<%=id%>>
<%
if(count==0){//득표수가 0일 때를 처리(링크를 없앰)
	
	%>
	<%=id%>. <%=name%></p>
	<%
}else{
%>
<a href="javascript:page_move('<%=id%>',<%=formname%>);"><%=id%>. <%=name%></a></p>
<%
}
%>
</td>
<td width=700><p align=left>
<%

if(sar.getRate()<1){//비율이 1보다 작을때
 %>
 <img src='${pageContext.request.contextPath}/resources/bar.jpg' width=<%=1%> height=20><%=count%> (<%=(sar.getRate())%>%)
 <% 
}
else{
%>
<img src='${pageContext.request.contextPath}/resources/bar.jpg' width=<%=(sar.getRate())*5%> height=20><%=count%> (<%=(sar.getRate())%>%)

</p></td>
</tr>
</form>
<%	
}
age+=10;

}//for문의 닫는 괄호
if(index==0){
	out.println("등록된 후보가 없습니다.");
}

%>
</table>
</body>
</html>