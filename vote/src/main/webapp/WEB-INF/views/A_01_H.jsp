<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.button {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#ffe6f2;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:skyblue;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
.button2 {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#ffe6f2;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:blue;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
</style>
<meta charset="UTF-8">
<title>A_01</title>
</head>
<body>
<table border=1>
<td name="nominate" border=1 bgcolor="yellow" width=>후보등록</td>
<td name="vote" border=1 align=center>투표</td>
<td name="vote_result" border=1>개표결과</td>
</table>
<br><br>
<table border=1>
<tr><td><form method="post" action="A_02_H.jsp">
	기호:<input type="text" name="id" value="1" readonly>이름 :
	<input type="text" name="name" value="김일돌" readonly>
	<input type="submit" value="삭제" class="button">
	</form>
</td></tr><tr><td><form method="post" action="A_02_H.jsp">
	기호:<input type="text" name="id" value="2" readonly>이름 :
	<input type="text" name="name" value="김이돌" readonly>
	<input type="submit" value="삭제" class="button">
	</form>
</td></tr><tr><td><form method="post" action="A_02_H.jsp">
	기호:<input type="text" name="id" value="3" readonly>이름 :
	<input type="text" name="name" value="김삼돌" readonly>
	<input type="submit" value="삭제" class="button">
	</form>
</td></tr>
<tr><td><form method="post" action="A_02_H.jsp">
	기호:<input type="text" name="id" value="4" readonly>이름 :
	<input type="text" name="name" value="김사돌" readonly>
	<input type="submit" value="삭제" class="button">
	</form>
</td></tr>
<tr><td><form method="post" action="A_03_H.jsp">
	기호:<input type="text" name="id" value="5" readonly>이름 :
	<input type="text" name="name" value="김오돌" readonly>
	<input type="submit" value="추가" class="button2">
	</form>
</td></tr>


</table>

</body>
</html>