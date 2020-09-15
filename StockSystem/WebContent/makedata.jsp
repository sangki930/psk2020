<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makedata</title>
</head>
<body>
<h1>Make table</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속

PreparedStatement pstmt =null;
%><%
try{
	//pstmt = conn.prepareStatement("drop table gongji");
	out.println("drop table gongji OK <br>");
	
}catch(Exception e){
	out.println("drop table gongji NOT OK<br>");
	out.println(e.toString());
}

%>
<%//pstmt.execute("create table gongji(id not null primary key auto_increment, title, varchar(70),date date, content text)DEFAULT CHARSET=utf8"); 
//테이블 생성 쿼리문%>
<%
String g= "공지사항";
String gcon = "공지사항내용";

for(int i=1;i<=5;i++){
String sql = "";
String insertsql = "insert into gongji (title,date,content) values"
+"('"+g+i+"',date(now()),'"+gcon+i+"');";
pstmt = conn.prepareStatement(insertsql);


	pstmt.execute(insertsql);
}
pstmt.close();
conn.close();
%>
</body>
</html>