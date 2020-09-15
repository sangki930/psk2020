<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
int id=Integer.parseInt(request.getParameter("id"));
String content=request.getParameter("content");
%>
<meta charset="UTF-8">
<title>gongji_write</title>
</head>
<body bgcolor="lightgreen">
<h1><%="글 번호 : "%><%=id%><%=" 번 "%>게시글 삭제 완료</h1>
<br><br>
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속
String sql = "delete from gongji where id="+id;
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();

	//out.println("글 번호 :"+id);
	//out.println("내용은 "+content);

%>
<table><tr>
<td><input type=button value="목록" OnClick="location.href='gongji_list.jsp'"></td></tr>
</table>
</body>
</html>