<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
    pageEncoding="UTF-8"%>
<%@ page import="joa.service.gongjiServiceimple"%>
<%@ page import="joa.DTO.*"%>
<%@ page import="joa.Repo.*"%>
<%@ page import="joa.Domain.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 이렇게 함으로써 외부의 CDN 서버에서 가장 최신의 jQuery 배포판을 불러 올 수 있습니다. //-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="style3.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> -->
<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> -->

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
$(document).ready(()=>{

	console.log("제이쿼리 사용 확인");
	
});

</script>

<style>
html,body{
	height: 100%;
}
h1,h2,ul,li,p,div{margin : 0; padding : 0; box-sizing: border-box;}/*여백 기본 설정*/
/* .wrap {
    display: flex;
    flex-direction: column;
	height: 100%;
} */
/* .header {
  height: 80px;
  background-color: #00c73c;
} */
.lnb li {margin : 10px; padding : 10px; background : lightgreen;}
.slider {
    height: 350px;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,0.1);
    background-color: white;
}

.content {
    display: flex;
    flex: 1;
}
/* .aside {
    display: flex;
    flex: none;
    width: 400px;
    background-color: #bfbab078;
} */
.main{
    display: flex;
    flex: 1;
    overflow: auto;
}
.map_wrap {
	display: flex;
	flex-direction: column;
	height: 100%;

}
#content1{
	background-color : lightblue;
	width:50%;
	float : left;
}
#joaimg{
	width : 100%;
	height : 100%;
}
#notice{
	background-color : lightgreen;
	width:50%;
	float : left;
}
#notice a{
	color : black;
	text-decoration : none;
	
}
li {list-style-type: none;}
.clear:after {content:""; display:block; clear:both;}
/* .footer {
    background-color: lightgreen;
    height: 200px;
    margin-top: auto;
} */
#adsp{
	font-size  : 20px;
	font-weight : bold;
}
@media all and (max-width : 768px){
/*모바일 환경에 들어갈 때*/
	
	#content1{
		float : none;
		width : 100%;
	}
	
	#notice{
		clear : both;
		width : 100%;
	}
	#notice a{
		text-decoration : none;
	}
	#ads{
		display : none;
	}
	

}
</style>
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

<!-- <div id="wrap" class="wrap"> -->
 <!--  <header class="header">
  <div class="menu-bar">

<ul>
<li><a href="index_test.html"><img src="joaresort.jpg" width = 100 height = 50></a></li>

<li class="active"><a href="#"><i class="fa fa-home"></i>Home</a></li>

<li><a href="#"><br><i class="fa fa-user"></i>리조트소개</a>
<div class="sub-menu-1">
	<ul>
		<li><a href="#">조아리조트</a></li>
		<li><a href="#">VIP룸</a></li>
		<li><a href="#">일반룸</a></li>
		<li><a href="#">합리적인룸</a></li>
	</ul>
</div></li>

<li><a href="#"><br><i class="fa fa-clone"></i>찾아오기</a>
<div class="sub-menu-1">
	<ul>
		<li><a href="#">찾아오는 길</a></i></li>
		<li class="hover-me"><a href="#">Marketing</a><i class="fa fa-angle-right"></i>
			<div class="sub-menu-2">
				<ul>
				<li><a href="#">대중교통이용</a></li>
				<li><a href="#">자가용 이용</a></li>
				<li><a href="#">셔틀버스 이용</a></li>
			</ul>
			</div>

		</li>
		</li>
		<li class="hover-me"><a href="#">(비활성화)</a><i class="fa fa-angle-right"></i>
			<div class="sub-menu-2">
				<ul>
				<li><a href="#">(비활성화)</a></li>
				<li><a href="#">(비활성화)</a></li>
				<li><a href="#">(비활성화)</a></li>
				<li><a href="#">(비활성화)</a></li>
				<li><a href="#">(비활성화)</a></li>
			</ul>

			</div>

		</li>
	</ul>
</div>
</li>
<li><a href="#"><br><i class="fa fa-users"></i>주변여행지</a>
	<div class="sub-menu-1">
	<ul>
		<li><a href="#">높아산</a></li>
		<li><a href="#">조아해수욕장</a></li>
		<li><a href="#">따끈온천</a></li>
	</ul>
</div>

</li>
<li><a href="#"><br><i class="fa fa-phone"></i>예약하기</a>
<div class="sub-menu-1">
	<ul>
		<li><a href="#">조아리조트</a></li>
		<li><a href="#">VIP룸</a></li>

	</ul>
</div>

