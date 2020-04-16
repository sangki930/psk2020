<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.form-box{
	width: 100%;
	height : 50px;
	background: rgba(0,0,0,0.8);
	margin : 1px auto;
	padding : 1px 1px;
	color : #fff;
	box-shadow : 0 0 20px 2px rgba(0,0,0,0.5);
	text-align : right;
}

#login-btn{
	margin-top:5px;
	margin-right:10px;
	width :  80px;
	display : block;
	outline : none;
	padding : 10px 0;
	border : 1px solid #fff;
	cursor : pointer;
	background : transparent;
	color : #fff;
	font-size : 16px;
}
#buttondiv{
	display : inline-block;
	align : right;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function submitForm1(mode){
	console.log('함수 접근');
	
	var tmp = document.getElementsByName('title')[0].value;//name인 title의 value값 가져오기
	
	for(var i=0;i<100;i++){//공백만 있는지 검사
		tmp=tmp.replace(" ","");//공백을 아무것도 없는 걸로 바꾼다.
	}//i<100은 입력한 길이 만큼 설정
	
	if(mode=="login"){
		
		if(tmp==""){
			alert('제목을 입력해야 합니다.');
			
		}else{
			console.log('else에 접근');	
	fm.action = "adm_login.jsp";
	console.log('액션성공');	
	fm.submit();
		}
	}
}
</script>
</head>
<body>
<%
// 세션을 체크해서 없으면 로그인창으로 보낸다. 그리고, 로그인이 되면 자기자신에게 와야 한다.
// 자기자신의 url을 써줘야 한다 login_test.jsp
String loginOK=null;//로그인이 안된 상태
String loginID=null;
String jumpURL="adm_login.jsp?jump=login_test.jsp";

System.out.println(session.getAttribute("login_ok"));

if(session.getAttribute("login_ok")==null){
	loginOK="no";
}else{
	loginOK="yes";
}

loginID=(String)request.getParameter("login_id");
System.out.println("loginOK값 : "+loginOK);
System.out.println("loginID값 : "+loginID);
/*
if(loginOK==null){
	//response.sendRedirect(jumpURL);
	return;
	
}
*/
/*
if(!loginOK.equals("yes")){//로그인이 성공하지 않으면
	response.sendRedirect(jumpURL);//해당 URL로 Redirect
	return;
}
*/
if(loginOK.equals("yes")){
%>
<header>
	<div class="form-box">
		<div id="buttondiv">
			<input type="button" id="login-btn" value="LOGOUT" onClick="location.href='adm_logout.jsp';">
		</div>
	</div>
	<%
}else if(loginOK.equals("no")){
	%>
	<div class="form-box">
		<div id="buttondiv">
			<input type="button" id="login-btn" value="LOGIN" onClick="location.href='adm_login.jsp';">
		</div>
	</div>
	<% 
}

		String header=request.getParameter("header");
		System.out.println(header);
	%>
</header>
</body>
</html>