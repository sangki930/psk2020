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
	
	if(mode=="insert"){
		
		if(tmp==""){
			alert('제목을 입력해야 합니다.');
			
		}else{
			console.log('else에 접근');	
	fm.action = "e_01_write.jsp";
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

String uploadPath=request.getRealPath("/upload"); //폴더의 절대 경로
System.out.println("실제 파일 경로 : "+uploadPath);
int size=5*1024*1024;//업로드 최대 크기
String name="";
String subject="";

String fileName1=""; //중복 처리된 이름
String originalName1=""; //중복 처리전 실제 원본

String fileName2=""; //중복 처리된 이름
String originalName2=""; //중복 처리전 실제 원본



MultipartRequest m =null;



try{
	m = new MultipartRequest(
			request,
			uploadPath,
			size,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	
	String filename_before=m.getParameter("filename_before");

	String filePath=uploadPath+"/"+filename_before;
	File f=new File(filePath);

	if(f.exists())f.delete();//파일이 존재하면 삭제
	
	name=m.getParameter("name");
	//subject=m.getParameter("subject");
	
	// 첨부 파일 여러개 가져옴
	Enumeration files = m.getFileNames();
	
	// 파일의 이름만 가져옴 - >전송받은 이름
	String file1=(String)files.nextElement();
	
	//m에서 해당 이름을 알려주고 실제 시스템상의 이름을 알아낸다.
	fileName1 = m.getFilesystemName(file1);
	
	//m에서 알고 있는 (파일)원본이름을 file1을 통해서 알아낸다.
	originalName1=m.getOriginalFileName(file1);
	
	File file = m.getFile(name);
	
	
	
}catch(Exception e){
	out.print(e.getMessage());
	System.out.print("파일 업로드 문제 발생 : "+e.getMessage());
}

gongjiServiceimple g =new gongjiServiceimple();

//int id=Integer.parseInt(m.getParameter("id"));//id 파라미터를 가져옴
int id=g.next_number();
int rootid=id;//원글 번호를 가져옴
if(m.getParameter("rootid")!=null){
	rootid=Integer.parseInt(m.getParameter("rootid"));
}
int relevel=0;//댓글 수준
if(m.getParameter("relevel")!=null)
{relevel=Integer.parseInt(m.getParameter("relevel"));

}
int recnt=0;//댓글 내 순서
if(m.getParameter("recnt")!=null){
	recnt=Integer.parseInt(m.getParameter("recnt"));
}

String title=m.getParameter("title");
String content=m.getParameter("content");

int from=1;//from값
if(m.getParameter("from")!=null){
 from = Integer.parseInt(m.getParameter("from"));//현재 페이지 값을 파라미터로 받음
}
int viewcnt=0;
if(m.getParameter("viewcnt")!=null){
	viewcnt=Integer.parseInt(m.getParameter("viewcnt"));
}


System.out.println(originalName1);

g.update(new gongjiSIO(id,title,g.getDate(),content,rootid,relevel,recnt,viewcnt,originalName1));

%>
 
  <header><br><br><h2>수정 완료</h2></header>
  <br>
  <hr>
  <div class="content">
  <div class="aside"></div>
	<div class="main"> 
 <form method = post name='fm'>
<table width border=1 cellspacing=0 cellpadding=5 align =center style="border-right: hidden; border-left: hidden">
<tr>
	<td class="skycolor"><b>번호</b></td>
	<td bgcolor=white><%=id%></td>
</tr>
<tr>
	<td class="skycolor"><b>제목</b></td>
	<td bgcolor=white><%=title%></td>
</tr>
<tr>
	<td class="skycolor"><b>등록일자</b></td>
	<td bgcolor=white><%=g.getFormatDate()%></td>
</tr>
<tr>
	<td class="skycolor"><b>파일</b></td>
	<td bgcolor=white><%=originalName1%></td>
</tr>
<tr>
	<td class="skycolor"><b>내용</b></td>
	<td bgcolor=white><textarea class="form-control" rows="3"></textarea></td>
</tr>
<tr>
	<td colspan=2 align=right bgcolor=white>
	<input type=button value="목록" OnClick="location.href='e_01.jsp?from=<%=from%>'">
	<input type=button value="쓰기" OnClick="submitForm('insert')">
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