<%@page import="kopo.example.dto.HuboSIO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.button {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#ffe6f2;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:skyblue;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
</style>
<meta charset="UTF-8">
<title>B_01</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="vote" name="menu"/> 
</jsp:include>
<br><br>

	<% 
	/*
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
	//DB에 접속
	String sql = "select * from hubo_table;";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	ResultSet rs= pstmt.executeQuery(sql);
	int index=1;
	boolean isExisthubo=true;
	
	if(rs.next()==false){
		out.println("<h1>후보를 등록해주세요</h1>");
		isExisthubo=false;
	}
	else{
		
		rs.previous();
		*/
		
		kopo.example.service.Service_allview sa = new kopo.example.service.Service_allview();
		
		if(sa.getList().size()==0){
			out.println("<h1>후보를 등록해주세요</h1>");
		}
		else{
		
	%>
	<table border =1 bgcolor=lightgray>
<form method="post" action="./B_02">
	<td width=200><p align=center>
	<select name=nominate>
	<%
	
	for(HuboSIO h:sa.getList()){
		out.println("<option value="+h.getId()+">"+h.getId()+" "+h.getName()+"</option>");
	}
	%>
	</select>
	<select name=choice>
			<option value=1>10대</option>
			<option value=2>20대</option>
			<option value=3>30대</option>
			<option value=4>40대</option>
			<option value=5>50대</option>
			<option value=6>60대</option>
			<option value=7>70대</option>
			<option value=8>80대</option>
			<option value=9>90대</option>
	</select>
	<%
	
	}
	
	%>
	</p>
	</td>	
<td>
<%
if(sa.getList().size()>0){
%>
<input type=submit value="투표하기" class="button">
<%
}
%>
</td>
</table>
</form>
</body>
</html>