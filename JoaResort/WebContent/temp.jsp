<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
    pageEncoding="UTF-8"%>
<%@ page import="joa.service.gongjiServiceimple"%>
<%@ page import="joa.DTO.*"%>
<%@ page import="joa.service.*"%>
<%@ page import="joa.Domain.*"%>
<%@ page import="joa.Repo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조아리조트에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="Place.css">  -->
<!-- <link rel="stylesheet" href="css/common.css"> -->
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
*{/*전체*/
	padding : 0; /* 패딩이 0 */
	margin : 0; /*여백이 0*/
	font-family : 'Nanum Gothic';/*폰트 설정*/
}
#hero{
	top : 50px;
	width : 90%;
	height : 90%;
	position : relative;
	margin : 50px auto;
	overflow : hidden;
}
.hdd{font-size:30px;font-color:soild black; padding : 5px}
/* anchor */
a {text-decoration:none;}
a:link {color:#444;}
a:visited {color:#444;}
a:hover {color:#444;}
a:focus {color:#444;}

/* 공지사항 목록 */
.minisrch_form {width:100%; text-align:right; margin-bottom:20px;}
.minisrch_form .tbox {padding:0 5px 0 30px; width:200px; height:35px; line-height:35px; border:none; border-bottom:1px solid #ccc; background:url('../img/ico_search.png') no-repeat 10px 50%; background-size:15px;}
.bbsListTbl {width:100%; border-top:2px solid #384d75;}
.bbsListTbl th, .bbsListTbl td {padding:10px; box-sizing:border-box; height:55px;}
.bbsListTbl th {border-bottom:1px solid #ccc; background:#f0f3fa;}
.bbsListTbl td {text-align:center; line-height:1.3; border-bottom:1px solid #ccc;}
.bbsListTbl td.tit_notice {text-align:left;}
.bbsListTbl td:nth-child(1) {width:10%;}
.bbsListTbl td:nth-child(2) {width:55%;}
.bbsListTbl td:nth-child(3) {width:15%;}
.bbsListTbl td:nth-child(4) {width:20%;}
.pagination {padding:40px 0 0; text-align:center;}
.pagination a {display:inline-block; }
.pagination a.pbtn {display:inline-block; padding:7px; text-align:center; vertical-align:middle; font-size:0;}
.pagination a .pagenum {display:inline-block; width:25px; height:25px; line-height:25px; text-align:center; vertical-align:middle;}
.pagination a .currentpage {border-radius:3px; background:#384d75; color:#fff;}
.pagination a:hover .pagenum {border-radius:3px; background:#ddd;}

/* 공지사항 상세보기 */
.bbsview_list {padding-bottom:30px;  border-top:2px solid #384d75;}
.bbsview_list li {box-sizing:border-box; padding:0 15px; border-bottom:1px solid #ccc; font-size:14px; color:#666;}
.bbsview_list li.bbs_title {width:100%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis; height:50px; line-height:50px; font-weight:bold; font-size:16px;}
.bbsview_list li.bbs_hit {height:40px; line-height:40px; float:left; width:50%;}
.bbsview_list li.bbs_date {height:40px; line-height:40px; float:left; width:50%;}
.bbsview_list li.bbs_content {clear:both; min-height:200px; padding:20px 15px;}
.bbsview_list li.bbs_content .editer_content {line-height:1.4;}
.near_list {border-top:1px solid #ccc;}
.near_list li {padding:10px; border-bottom:1px solid #ccc;}
.near_list li:after {content:""; display:block; clear:both;}
.near_list li h4 { float:left; width:100px; padding:0 0 0 50px; background:url(../img/ico_nearNext.png) no-repeat 12px 50%; font-size:15px;}
.near_list li h4.next {background:url('../img/ico_nearPrev.png') no-repeat 12px 50%;}
.near_list li a {float:left;}

@media all and (max-width:800px) {
/* 공지사항 */
	.bbsListTbl {width:100%; border-top:2px solid #384d75;}
	.bbsListTbl th, .bbsListTbl td {padding:10px; box-sizing:border-box; height:45px;}
	.bbsListTbl th {padding:0;}
	.bbsListTbl th {border-bottom:1px solid #ccc; font-weight:bold; font-size:14px;}
	.bbsListTbl th:nth-child(1) {display:none;}
	.bbsListTbl th:nth-child(2) {width:70%;}
	.bbsListTbl th:nth-child(3) {display:none;}
	.bbsListTbl th:nth-child(4) {width:30%;}
	.bbsListTbl td {text-align:center; line-height:1.3; border-bottom:1px solid #ccc;}
	.bbsListTbl td.tit_notice a {display:block;}
	.bbsListTbl td:nth-child(1) {display:none;}
	.bbsListTbl td:nth-child(2) {width:70%;}
	.bbsListTbl td:nth-child(3) {display:none;}
	.bbsListTbl td:nth-child(4) {width:30%;}

	/* 공지사항 상세보기 */
	.near_list {display:none;}

	/* place_area */
	.bodytext_area.place_area {padding:33px 0 0;}
	.program_list {padding:0 20px;}
	.program_list li {float:left; width:100%; margin:0%; box-sizing:border-box; border-top:1px solid #ccc; padding:30px 0px;}
	.program_list li:first-child {border-top:none; padding-top:0;}
	.program_list li h3 {padding:20px 0 0; text-align:center;}
	.program_list li .subttl {padding:15px 0 0; text-align:center; font-size:18px;}
    .program_list li .program_content p .subtxt {display:inline;}
	.program_list li .btn_more {display:none;}
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

	 <div id="hero">
	 
	 	<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<form action="#" class="minisrch_form">
				<fieldset>
					<!-- <legend>검색</legend>
					<input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<a href="javascript:;" class="btn_srch">검색</a> -->
				</fieldset>
			</form>
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td class="tit_notice"><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>2</td>
						<td class="tit_notice"><a href="javascript:;">박물관 미션 투어 응모 당첨자 발표</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>3</td>
						<td class="tit_notice"><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>4</td>
						<td class="tit_notice"><a href="javascript:;">하롱베이 서비스 OPEN! (여행정보, 가이드북, 가이드맵)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>5</td>
						<td class="tit_notice"><a href="javascript:;">투어리스트인투어 서비스 점검 안내 - 투어리스트인투어에서 매월 실시하는 정기점검 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>6</td>
						<td class="tit_notice"><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>7</td>
						<td class="tit_notice"><a href="javascript:;">박물관 미션 투어 응모 당첨자 발표</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="tit_notice"><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>9</td>
						<td class="tit_notice"><a href="javascript:;">하롱베이 서비스 OPEN! (여행정보, 가이드북, 가이드맵)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>10</td>
						<td class="tit_notice"><a href="javascript:;">투어리스트인투어 서비스 점검 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
				</tbody>
			</table>
			<!-- pagination -->
			<div class="pagination">
				<a href="javascript:;" class="firstpage  pbtn"><img src="img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				<a href="javascript:;" class="prevpage  pbtn"><img src="img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				<a href="javascript:;"><span class="pagenum currentpage">1</span></a>
				<a href="javascript:;"><span class="pagenum">2</span></a>
				<a href="javascript:;"><span class="pagenum">3</span></a>
				<a href="javascript:;"><span class="pagenum">4</span></a>
				<a href="javascript:;"><span class="pagenum">5</span></a>
				<a href="javascript:;" class="nextpage  pbtn"><img src="img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				<a href="javascript:;" class="lastpage  pbtn"><img src="img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			<!-- //pagination -->
			
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->
		
	</div>
	<div>
		<jsp:include page="footer.jsp" flush="false"> 
		<jsp:param value="list" name="menu"/>
		</jsp:include>
	</div>
</body>
</html>