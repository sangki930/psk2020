<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.time.*"
	import="java.time.LocalDate"
	import="java.text.*"
    pageEncoding="UTF-8"%>
<%@ page import="joa.DTO.*"%>
<%@ page import="joa.Domain.*"%>
<%@ page import="joa.Repo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="joa.Resv_service.ResvService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조아리조트에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Compiled and minified CSS -->
  <!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> -->

    <!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
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
}
.main_content{
	display: flex;
	width: auto;
	height : 500px;
	background-color : white;
}
.main_content2{
	display: flex;
	width: 500px;
	height: 100px;
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
.sat_font{
	font-color : blue;
}
.sun_font{
	font-color : red;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 function responsive(){
		var w = $(window).width();

		if(w<=768){
			console.log('반응했음');
			$(".aside").hide();
			}
		else{
			$(".aside").show();
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


<%
	request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
	//예약 처리 부분
	String name="";
	if(request.getParameter("name")!=null){
		name=request.getParameter("name"); //이름 받아옴
	}
	String date="";
	if(request.getParameter("date")!=null){
		 date=request.getParameter("date"); //날짜 받아옴
	}
	int room=-1;
	if(request.getParameter("room")!=null){
		room=Integer.parseInt(request.getParameter("room"));//방번호 받아옴
	}
	String addr="";
	if(request.getParameter("address")!=null){
		addr=request.getParameter("address");//방번호 받아옴
	}
	String phonenum="";
	if(request.getParameter("phonenumber")!=null){
		phonenum=request.getParameter("phonenumber"); //휴대폰 번호 받아옴
		
	}
	String deposit="";
	if(request.getParameter("deposit")!=null){
		 deposit=request.getParameter("deposit"); //입금자명 받아옴
		
	}
	String comment="";
	if(request.getParameter("comment")!=null){
		 comment=request.getParameter("comment"); //남길말
		
	}
	
	
	Enumeration params = request.getParameterNames();
	System.out.println("----------------------------");
	while (params.hasMoreElements()){
		String pname = (String)params.nextElement();
		System.out.println(pname + " : " +request.getParameter(pname));
	}
	System.out.println("----------------------------");
	

	String d_01_resvform = "d_01_resvform.jsp?date=";
	String adm_oneview = "adm_oneview.jsp?date=";
	LocalDate today = LocalDate.now();
	//LocalDate.now() : 현재 날짜 얻기
	String[][] resv_arr=new String[30][5];
	ResvService r=new ResvService();
	if(room!=-1){
	r.Reservation(new ResvSIO(name,LocalDate.parse(date),room,addr,phonenum,deposit,comment,LocalDate.now(),1));
	}else{
		//out.println("<h5>예약실패...</h5>");
	}
	
%>
<div id="wrap" class="wrap">
<form method=post>
 
  <header><br><br><h2>예약하기</h2></header>
  <br>
  <hr>
  <div class="content">
  <div class="aside"></div>
 
<div class="main">
	  <div class="main_content">
	  
	  <input name="from" type="hidden" value="">
	  <table class="striped a" style="width : 800px" border=1>
	        <thead>
	          <tr>
	              <th width=45% class="a">일자</th><!-- 가운데 정렬 -->
	              <th width=10% class="a">요일</th>
	              <th width=15% class="a">룸1</th>
	              <th width=15% class="a">룸2</th>
	              <th width=15% class="a">룸3</th>
	          </tr>
	        </thead>
	
	        <tbody>
	        	<%
	        		//DAO랑 서비스는 상태를 가지면 안됨
					int status[]={0,1,2,3,4};
					String st[]={"예약가능"};
					
	        		
		        	for (int i=0; i<30; i++){
		        		
		        		out.println("<tr>");
		        		for(int j=0;j<5;j++){
		        			if(j==0){
		        				resv_arr[i][j]=r.getDay(today.plusDays(i));
		        				
		        				if(r.getWeekday(today.plusDays(i)).equals("토")){//토요일이면 파란색
		        					out.println("<td class=\"a\"><font color=\"blue\">");
		        					
		        				}else if(r.getWeekday(today.plusDays(i)).equals("일")){//일요일이면 빨간색
		        					out.println("<td class=\"a\"><font color=\"red\">");
		        					
		        				}else{
		        				
		        				out.println("<td class=\"a\"><font>");
		        				}
		        				
		        				
		        				out.println(resv_arr[i][j]+"</font></td>");
		        				
		        			}else if(j==1){
		        				
		        				resv_arr[i][j]=r.getWeekday(today.plusDays(i));
		        				if(r.getWeekday(today.plusDays(i)).equals("토")){//토요일이면 파란색
		        					out.println("<td class=\"a\"><font color=\"blue\">");
		        					
		        				}else if(r.getWeekday(today.plusDays(i)).equals("일")){//일요일이면 빨간색
		        					out.println("<td class=\"a\"><font color=\"red\">");
		        					
		        				}else{
		        				
		        				out.println("<td class=\"a\"><font>");
		        				}
		        				
		        				out.println(resv_arr[i][j]+"</font></td>");
		        			}else{
		        				
		        				if(r.isReserved(today.plusDays(i), (j-1)).equals("")){//예약 여부
		        					resv_arr[i][j]="예약가능";
			        				out.println("<td class=\"a\">");
			        				out.println("<a href='"+d_01_resvform+today.plusDays(i)+"&room="+(j-1)+"'>");
			        				out.println(resv_arr[i][j]+"</a></td>");
		        					
		        				}else{
		        					if(login_id.equals("admin")){//1번 if
		        						resv_arr[i][j]=r.isReserved(today.plusDays(i), (j-1));
				        				out.println("<td class=\"a\">");
				        				out.println("<a href='"+adm_oneview+today.plusDays(i)+"&room="+(j-1)+"'>");
				        				out.println(resv_arr[i][j]+"</a></td>");
		        						
		        					}else{
		        					resv_arr[i][j]=r.isReserved(today.plusDays(i), (j-1));
			        				out.println("<td class=\"a\">");
			        				//out.println("<a href='"+d_01_resvform+today.plusDays(i)+"'>");
			        				out.println(resv_arr[i][j]+"</td>");
		        					}//1번 if 종료
		        					
		        				}
		        				
		        			}
		        			
		        		}
		        		out.println("</tr>");
		        		//today.plusDays((i+1));//1일 후 날짜 계산
		        	}
     				
	        	%>
	          
	        </tbody>
	  </table>
	  <br>
	  <br>
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