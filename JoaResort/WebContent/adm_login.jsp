<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"
		 import="java.text.*"
		 import="java.sql.*"
		 import="java.net.*"
		 import="java.io.*" %>
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
h1{
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
.login-btn{
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
	String jump="jump가 넘어 오지 않았음";
	if(request.getParameter("jump")!=null){
		
		jump=request.getParameter("jump");
	}
	String attr="attr넘어오기 실패";
	
	String test=request.getParameter("test");
	
	System.out.println(jump);
	System.out.println("확인 :"+test);
%>
<form action='adm_loginck.jsp' method=post>
<input type=hidden name="jump" value='<%=jump%>'>
	<div class="form-box">
		<h1>관리자 로그인</h1>
		<div class="input-box">
			<i class="fa fa-envelope-o"></i>
			<input type="text" name="id" placeholder="ID" maxlength=20>
		</div>
		<div class="input-box">
			<i class="fa fa-key"></i>
			<input type="password" name="password" placeholder="Password" maxlength=20>
		</div>
		<input type="submit" class="login-btn" value="LOGIN">
	</div>
</form>
</body>
</html>