<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateDB</title>
</head>
<body>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속

String sql1 ="create table hubo_table("
		+"id int not null primary key, name varchar(20))"
		+"DEFAULT CHARSET=utf8;";//후보 테이블
String sql2 ="create table tupyo_table("
				+"id int, age int, FOREIGN KEY (id) REFERENCES hubo_table(id) ON DELETE CASCADE)"
				+"DEFAULT CHARSET=utf8;";//투표용지 테이블
PreparedStatement pstmt = conn.prepareStatement(sql1);
//ResultSet rset = stmt.executeQuery("show databases;");


			//studentid 컬럼 값 자동증가 설정

			//studentid값 209901부터 시작

pstmt.execute(sql1);
pstmt.clearParameters();
pstmt.execute("alter table hubo_table modify id int not null auto_increment");
pstmt.clearParameters();
pstmt.execute("alter table hubo_table auto_increment=1");
pstmt.clearParameters();
pstmt.execute(sql2);


System.out.println("테이블 생성 성공");
out.println("<h1>테이블만들기 OK</h1>");
pstmt.close();
conn.close();
}catch(SQLException se){
	out.println("테이블이 이미 존재합니다.");
	out.println("오류 이름 : " + se);
	out.println("<button onclick=\"goBack();\">뒤로가기</button>");
	out.println("<script language=\"javascript\">");
	out.println("function goBack(){window.history.back(-1);}");
	out.println("</script>");
}

%>
</body>
</html>