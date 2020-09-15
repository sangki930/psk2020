<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>gongji_list</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
.th_color{
	background-color: lightgray;
	font-family : 'Nanum Gothic';
	font-weight:bold;
	border-top : 2px solid blue;
	border-bottom : 1px solid blue;
	font-size:20px;
}
.font-style{
	font-family : 'Nanum Gothic';
	font-size : 30px;
	font-weight:bold;
	color : black;
}
.font-stylenormal{
	font-family : 'Nanum Gothic';
	font-size : 15px;
	color : black;
}
a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}

.a{
border-collapse : collapse;
border-left : none;
border-right : none;
}
.a2{
border-bottom : 0px solid black;
}
.a3{
border-top : none;
border-right : none;
border-bottom : none;
}
.a4{
	border-bottom:1px solid black;
	background-color : white;
}

</style>

</head>
<body bgcolor="lightgreen">
<br>
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속



String sql = "select id,title,date from gongji order by id desc";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);

%>
<table align=center cellspacing=1 width=800 border=0>
<tr>
		<td colspan=3 class="font-style"><p>게시판</p></td>
	</tr>
</table>
<table align=center cellspacing=1 width=800 border=0 class="a a2 font-stylenormal">
	
	<tr align=center class="th_color">
		<td width=75 height=30>번호</td>
		<td width=500 height=30><p align=center>제목</td>
		<td width=100 height=30><p align=center>등록일</td>
	</tr>
	<% 
while(rs.next()){
	out.println("<tr class=\"a4\">");
	out.println("<td width=75 height=30 align=center>"+rs.getInt(1)+"</td>");
	out.println("<td width=500 height=30><a href='gongji_view.jsp?key="+rs.getInt(1)+"'>"+rs.getString(2)+"</a></td>");
	out.println("<td width=100 height=30 align=center>"+rs.getDate(3)+"</td>");
	out.println("</tr>");
}
%>

	<tr>
	<td colspan="3" align=right class="a3"><input type=button value="신규" OnClick="window.location='gongji_insert.jsp'"></td>
	</tr>
</table>
<br>

</body>
</html>
