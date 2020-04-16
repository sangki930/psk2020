<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조아리조트에 오신걸 환영합니다.</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
*{/*전체*/
	padding : 0; /* 패딩이 0 */
	margin : 0; /*여백이 0*/
	font-family : 'Nanum Gothic';/*폰트 설정*/
}
#wrap{
	width : 100%;
	height : 400px;
	background-color : #FAFAFA;
	position : relative;
	margin : 100px auto;
	overflow : hidden;
	display : flex;
	flex-direction : row;
	justify-content : center; 
	border : 1px solid black;
	
}
#div1{
	width : 45%;
	height : 300px;
	background-color : red;

}
#div2{
	width : 45%;
	height : 300px;
	background-color : lightblue;
	margin : 3%;
	overflow : hidden;
	word-wrap : break-word;
	border : 2px solid black;
	/* text-align : center; */
	/* vertical-align:middle; */
}
#img1{
	width : 45%;
	height : 300px;
	margin : 3%;
	border : 2px solid black;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* $( document ).ready(function() {
    console.log( "ready!" );
	var mq = window.matchMedia('screen and (max-width : 768px)');
 	console.log("media query : "+mq);
    if(mq.matches==true){
		$("div").remove("#btn-box");
		console.log('success');
        }
});
 */
/* 
 var mql = window.matchMedia("screen and (max-width: 768px)");

 if (mql.matches) {
     console.log("화면의 너비가 768px 보다 작습니다.");
 } else {
     console.log("화면의 너비가 768px 보다 큽니다.");
 } */

 function responsive(){
		var w = $(window).width();
		console.log(w);
		if(w<=768){
			console.log('반응했음');
		$("#wrap").css('flex-direction','column').css('height','800px').css('width','90%');
		$("#div2").css('overflow','hidden').css('word-wrap','break-word').css('width','90%');
		$("#img1").css('width','90%');
			}
		else{
			$("#wrap")
			.css('flex-direction','row')
			.css('height','400px');
			$("#div2").css('overflow','hidden').css('word-wrap','break-word').css('width','45%');
			$("#img1").css('width','45%');
			}
	 }
$(function(){

	responsive();
	$(window).resize(function(){
		responsive();
		});
	
});

</script>
</head>
<body>
<%
	String login_ok="no";
	String login_id="";
	
	if(session.getAttribute("login_ok")!=null){
		login_ok=(String)session.getAttribute("login_ok");
	}else{
		login_ok="no";
	}
	//System.out.println("로그인 확인 : "+(String)session.getAttribute("login_ok"));
	//System.out.println("로그인 확인 : "+login_ok);
	if(session.getAttribute("login_id")!=null){
		login_id=session.getAttribute("login_id").toString();
	}
	System.out.println("로그인 확인 : "+login_id);
	
%>
<jsp:include page="loginHeader.jsp" flush="false"> 
<jsp:param value="loginHeader" name="header"/>
<jsp:param value="<%=login_ok%>" name="login_ok"/>
</jsp:include>

<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>

<div id="wrap">

	<img src="carmap.PNG" id="img1"/>
	<div id=div2>
		
<span style="font-size : 30px; font-weight : bold;">자가용 이용시</span>
<br>
<br>	
분당수서로 이용시 : 
 <br> -  매송지하차도에서 광주방향으로 서현로 진입후 첫 번째 신호등에서 좌회전
 <br>
 성남대로 이용시 : 
 <br> - 서현로 -> 황새울로 -> LG전자 서비스센터에서 롯데마트 방향
 <br>
	</div>
</div>
<jsp:include page="footer.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>
</body>
</html>