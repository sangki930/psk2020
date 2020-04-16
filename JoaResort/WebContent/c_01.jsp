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
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
*{/*전체*/
	padding : 0; /* 패딩이 0 */
	margin : 0; /*여백이 0*/
	font-family : 'Nanum Gothic';/*폰트 설정*/
}
#hero{
	width : 80%;
	height : 450px;
	position : relative;
	margin : 100px auto;
	overflow : hidden;
}
.btn-box{
	display : flex;/* 버튼 배치 flex*/
	border-bottom : 1px solid #ccc;
	/*하단 테두리 :  1px 색깔은 #ccc*/
}
.btn-box .btn{/*btn-box 클래스와 button 조건을 만족하면*/
	background : transparent; /*배경은 투명*/
	border : none; /* 테두리 삭제(none)*/
	outline : none;/* 테두리 외선 삭제(none)*/
	cursor : pointer; /* 커서를 포인터형으로*/
	padding : 14px 16px; /* 위 아래 패딩 각각 14px 46px*/
	margin-right : 50px;/* 우단 여백 50px*/
	font-size : 20px; /*폰트 크기*/
	font-weight : bold; /*폰트 굵기*/
}
.btn-box .fa{/* 버튼박스에 있는 아이콘 설정*/
	margin-right : 20px; /*우단 여백 : 20px*/
}
.btn-box .btn:hover .fa{/*해당 아이콘에 커서를 올려놓았을 때*/
	color : blue;/* 색 설정*/
}
.room_content_right .image{
	width : 350px;/* 이미지의 가로 크기 350px*/
}