</li>
<li><a href="#"><br><i class="fa fa-inr"></i>팬션소식</a>
<div class="sub-menu-1">
	<ul>
		<li><a href="e_01.jsp">공지사항</a></li>
		<li><a href="#">이용후기</a></li>
	</ul>
</div></li>
</ul>
</div>



  </header> -->
  <div class="slider">
		<p>
		<iframe src="main.html" width = 100% height=350px></iframe>
  </div>
  <!-- <div id="container"> -->
  	<div id="content1">
  		<img id="joaimg" src="joaResort2.jpg" />
  	</div>
  	<div id="notice">
  		<h1><a id="noticetitle" href="e_01.jsp">공지사항</a></h1>
  		<!-- <ul>
  			<li>공지사항1</li>
  			<li>공지사항2</li>
  			<li>공지사항3</li>
  			<li>공지사항4</li>
  		</ul> -->
  		<%
		int from=1;
		int cnt=3;
	gongjiServiceimple gsi = new gongjiServiceimple();
	  gongjiPage gp = new gongjiPage(from,cnt);
	  List<gongjiSIO> l=gsi.pageNation(from,cnt);
	
	%>
  		<table border=0 width=100%>
  			
  			<!-- <tr><td width=705>공지사항1</td><td width=30%>2020-02-09</td></tr>
  			<tr><td width=705>공지사항1</td><td width=30%>2020-02-09</td></tr>
  			<tr><td width=705>공지사항1</td><td width=30%>2020-02-09</td></tr>
  			<tr><td width=705>공지사항1</td><td width=30%>2020-02-09</td></tr>
  			<tr><td width=705>공지사항1</td><td width=30%>2020-02-09</td></tr>
  			<tr><td width=705>공지사항1</td><td width=30%>2020-02-09</td></tr>	 -->	
  			<%
				for(int i=0;i<l.size();i++)//l.size()는 3이하임
				{
			
			%>
			<tr><td width=70%><a href='e_01_view.jsp?id=<%=l.get(i).getId()%>'><%=(l.get(i).getTitle())%></td></td><td width=30%><%=l.get(i).getDate()%></td></tr>
			
			<%
			
				}
			%>
  		</table>
  	</div>
  	<div id="ads">
  		<p id="adsp">설렌다 조아리조트!!</p>
  		<br>
  		<br>
  		<p>조아리조트에 오시면 다양하고 신나는 체험을 할 수 있습니다!!!!</p>
  	</div>
  <!-- </div> -->
  <%-- <div class="content">
    <div class="aside">
	<%
		int from=1;
		int cnt=3;
	gongjiServiceimple gsi = new gongjiServiceimple();
	  gongjiPage gp = new gongjiPage(from,cnt);
	  List<gongjiSIO> l=gsi.pageNation(from,cnt);
	
	%>
		<table border="1" width =100%>
		
			<th width=75%>공지사항</th><th width=25%><a href="e_01.jsp"><i class="far fa-plus-square"></i></a></th>
			
			
			<%
				for(int i=0;i<l.size();i++)//l.size()는 3이하임
				{
			
			%>
			<tr><td><%=(l.get(i).getTitle())%></td><td><%=l.get(i).getDate()%></td></tr>
			
			<%
			
				}
			%>
		</table>

    </div>

    <div class="">(비활성화중)</div>

</div> --%>
	<!-- <div height=100px style="background-color: skyblue"><img src = "joaresort.jpg" height=100px></div> -->
<!-- <div>
<footer class="footer">
	<div class="land_information"><a href="http://www.naver.com/policy/service.html" class="land_information_link" target="_blank">이용약관</a>
		<a href="http://land.naver.com/index/declaredArticlePolicy.nhn" class="land_information_link" target="_blank">매물신고운영</a><a href="http://policy.naver.com/rules/privacy.html" class="land_information_link important" target="_blank">개인정보처리방침</a>
		<a href="https://help.naver.com/support/service/main.nhn?serviceNo=746" class="land_information_link" target="_blank">부동산 고객센터</a></div><p class="land_alert">용평리조트 강원도 평창군 대관령면 올림픽로 715(구 용산리 130) TEL : (예약문의) 1588-0009 (현장문의) 033-335-5757
	</p><div class="land_copyright"><a href="#" target="_blank" aria-label="네이버">
		<i class="icon icon_naver_logo" aria-hidden="true"></i></a>Copyright ⓒ <a href="http://www.navercorp.com/ko/index.nhn" target="_blank" class="land_copyright_point">JOAResort Corp.</a> All Rights Reserved.
	</div>
</footer>
</div> -->

<!-- </div> -->
<jsp:include page="footer.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>
</body>
</html>