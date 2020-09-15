<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
int itemnum=Integer.parseInt(request.getParameter("key"));
int from=Integer.parseInt(request.getParameter("from2"));
System.out.println(itemnum);
System.out.println("from값 : "+from);
%>
<style>
.att{
	background-color : skyblue;
	border-right:1px solid skyblue;
}
.green{
		color : lightgreen;
	}
.blue{
color : lightblue;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta charset="UTF-8">
<title>stockview</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="itemdelete" name="menu"/>
</jsp:include>
<br>
<%

	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
	//DB에 접속
	
	String sql="delete from stock where itemid="+itemnum;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
	//String today = sdf.format(now);
	
	pstmt.executeUpdate(sql);
	%>

<table width=700 cellspacing=10>
	<tr>
		<td width=400></td>
		<td width=50><i></i></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=<%=from%>'">
		
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=35 height=50 style = "cursor:pointer;" onClick = "window.location='stock_insert.jsp' " onMouseOver = "window.location='stock_insert.jsp'" onMouseOut = " window.status = ''">
	<p><br></p>
	</td>
		
	</tr>
</table>


</body>
</html>