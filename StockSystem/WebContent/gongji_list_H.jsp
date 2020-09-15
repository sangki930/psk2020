<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gongji_list_H</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
/*'나눔고딕체'를 쓰기 위한 url을 import */
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
a:link { color: red; text-decoration: none;}
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


<table align=center cellspacing=1 width=800 border=0 class="a a2 font-stylenormal">
	<tr>
		<td colspan=3 class="font-style"><p>게시판</p></td>
	</tr>
	<tr align=center class="th_color">
		<td width=75 height=30>번호</td>
		<td width=500 height=30><p align=center>제목</td>
		<td width=100 height=30><p align=center>등록일</td>
	</tr>
	<tr class="a4">
		<td width=75 height=30 align=center>1</td>
		<td width=500 height=30><a href='gongji_view.jsp?key=1'> 공지사항1</a></td>
		<td width=100 height=30 align=center>2019-12-15</td>
	</tr>
	<tr class="a4">
		<td width=75 height=30 align=center>2</td>
		<td width=500 height=30><a href='gongji_view.jsp?key=1'> 공지사항2</a></td>
		<td width=100 height=30 align=center>2019-12-15</td>
	</tr>
	<tr>
	<td colspan="3" align=right class="a3"><input type=button value="신규" OnClick="window.location='gongji_insert.jsp'"></td>
	</tr>
</table>
<br>

</body>
</html>