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
<title>C_01</title>
</head>
<body>
<table border=1>
<td name="nominate" border=1>후보등록</td>
<td name="vote" border=1 align=center>투표</td>
<td name="vote_result" border=1 bgcolor="yellow">개표결과</td>
</table>
<br><br>
<h2>후보별 득표율</h2>
<table border=1>
<tr>
<td width=75><p align=center>10대</p></td>
<td width=500><p align=left><img src='bar.jpg' width=100 height=20>100(75%)</p></td>
</tr>
<tr>
<td width=75><p align=center>20대</p></td>
<td width=500><p align=left><img src='bar.jpg' width=120 height=20>120(75%)</p></td>
</tr>
<tr>
<td width=75><p align=center>30대</p></td>
<td width=500><p align=left><img src='bar.jpg' width=130 height=20>130(75%)</p></td>
</tr>
<tr>
<td width=75><p align=center>40대</p></td>
<td width=500><p align=left><img src='bar.jpg' width=140 height=20>140(75%)</p></td>
</tr>
<tr>
<td width=75><p align=center>50대</p></td>
<td width=500><p align=left><img src='bar.jpg' width=90 height=20>150(75%)</p></td>
</tr>

</table>
</body>
</html>