.room_content{ /*room 설명이 있는 곳*/
	display : flex;
	justify-content : center;
	/*justify-content 속성 :  '진행 축'정렬과 아이템 사이의 간격을 제어*/
	/*여기서는 center로 설정*/
	align-items : center;/*아이템 배치: 가운데 정렬*/
	text-align : center;/* 텍스트 정렬 : 가운데 정렬*/
	margin : 5% auto; /*위 5% , 아래는 자동*/
	position :  absolute; /* 절대 위치*/
	transform : translateX(5000px);/*X축을 따라 5000px 이동*/
}
.room_content_left{
	flex-basis : 50%;
	/*flex-basis : 플렉스 아이템의 초기 크기를 지정*/
	/*여기서는 50%*/
	
}
.room_content_left #text_content{
	font-size : 13px; /*폰트 크기 13px로 설정*/
	padding : 30px 0;/*위 아래 여백 각각 30,0*/ 
}
.room_content_left #resv{/*room_content_left의 왼쪽 a태그 설정*/
	
	width : 150px; /*가로 150px*/
	display : block; /* 블록형(요소를 앞뒤로 줄바꿈)으로 배치 */
	padding : 8px 5px;/*위 아래 여백 각각 8,5*/ 
	border-radius : 20px;/* 타원형으로 만듦*/
	text-decoration : none;/* 글자 꾸미기 없음*/
	background-color : blue;/*a태그 배경색 설정*/
	color : #fff;/*a태그 글자 색 설정*/
	text-align : center;/*가운데정렬*/
}
.room_content_right{/*우단 콘텐츠 설정*/
	flex-basis : 50%;/*최초 크기*/
	text-align : center;/*가운데 정렬*/
}
#room_content1{/*VIP룸 부분 설정*/
		/*VIP룸이 최초 화면이다.*/
	transform : translateX(0px);
}
#btn1{/*최초 화면이 VIP룸이므로*/
	color : blue;
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

 function responsive(){
		var w = $(window).width();

		if(w<=768){
			console.log('반응했음');
			$("#btn-box").hide();
			$(".resv").hide();
			$(".room_content").css('flex-direction','column');
			
			}
		else{
			$("#btn-box").show();
			$(".resv").show();
			$(".room_content").css('flex-direction','row');
			$("#hero").css('height','700px');
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

	<div id="hero"><!-- hero에 들어갈 id 지정 -->
		<div class="btn-box"><!-- 버튼 박스 구역 -->
			<button id="btn1" class="btn" onclick="openVIP()"><i class="fa fa-html5"></i>율동공원</button>
			<button id="btn2" class="btn" onclick="openNormal()"><i class="fa fa-css3"></i>중앙공원</button>
			<button id="btn3" class="btn" onclick="openLite()"><i class="fa fa-codepen"></i>탄천</button>
		</div><!-- 버튼 박스 구역 끝 -->
		<div id="room_content1" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>율동공원</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				성남시에서 1999년 12월 26일부터 토지매입비 181억9천5백만원, <br>
				시설비 146억8천만원, 기타 16억4천 1백만원 등 총 345억1천6백만원의 사업비를 들여 조성하였으며, <br>
				1999년 8월 30일에 완공 및 개원하였다. 실제 공원은 율동과 분당동에 걸쳐 있으며, <br>
				성남시의 대형 근린공원으로써 많은 시민들이 찾는 명소로 자리잡고 있다. <br>
				</p>
				<!--  <a href="#" id="resv">클릭 ㄱㄱ</a>-->
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="Yuldongpark.jpg" class="image"/>
				<p>면적 : 853.32m</p>
				
			</div>
		</div><!-- room_content가 끝나는 곳 -->
		<div id="room_content2" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>중앙공원</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				성남중앙공원은 높이 413.5m의 영장산(靈長山) 자락에 위치해 있으며 <br>
				본래의 지형과 수림을 최대한 살리고 향토 수종을 새로 심어 자연스러운 경관을 연출하였다. <br>
				영화와 방송 물론 광고 촬영 장소로도 이름이 나 있으며, 일본과 타이완 등 국외에서도 견학을 온다고 한다. <br>
				시민이 쉽게 접근하여 이용할 수 있도록 공원 주변의 아파트단지와 연결된 육교 4개를 설치하였다. <br>
				육교는 계단이 없어 휠체어로도 통행할 수 있게 만들었으며 시각장애인용 점자블록도도 시설되어 있다. <br>
				</p>
				<!--  <a href="#" id="resv">클릭 ㄱㄱ</a>-->
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="CentralPark.jpg" class="image"/>
				
				
			</div>
		</div><!-- room_content가 끝나는 곳 -->
		<div id="room_content3" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>탄천</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
					탄천(炭川)은 한강의 지류로서 경기도 용인시 기흥구에서 발원하여 성남시를 거쳐, <br>
					서울특별시의 강남구 삼성동과 송파구 잠실동을 끝으로 한강으로 유입되는 총연장 35.6km의 하천이다.<br>

					서울 지하철 2호선의 종합운동장역~삼성역 사이의 구간에 탄천이 있고 2015년 개통된 서울 지하철 9호선의 봉은사역~종합운동장역 사이의 구간, <br>
					서울 지하철 3호선의 수서역~경찰병원역 사이의 구간, 수도권 전철 분당선의 수서역~복정역 사이의 구간이 관통한다.<br>
				</p>
				<!--  <a href="#" id="resv">클릭 ㄱㄱ</a> -->
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="tan_river.jpg" class="image"/>>
				
			</div>
		</div><!-- room_content가 끝나는 곳 -->
	</div><!-- id가 hero인 지점이 끝나는 곳 -->
	
	<script>
		var room_content1 = document.getElementById("room_content1");//id가 room_content1인 것을 가져옴
		var room_content2 = document.getElementById("room_content2");//id가 room_content2인 것을 가져옴
		var room_content3 = document.getElementById("room_content3");//id가 room_content3인 것을 가져옴
		var btn1 = document.getElementById("btn1");//id가 btn1인 것을 가져옴
		var btn2 = document.getElementById("btn2");//id가 btn2인 것을 가져옴
		var btn3 = document.getElementById("btn3");//id가 btn3인 것을 가져옴

		function openVIP(){//VIP룸 열기
				room_content1.style.transform = "translateX(0)";
				//translateX(0)이라는 것은 해당 방 정보만 보이게 한다.
				room_content2.style.transform = "translateX(5000px)";
				room_content3.style.transform = "translateX(5000px)";
				//나머지는 안보이게(hidden 설정이 있으므로)
				btn1.style.color = "blue";//btn1의 색깔을 ff7846으로 설정
				btn2.style.color = "#000";//btn2의 색깔을 흰색으로 설정
				btn3.style.color = "#000";//btn3의 색깔을 흰색으로 설정
			}
		function openNormal(){//일반룸 열기
			room_content1.style.transform = "translateX(5000px)";
			//translateX(0)이라는 것은 해당 방 정보만 보이게 한다.
			room_content2.style.transform = "translateX(0)";
			room_content3.style.transform = "translateX(5000px)";
			//나머지는 안보이게(hidden 설정이 있으므로)
			btn2.style.color = "blue";//btn2의 색깔을 ff7846으로 설정
			btn1.style.color = "#000";//btn1의 색깔을 흰색으로 설정
			btn3.style.color = "#000";//btn3의 색깔을 흰색으로 설정
		}
		function openLite(){//합리적인 룸 열기
			room_content1.style.transform = "translateX(5000px)";
			//translateX(0)이라는 것은 해당 방 정보만 보이게 한다.
			room_content2.style.transform = "translateX(5000px)";
			room_content3.style.transform = "translateX(0)";
			//나머지는 안보이게(hidden 설정이 있으므로)
			btn3.style.color = "blue";//btn3의 색깔을 ff7846으로 설정
			btn1.style.color = "#000";//btn1의 색깔을 흰색으로 설정
			btn2.style.color = "#000";//btn2의 색깔을 흰색으로 설정
		}
		
	</script>
	<jsp:include page="footer.jsp" flush="false"> 
	<jsp:param value="list" name="menu"/>
	</jsp:include>
</body>
</html>