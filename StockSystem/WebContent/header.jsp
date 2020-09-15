<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
.font-style{
	font-family : 'Nanum Gothic';
	font-size : 30px;
	font-weight:bold;
	color : black;
}
.font-thstyle{
	font-family : 'Nanum Gothic';
	font-size : 15px;
	font-weight:bold;
	color : black;
}
.icono-comment{
	color : skyblue;
	transform : scale(1);
}
</style>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); //인코딩 설정
String menu = request.getParameter("menu"); //menu 파라미터
String hanmenu = null;


switch(menu){
case "list" : 
	hanmenu="전체 현황";
	break;
case "enrollitem" :
	hanmenu="상품 등록";
	break;
case "deleteitem" :
	hanmenu="상품 삭제";
	break;
case "updateitem" :
	hanmenu="재고 수정";
	break;
case "enrollcomplete" :
	hanmenu="상품 등록 결과";
	break;
case "itemdesc" :
	hanmenu="상품 상세";
	break;
case "itemdelete" :
	hanmenu="삭제 완료";
	break;
case "update" :
	hanmenu="상품 수정";
	break;
case "updatecomplete" :
	hanmenu="상품 수정 완료";
	break;
}

%>

<br>
<a href = 'stocklist.jsp?from=1'><img src='TWICE_LOGO.png'></a>
<h1 class="font-style">(주)트와이스 재고 현황 - <%=hanmenu%></h1><br>
<hr>
</body>
</html>