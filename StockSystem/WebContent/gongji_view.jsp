<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language = "JavaScript">
function submitForm(mode){
	if(mode=="update"){
		fm.action = "gongji_update.jsp";
	}else if(mode == "delete"){
		fm.action ="gongji_delete.jsp";
	}
	fm.submit();
}

</script>
<style>
	.skycolor{
		background-color : lightblue; 
	}
	
.font-style{
	font-family : 'Nanum Gothic';
	font-size : 30px;
	font-weight:bold;
	color : black;
}
.table-style{
	border-top:0px;
	border-bottom:none;
	border-right:none;
	border-left:none;
}
.bl{
	border-bottom:1px solid black;
}
.bl2{
	border-right:1px solid black;
}
</style>
<meta charset="UTF-8">
<title>gongji_view</title>
</head>
<body bgcolor="lightgreen">
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
int id=Integer.parseInt(request.getParameter("key"));
//String name=request.getParameter("name");
%>

<form method = post name='fm'>
<br>
<table align=center cellspacing=1 width=800 border=0>
<tr>
		<td colspan=3 class="font-style"><p>글 조회</p></td>
	</tr>
</table>
<table width=650 border=0 cellspacing=0 cellpadding=5 align=center class="table-style">
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속
String sql = "select * from gongji where id="+id;
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);
rs.next();

%>

<tr>
	<td width=75 class="skycolor bl bl2"><b>번호</b></td>
	<td class="bl" bgcolor="white"><input type=hidden name=id value='<%=id%>'><%=id%></td>
</tr>
<tr>
	<td width=75 class="skycolor bl bl2"><b>제목</b></td>
	<td class="bl"  bgcolor="white"><%=rs.getString(2)%></td>
</tr>
<tr>
	<td width=75 class="skycolor bl bl2"><b>일자</b></td>
	<td class="bl"  bgcolor="white"><%=rs.getDate(3)%></td>
</tr>
<tr>
	<td colspan="2" class="skycolor bl"><b>내용</b></td>
</tr>
<tr>	
	<td colspan="2" class="bl"  bgcolor="white"><%=rs.getString(4)%></td>
</tr>
</table>
<table align=center width=650>
<tr>
	<td width=600></td>
	<td><input type=button value="취소" OnClick="location.href='gongji_list.jsp'"></td>
	<td><input type=button value="수정" OnClick="submitForm('update')"></td>
	<td><input type=button value="삭제" OnClick="submitForm('delete')"></td>
</tr>
</table>
</form>
</body>
</html>
