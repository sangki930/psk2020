<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"
		 import="java.text.*"
		 import="java.sql.*"
		 import="java.net.*"
		 import="java.io.*" %>
<%@ page import="adm.Service.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
*{
	margin : 0;
	padding : 0;
}
body{
	background-image:url(bgimage.jpg);
	background-size : 2000px 1200px;
	/*background-position: center center;*/
	font-family : san-serif;
}
.form-box{
	width: 500px;
	background: rgba(0,0,0,0.8);
	margin : 12% auto;
	padding : 50px 0;
	color : #fff;
	box-shadow : 0 0 20px 2px rgba(0,0,0,0.5);
}
#logindiv{
	text-align: center;
	margin-bottom:40px;
}
.input-box{
	margin : 31px auto;
	width : 80%;
	boder-bottom : 1px solid #fff;
	padding-top : 10px;
	padding-bottom : 5px;
	
	}
.input-box input{
	width: 90%;
	border : none;
	outline : none;
	background : transparent;
	color : #fff;

}
::placeholder{
	color : #ccc;
}
.fa{
	margin-right: 10px;
}
#back{
	margin: 40px auto 20px;
	width :  80%;
	display : block;
	outline : none;
	padding : 10px 0;
	border : 1px solid #fff;
	cursor : pointer;
	background : transparent;
	color : #fff;
	font-size : 16px;
}
</style>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String jump=request.getParameter("jump");
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	//여기에서 엉뚱한 값을 체크해야 한다.
	
	System.out.println("id"+id);
	System.out.println("pass"+pass);
	
	admServ asv=new admServ();//서비스 활성화
	
	
	boolean bPassChk=asv.idcheck(id,pass);//일치한지 체크
	System.out.println("jump 값 확인 :"+jump);
	System.out.println(bPassChk);
	//패스워드 체크가 끝나면, 세션을 기록하고 점프한다.
	
		if(bPassChk){//1번 if
			session.setAttribute("login_ok","yes");//login_ok속성을 yes로 설정
			session.setAttribute("login_id",id);//login_id를 id로 설정
			if(jump.equals("jump가 넘어 오지 않았음")){
				jump="d_01.jsp";
			}
			response.sendRedirect(jump);//로그인 체크 이후 들어갈 곳
		}else{
			
	
%>
<form action='adm_loginck.jsp' method=post>
<input type=hidden name="jump" value='<%=jump%>'>
	<div class="form-box">
		<h1 id="logindiv">관리자 로그인</h1>
		<div class="input-box">
			
		</div>
		<div class="input-box">
			id 또는 비밀번호가 일치하지 않습니다.
		</div>
		<input type="button" id="back" value="뒤로가기" onClick="location.href='adm_login.jsp?jump=<%=jump%>';">
	</div>
</form>
<%

}//1번 if 종결

%>
</body>
</html>