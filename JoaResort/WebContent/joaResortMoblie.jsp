<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="jquery.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>$.mobileBackCompat = false;</script>
<script src="jquery-mobile.js"></script>
<!-- <script>
$(document).ready(function(){
	$('#notice').click(function(){
	$('#page13 #contentArea').empty();//id가 listArea인 곳을 날림
	$('#page13 #contentArea').load('e_01.jsp #board',function(){
		//ajax-listinfo.jsp <li>부분만 불러온다.
		$('#board a').attr("href","#page15");
		$('#page13 #contentArea').listview('refresh');
		});
	});
	
});

</script> -->
<title>Insert title here</title>
<style>
.fieldtd{
	background:#EEEEEE;
}
.normaltd{
	background:#FDFDFD;
}
</style>
</head>
<body>

<%
	int p;//page 번호
	int panel=1;//패널
	int total_page=15;
	
	for(p=1;p<=total_page;p++){
		
		%>
		<div data-role="page" id="page<%=p%>">
			<div data-role="panel" id="panel<%=1+(p-1)*5%>" data-display="overlay">
					<ul data-role="listview">
						<li data-icon="delete"><a href="#" data-rel="close">메뉴끄기</a></li>
						<li><a href="#page2">조아리조트</a></li>
						<li><a href="#page3">VIP룸</a></li>
						<li><a href="#page4">일반룸</a></li>
						<li><a href="#page5">합리적인 룸</a></li>
					</ul>
			</div>

			<div data-role="panel" id="panel<%=2+(p-1)*5%>"data-display="overlay">
				<ul data-role="listview">
					<li data-icon="delete"><a href="#" data-rel="close">메뉴끄기</a></li>
						<li><a href="#page6">지하철 이용</a></li>
						<li><a href="#page7">버스 이용</a></li>
						<li><a href="#page8">자가용 이용</a></li>
				<!--  		<li><a href="#page8">(비활성화)</a></li> -->
				</ul>
			</div>
			
			<!--  -->
			
			<div data-role="panel" id="panel<%=3+(p-1)*5%>" data-display="overlay">
				<ul data-role="listview">
					<li data-icon="delete"><a href="#" data-rel="close">메뉴끄기</a></li>
					<li><a href="#page9">율동공원</a></li>
					<li><a href="#page10">중앙공원</a></li>
					<li><a href="#page11">탄천</a></li>
					<!-- <li><a href="#page12">페이지12</a></li> -->
					
				</ul>
			</div>
			
			<div data-role="panel" id="panel<%=4+(p-1)*5%>" data-display="overlay">
				<ul data-role="listview">
					<li data-icon="delete"><a href="#" data-rel="close">메뉴끄기</a></li>
					<li><a href="#page12" id="h">예약하기</a></li>
					<!-- <li><a href="#page14">페이지14</a></li>
					<li><a href="#page15">페이지15</a></li>
					<li><a href="#page16">페이지16</a></li>
					<li><a href="#page17">페이지17</a></li> -->
				</ul>
			</div>
			
			<div data-role="panel" id="panel<%=5+(p-1)*5%>" data-display="overlay">
				<ul data-role="listview">
					<li data-icon="delete"><a href="#" data-rel="close">메뉴끄기</a></li>
					<li><a href="#page13" id="notice">공지사항</a></li>
					<li><a href="#page14" id="review">이용후기</a></li>
					<!-- <li><a href="#page19">페이지19</a></li>
					<li><a href="#page20">페이지20</a></li>
					<li><a href="#page21">페이지21</a></li>
					<li><a href="#page22">페이지22</a></li>
					<li><a href="#page23">페이지23</a></li> -->
				</ul>
			</div>
		
		<div data-role="header">
				<a href="#page1" data-icon="home" class="ui-btn-left">홈</a>
				<h1>조아 리조트</h1>
		</div>
		<div data-role="content" id="contentArea"><!-- 콘텐츠 시작 -->
		
			<%
			switch(p)
			{
			case 1://홈
			%>
				<a href="#page2" data-role="button" data-inline="true">조아리조트 </a>
				<a href="#page5" data-role="button" data-inline="true">예약하기</a>
				<a href="#page14" data-role="button" data-inline="true">공지사항</a>
				<a href="#page12" data-role="button" data-inline="true">예약하기</a>
			<%
			break;
			case 2://조아리조트 소개
			
			%>
			
				페이지<%=p%><br>
				<h1>조아리조트</h1>
				<a href="#" data-role="button" data-inline="true">로그인 패널</a>
				<a href="#" data-role="button" data-inline="true">메뉴 패널</a>
				<a href="#" data-role="button" data-inline="true">메모 패널</a>
				
			<%
			break;
			
			case 3: //VIP룸
			%>
				페이지<%=p%><br>
				<h1>VIP룸</h1>
				<img src="images/VIPRoom.jpg" width=100% height=300px />
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				VIP룸은 아늑한 공간가림과 열림의 공간미를 지닌 대청마루 중첩구조 속에서<br>
				 편안함을 느낄 수 있는 아주 큰 객실입니다.
				</p>
				 
				<table class="viptable">
					<tr><td class="fieldtd">체크인</td><td class="normaltd">15:00</td><td class="fieldtd">체크아웃</td><td class="normaltd">11:00</td></tr>
					<tr><td class="fieldtd">기준인원</td><td class="normaltd">12명</td><td class="fieldtd">최대 인원</td><td class="normaltd">18명</td></tr>
					<tr><td class="fieldtd">객실 구성</td><td class="normaltd">룸2+욕실2</td><td class="fieldtd">객실 면적</td><td class="normaltd">853.32m</td></tr>
					<tr><td class="fieldtd">객실 수</td><td class="normaltd">10실</td><td class="fieldtd"></td><td class="normaltd"></td></tr>
				</table>
				
			<%
			break;
			case 4://일반룸 페이지
			%>
				페이지<%=p%><br>
				<h1>일반룸</h1>
				<img src="images/NormalRoom.jpg" width=100% height=300px />
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				일반룸은 아늑한 공간가림과 열림의 공간미를 지닌 대청마루 중첩구조 속에서 편안함을 느낄 수 있는 원룸형 더블 베드 객실입니다.
				</p>
				 
				<table class="viptable">
					<tr><td class="fieldtd">체크인</td><td class="normaltd">15:00</td><td class="fieldtd">체크아웃</td><td class="normaltd">11:00</td></tr>
					<tr><td class="fieldtd">기준인원</td><td class="normaltd">2명</td><td class="fieldtd">최대 인원</td><td class="normaltd">6명</td></tr>
					<tr><td class="fieldtd">객실 구성</td><td class="normaltd">원룸(더블)+욕실</td><td class="fieldtd">객실 면적</td><td class="normaltd">55.32m</td></tr>
					<tr><td class="fieldtd">객실 수</td><td class="normaltd">10실</td><td class="fieldtd"></td><td class="normaltd"></td></tr>
				</table>
				
			<%
			break;
			case 5://합리적인 룸페이지
				%>
				페이지<%=p%><br>
				<h1>합리적인 룸</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
					합리적인룸은 아늑한 공간가림과 열림의 공간미를 지닌 대청마루 중첩구조 속에서 편안함을 느낄 수 있는 원룸형 객실입니다.
				</p>
				 
				<table class="viptable">
					<tr><td class="fieldtd">체크인</td><td class="normaltd">15:00</td><td class="fieldtd">체크아웃</td><td class="normaltd">11:00</td></tr>
					<tr><td class="fieldtd">기준인원</td><td class="normaltd">2명</td><td class="fieldtd">최대 인원</td><td class="normaltd">4명</td></tr>
					<tr><td class="fieldtd">객실 구성</td><td class="normaltd">원룸+욕실</td><td class="fieldtd">객실 면적</td><td class="normaltd">면적 : 45.32m</td></tr>
					<tr><td class="fieldtd">객실 수</td><td class="normaltd">10실</td><td class="fieldtd"></td><td class="normaltd"></td></tr>
				</table>
				<%
			break;
			case 6:
				%>
				페이지<%=p%><br>
				<h1>지하철 이용</h1>
				서현역 2번출구에서 도보로 10분거리
				
				<%
				break;
			case 7:
				%>
				페이지<%=p%><br>
				<h1>버스 이용</h1>
				101번 버스를 이용
				
				<%
				break;
			case 8:
				%>
				페이지<%=p%><br>
				<h1>자가용 이용</h1>
				분당수서로에서 옮
				
				<%
				break;
			case 9:
				%>
				페이지<%=p%><br>
				<h1>율동공원</h1>
				<img src="images/Yuldongpark.jpg" width=100% height=300px />
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				성남시에서 1999년 12월 26일부터 토지매입비 181억9천5백만원, <br>
				시설비 146억8천만원, 기타 16억4천 1백만원 등 총 345억1천6백만원의 사업비를 들여 조성하였으며, <br>
				1999년 8월 30일에 완공 및 개원하였다. 실제 공원은 율동과 분당동에 걸쳐 있으며, <br>
				성남시의 대형 근린공원으로써 많은 시민들이 찾는 명소로 자리잡고 있다. <br>
				</p>
				<%
				break;
			case 10:
				%>
				페이지<%=p%><br>
				<h1>중앙공원</h1>
				<img src="images/CentralPark.jpg" width=100% height=300px />
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				성남중앙공원은 높이 413.5m의 영장산(靈長山) 자락에 위치해 있으며 <br>
				본래의 지형과 수림을 최대한 살리고 향토 수종을 새로 심어 자연스러운 경관을 연출하였다. <br>
				영화와 방송 물론 광고 촬영 장소로도 이름이 나 있으며, 일본과 타이완 등 국외에서도 견학을 온다고 한다. <br>
				시민이 쉽게 접근하여 이용할 수 있도록 공원 주변의 아파트단지와 연결된 육교 4개를 설치하였다. <br>
				육교는 계단이 없어 휠체어로도 통행할 수 있게 만들었으며 시각장애인용 점자블록도도 시설되어 있다. <br>
				</p>
				<%
				break;
			case 11:
				%>
				페이지<%=p%><br>
				<h1>탄천</h1>
				<img src="images/tan_river.jpg" width=100% height=300px />
				<p id="text_content"><!-- 글귀를 적는 곳 -->
					탄천(炭川)은 한강의 지류로서 경기도 용인시 기흥구에서 발원하여 성남시를 거쳐, <br>
					서울특별시의 강남구 삼성동과 송파구 잠실동을 끝으로 한강으로 유입되는 총연장 35.6km의 하천이다.<br>

					서울 지하철 2호선의 종합운동장역~삼성역 사이의 구간에 탄천이 있고 2015년 개통된 서울 지하철 9호선의 봉은사역~종합운동장역 사이의 구간, <br>
					서울 지하철 3호선의 수서역~경찰병원역 사이의 구간, 수도권 전철 분당선의 수서역~복정역 사이의 구간이 관통한다.<br>
				</p>
				<%
				break;
			case 12:
				%>
				페이지<%=p%><br>
			
				<h1>예약하기</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
					탄천(炭川)은 한강의 지류로서 경기도 용인시 기흥구에서 발원하여 성남시를 거쳐, <br>
					서울특별시의 강남구 삼성동과 송파구 잠실동을 끝으로 한강으로 유입되는 총연장 35.6km의 하천이다.<br>

					서울 지하철 2호선의 종합운동장역~삼성역 사이의 구간에 탄천이 있고 2015년 개통된 서울 지하철 9호선의 봉은사역~종합운동장역 사이의 구간, <br>
					서울 지하철 3호선의 수서역~경찰병원역 사이의 구간, 수도권 전철 분당선의 수서역~복정역 사이의 구간이 관통한다.<br>
				</p>
				<%
				break;
			case 13:
				%>
				페이지<%=p%><br>
				<h1>공지사항</h1>
				<a href="#" data-role="button" data-inline="true">로그인 패널</a>
				<a href="#" data-role="button" data-inline="true">메뉴 패널</a>
				<a href="#" data-role="button" data-inline="true">메모 패널</a>
				<%
				break;
			case 14:
				%>
				페이지<%=p%><br>
				<h1>이용후기</h1>
		<!-- 		<a href="#" data-role="button" data-inline="true">로그인 패널</a>
				<a href="#" data-role="button" data-inline="true">메뉴 패널</a>
				<a href="#" data-role="button" data-inline="true">메모 패널</a> -->
				<%
				break;
			case 15:
				%>
				페이지<%=p%><br>
				<h1>조회</h1>
			
				<%
				break;
			default:
				%>
				페이지<%=p%>
				<%
				break;
			}
			
			%>
		</div><!--  콘텐츠 끝 -->
		
	
		<div data-role="footer" data-position="fixed" data-id="footerid" data-inline="true">
			<!-- data-position=fixed를 하면 가운데를 눌러도 안꺼짐 -->
			<div data-role="navbar" data-maxbutton="5" data-morebutton="true">
			    <ul>
			        <li><a href="#panel<%=1+(p-1)*5%>" data-icon="bullets">조아리조트</a></li><!-- 조아리조트 패널 소환 -->
			        <li><a href="#panel<%=2+(p-1)*5%>" data-icon="search">찾아오시는 길</a></li><!-- 찾아오시는 길 패널 소환 -->
			        <li><a href="#panel<%=3+(p-1)*5%>" data-icon="grid">주변여행지</a></li><!-- 주변여행지 패널 소환 -->
			        <li><a href="#panel<%=4+(p-1)*5%>" data-icon="info">조아리조트 소식</a></li><!-- 조아리조트 소식 패널 소환 -->
			        <li><a href="#panel<%=5+(p-1)*5%>" data-icon="plus">예약하기</a></li><!-- 예약하기 패널 소환 -->
			    </ul>
			</div><!-- /navbar -->
		</div>
</div>
	
		<% 
		
	} //for문 끝
%>


</body>
</html>