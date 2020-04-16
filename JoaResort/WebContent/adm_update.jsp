<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	import="java.net.*"
    pageEncoding="UTF-8"%>
<%@ page import="joa.DTO.*"%>
<%@ page import="joa.Domain.*"%>
<%@ page import="joa.Repo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="joa.Resv_service.*" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<script language="JavaScript">
	function submitForm(mode){
		console.log('함수 접근');
		
		var tmp = document.getElementsByName('name')[0].value;//name의 value값 가져오기
		var tmp1 = document.getElementsByName('address')[0].value;//address의 value값 가져오기
		
		for(var i=0;i<100;i++){//공백만 있는지 검사
			tmp=tmp.replace(" ","");//공백을 아무것도 없는 걸로 바꾼다.
			tmp1=tmp1.replace(" ","");
		}//i<100은 입력한 길이 만큼 설정
		
		if(mode=="update"){
			
			if(tmp==""){
				alert('제목을 입력해야 합니다.');
				
			}else if(tmp1=""){
				alert('주소를 입력해야 합니다.');
				}
			else{
				console.log('else에 접근');	
		fm.action = "adm_update.jsp";
		console.log('액션성공');	
		fm.submit();
			}
		}else(mode=="delete"){
			if(tmp==""){
				alert('제목을 입력해야 합니다.');
				
			}else if(tmp1=""){
				alert('주소를 입력해야 합니다.');
				}
			else{
				console.log('else에 접근');
				confirm("에약취소 하시겠습니까??");	
				fm.action = "d_01.jsp";
				console.log('액션성공');	
				fm.submit();
			}


			}
	}
</script>
            
<style>
html,body{
	height: 100%;
}
.wrap {
    display: flex;
    flex-direction: column;
		height: auto;
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
    height : auto;
    background-color: #bfbab078;
}
.main{
    display: flex;
    height : 700px;
    flex: 1;
    overflow: auto;
    -webkit-flex-direction:column;
　flex-direction:column;
 display: inline-block;
    vertical-align: middle;
}
.main_content{
	display: flex;
	width: 100%;
	height : 603px;
	background-color : white;
}
.main_content2{
	display: flex;
	width: 100%;
	height: 97px;
	background-color : white;
	align : center;
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
table{
	table-layout : fixed;/*표크기 고정*/
}
td{
	table-layout : fixed;
	text-overflow:ellipsis; 
	overflow:hidden; 
	white-space:nowrap;
}
</style>
</head>
<body>
<%
	/*로그인 여부*/
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
<%
	/* 파라미터 값 확인*/
	String resvlistURL = "d_01.jsp";
	String date=request.getParameter("date");
	String room=request.getParameter("room");
	
	System.out.println("date확인 : "+date);
	System.out.println("room확인 : "+room);
	
	
	ResvService rs = new ResvService();
	
	ResvSIO r = rs.getOneRec(date,room);
	
	if(r==null){
		System.out.println("r은 비어 있음!!!!!!!!");
	}
	
	/* 방판단*/
	System.out.println("getRoom  확인"+r.getRoom());
	
%>
<div id="wrap" class="wrap">
<form method=post name="fm">
 <input type="hidden" name="act" value="update">
  <header><br><br><h2>예약하기</h2></header>
  <br>
  <hr>
  <div class="content">
  <div class="aside"></div>
  
  <div class="main">
  <div class="main_content">
  	<table  border=1 cellspacing=0 cellpadding=5 align =center style="border-right: hidden; border-left: hidden; height : 100%;">
			<tr>
				<td class="skycolor"><b>성명</b></td>
				<td bgcolor=white><input type=text name="name" class="form-control" id="inputName" value="<%=r.getName()%>" ></td>
			</tr>
			<tr>
				<td class="skycolor"><b>예약일자</b></td><!-- 값을 받아옴 -->
				<td bgcolor=white><input type=text name="date"  class="form-control"  size=70 maxlength=70 value="<%=r.getResv_date()%>"></td>
			</tr>
			<tr>
				<td class="skycolor"><b>예약방</b></td>
				<td bgcolor=white>
				<input type=text name="room"  class="form-control"  size=70 maxlength=70 value="<%=rs.getRoom(r.getRoom())%>">
				</td>
			</tr>
			<tr>
				<td class="skycolor"><b>주소</b></td>
				<td bgcolor=white>
				<input type=text name="address"  class="form-control"  size=70 maxlength=70 value="<%=r.getAddr()%>">
				<br /><span style="color:#aaa;" id="counter">(0 / 최대 70자)</span></textarea></td>
				<script>
					//설명란 textarea 체크
					$('.DOC_TEXT').keyup(function (e){
					    var content = $(this).val();
					    $('#address').html("("+content.length+" / 최대 70자)");    //글자수 실시간 카운팅
				
					    if (content.length > 70){
					        alert("최대 70자까지 입력 가능합니다.");
					        $(this).val(content.substring(0, 1000));//첨부터 마지막 1000번째까지 글자수 자름
					        $('#address').html("(70 / 최대 70자)");//자른 1000자를 기재
					    }
					})
				</script>
				</td>
			</tr>
			<tr>
				<td class="skycolor"><b>전화번호</b></td><!-- 값을 받아옴 -->
				<td bgcolor=white>
				<input type=text name="phonenumber"  class="form-control"  size=70 maxlength=70 value="<%=r.getTelnum()%>">
				</td>
			</tr>
			<tr>
				<td class="skycolor"><b>입금자명</b></td><!-- 값을 받아옴 --><td>
				<input type=text name="deposit"  class="form-control"  size=70 maxlength=70 value="<%=r.getIn_name()%>">
				</td>
			</tr>
			<tr>
				<td class="skycolor"><b>남기실말</b></td>
				<td bgcolor=white>
				<input type="text" name="comment" id="comment" class=".DOC_TEXT2,form-control" value="<%=r.getComment()%>">
				<br /><span style="color:#aaa;" id="counter">(0 / 최대 200자)</span></textarea></td>
				<script>
					//설명란 textarea 체크
					$('.DOC_TEXT').keyup(function (e){
					    var content = $(this).val();
					    $('#address').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
				
					    if (content.length > 200){
					        alert("최대 200자까지 입력 가능합니다.");
					        $(this).val(content.substring(0, 1000));//첨부터 마지막 1000번째까지 글자수 자름
					        $('#address').html("(200 / 최대 200자)");//자른 1000자를 기재
					    }
					})
					</script>
					
			</tr>						
			<tr>
				<td></td>
			</tr>
</table>
</div>
  <div class="main_content2">
  <div class="row">
				<div class="col" align=center>
					<p class="p1"><strong></strong></p>
					<ul class="pagination page-bar">
						<li class="page-item"><a class="page-link" Onclick="submitForm('update')">예약수정</a></li>
						<li class="page-item"><a class="page-link" Onclick="submitForm('delete')">예약취소</a></li>
						<li class="page-item"><a class="page-link" href="d_01.jsp">돌아가기</a></li>
					</ul>
				</div>
				</div>
			</div>
			</div>
  	</div>
 </div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</form>

<jsp:include page="footer.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>
</body>
</html>