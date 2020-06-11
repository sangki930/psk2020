<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<table border=1>
<td name="nominate" border=1>후보등록</td>
<td name="vote" border=1 align=center bgcolor="yellow">투표</td>
<td name="vote_result" border=1>개표결과</td>
</table>
<br><br>
<table border =1>
<form method="post" action="B_02_H.jsp">
	<td width=200><p align=center>
	<select name=choice>
			<option value=1>1 김일돌</option>
			<option value=2>2 김이돌</option>
			<option value=3>3 김삼돌</option>
			<option value=4>4 김사돌</option>
			<option value=5>5 김오돌</option>
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
	</p>
	</td>	
<td>
<input type=submit value="투표하기" class="button">
</td>
</table>
</form>
</body>
</html>