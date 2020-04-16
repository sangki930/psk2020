<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
	import="com.oreilly.servlet.MultipartRequest"
	import="org.apache.commons.fileupload.FileUpload" 
	import="org.apache.commons.fileupload.DiskFileUpload"
	import="org.apache.commons.fileupload.FileItem"
    pageEncoding="UTF-8"%>
<%@ page import="joa.service.gongjiServiceimple"%>
<%@ page import="joa.DTO.*"%>
<%@ page import="joa.service.*"%>
<%@ page import="joa.Domain.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조아리조트에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
<style>
html,body{
	height: 100%;
}
.wrap {
    display: flex;
    flex-direction: column;
		height: 100%;
}
.header {
  height: 80px;
  background-color: #00c73c;
}
.tablist {
    height: 350px;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,0.1);
    background-color: white;
}

.content {
    display: flex;
    flex: 1;
}
.aside {
    display: flex;
    flex: none;
    width: 400px;
    background-color: #bfbab078;
}
.main{
    display: flex;
    flex: 1;
    overflow: auto;
    -webkit-flex-direction:column;
　flex-direction:column;
}
.main_content{
	display: flex;
	width: auto;
	height : 400px;
	background-color : white;
}
.main_content2{
	display: flex;
	width: auto;
	height: 400px;
	background-color : white;
}
.map_wrap {
	display: flex;
	flex-direction: column;
	height: 100%;

}
.footer {
    background-color: lightgreen;
    height: 200px;
    margin-top: auto;
}
.a{
	text-align : center;

}
</style>
<script language="JavaScript">
function submitForm(mode){
	console.log('함수 접근');
	
	var tmp = document.getElementsByName('title')[0].value;//name인 title의 value값 가져오기
	
	for(var i=0;i<100;i++){//공백만 있는지 검사
		tmp=tmp.replace(" ","");//공백을 아무것도 없는 걸로 바꾼다.
	}//i<100은 입력한 길이 만큼 설정
	
	if(mode=="update"){
		
		if(tmp==""){
			alert('제목을 입력해야 합니다.');
			
		}else{
			console.log('else에 접근');	
	fm.action = "e_01_insertcheck.jsp";
	console.log('액션성공');	
	fm.submit();
		}
	}
}

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
<form method=post enctype="multipart/form-data" name=fm>
<div id="wrap" class="wrap">
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지

int from=1;
if(request.getParameter("from")!=null){
 from = Integer.parseInt(request.getParameter("from"));//현재 페이지 값을 파라미터로 받음
}
int id=Integer.parseInt(request.getParameter("id"));


gongjiServiceimple gs =new gongjiServiceimple();
gongjiSIO g= new gongjiSIO();
g=gs.selectOne(id);

%>
 <input type=hidden name=from value=<%=from%> />
  <header><br><br><h2>공지사항</h2></header>
  <br>
  <hr>
  <div class="content">
  <div class="aside"></div>
	<div class="main"> 
 <form method = post name='fm'>
<table width border=1 cellspacing=0 cellpadding=5 align =center style="border-right: hidden; border-left: hidden">
<tr>
	<td class="skycolor"><b>번호</b></td>
	<td bgcolor=white><input type=hidden name="id" value='<%=g.getId()%>'></td>
</tr>
<tr>
	<td class="skycolor"><b>제목</b></td>
	<td bgcolor=white><input type=text  class="form-control" name="title" size=70 maxlength=70 value='<%=g.getTitle()%>'><%=g.getTitle()%></td>
</tr>
<tr>
	<td class="skycolor"><b>일자</b></td>
	<td bgcolor=white><%=gs.getFormatDate()%></td>
</tr>
<tr>
	<td class="skycolor"><b>파일</b></td>
	<td bgcolor=white><input type="file" name="file"></td>
</tr>
<tr>
	<td class="skycolor"><b>조회</b></td>
	<td bgcolor=white><input type=hidden name="viewcnt" value='<%=g.getViewcnt()%>'></td>
</tr>
	<input type=hidden name="rootid" value-'<%=g.getRootid()%>'>
	<input type=hidden name="relevel" value='<%=g.getRelevel()%>'>
	<input type=hidden name="recnt" value='<%=g.getRecnt()%>'>
<tr>
	<td class="skycolor"><b>내용</b></td>
	<td bgcolor=white><textarea name="content" class="form-control" rows="3"></textarea></td>
</tr>

<tr>
	<td colspan=2 align=right bgcolor=white>
	<input type=button value="취소" OnClick="location.href='e_01.jsp?from=<%=from%>'">
	<input type=button value="수정" OnClick="submitForm('update')">
	</td>
</tr>
</table>
</form>
</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<jsp:include page="footer.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>
</body>
</html>