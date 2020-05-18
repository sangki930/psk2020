<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>head</title>
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');

.icono-plusCircle{
		/*color : red; */
		transform : scale(1);
}

.icono-barChart{
		transform : scale(1);
}
.icono-locationArrow{
		transform : scale(1);/*크기 지정*/
}

.font-style{
	font-family : 'Nanum Gothic';
	font-size : 20px;
	font-weight:bold;
	color : white;
}
.font-stylepurple{
	font-family : 'Nanum Gothic';
	font-size : 20px;
	font-weight:bold;
	color : purple;
}
.font-stylemain{
	font-family : 'Nanum Gothic';
	font-size : 50px;
	font-weight:bold;
	color : black;
}
.td-style{
	background-color: solid skyblue;
	
}

.colorred{color:red}

table{
border:0px solid skyblue;
border:none;
border-collapse:collapse;
}
.transparent8 { zoom: 1; /* ie 5,6,7 bug fix */ 
filter: alpha(opacity=80); 
opacity: 0.8; }/*투명도 조절, css3에서 기본제공한다.*/


body{
	background-color : LightCyan;/* body의 배경색 */
	
}
.button {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#ffe6f2;   /*--백그라운드 정의---*/
font:12px 굴림체;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:skyblue;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
.button2 {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#ffe6f2;   /*--백그라운드 정의---*/
font:12px 궁서체;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:blue;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
</style>
</head>
<body>
<!-- 
	onmouseover : 마우스 포인터가 요소 안으로 들어올 때 + 자식요소 출입시 발생하는 이벤트
					요소 영역을 벗어나지 않아도 자식 요소에 들어가거나 나올 때 발생함
	onmouseout : 마우스 포인터가 요소 밖으로 나갈 때 + 자식 요소 출입시 발생하는 이벤트
					요소 영역을 벗어나지 않아도 자식 요소에 들어가거나 나올 때 발생함

 -->
 <%
 request.setCharacterEncoding("UTF-8"); //인코딩 설정
 String menu = request.getParameter("menu"); //menu 파라미터
 String clickcolor="colorred";
 %>
 <br>
 <p align="center" class = "font-stylemain">간이 투표 관리 시스템</p>
 <br>
<table width=100% border=0 bordercolor="black"  class="transparent8" bgcolor=skyblue >
<%


switch(menu){
case "nominate": //'후보등록'탭을 고르면
	%>
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./' " onMouseOver = " window.status = './' " onMouseOut = " window.status = ''">
<p class="icono-plusCircle colorred"></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./' " onMouseOver = " window.status = './' " onMouseOut = " window.status = ''">
후보등록</td> <!-- 레코드 전체에 a href 잡기 -->
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./B_01' " onMouseOver = " window.status = './B_01' " onMouseOut = " window.status = ''">
<p class="icono-locationArrow "></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./B_01' " onMouseOver = " window.status = './B_01' " onMouseOut = " window.status = ''">
투표</td>
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./C_01' " onMouseOver = " window.status = './C_01' " onMouseOut = " window.status = ''">
<p class="icono-barChart "></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./C_01' " onMouseOver = " window.status = './C_01' " onMouseOut = " window.status = ''">
개표결과</td>
<td></td>
	<%break;
case "vote" : //'투표' 탭을 고르면
	%>
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./' " onMouseOver = " window.status = './" onMouseOut = " window.status = ''">
<p class="icono-plusCircle "></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./' " onMouseOver = " window.status = './" onMouseOut = " window.status = ''">
후보등록</td> <!-- 레코드 전체에 a href 잡기 -->
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./B_01' " onMouseOver = " window.status = './B_01' " onMouseOut = " window.status = ''">
<p class="icono-locationArrow colorred"></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./B_01' " onMouseOver = " window.status = './B_01" onMouseOut = " window.status = ''">
투표</td>
<td width=35  bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./C_01' " onMouseOver = " window.status = './C_01' " onMouseOut = " window.status = ''">
<p class="icono-barChart"></p></td>
<td width=90  bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./C_01' " onMouseOver = " window.status = './C_01' " onMouseOut = " window.status = ''">
개표결과</td>
<td></td>
	<% break;
case "vote_result" : //'투표결과' 탭을 고르면
	%>
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./' " onMouseOver = " window.status = './" onMouseOut = " window.status = ''">
<p class="icono-plusCircle "></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./' " onMouseOver = " window.status = './'" onMouseOut = " window.status = ''">
후보등록</td> <!-- 레코드 전체에 a href 잡기 -->
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./B_01' " onMouseOver = " window.status = './B_01" onMouseOut = " window.status = ''">
<p class="icono-locationArrow "></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./B_01' " onMouseOver = " window.status = './B_01' " onMouseOut = " window.status = ''">
투표</td>
<td width=35 bgcolor=skyblue style = "cursor:pointer;" onClick = " location.href='./C_01' " onMouseOver = " window.status = './C_01' " onMouseOut = " window.status = ''">
<p class="icono-barChart colorred"></p></td>
<td width=90 bgcolor=skyblue class="font-style" style = "cursor:pointer;" onClick = " location.href='./C_01' " onMouseOver = " window.status = './C_01' " onMouseOut = " window.status = ''">
개표결과</td>
<td></td>
<% 
break;
}

%>

</table>
<br><br>
</body>
</html>