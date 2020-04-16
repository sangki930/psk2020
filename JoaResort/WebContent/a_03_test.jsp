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
<title>Tab Content 만들기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
*{/*전체*/
	padding : 0; /* 패딩이 0 */
	margin : 0; /*여백이 0*/
	font-family : 'Nanum Gothic';/*폰트 설정*/
}
#hero{
	width : 80%;
	/* height : 450px; */
	height : 700px;
	position : relative;
	margin : 100px auto;
	overflow : hidden;
}
#btn-box{
	display : flex;/* 버튼 배치 flex*/
	border-bottom : 1px solid #ccc;
	/*하단 테두리 :  1px 색깔은 #ccc*/
}
#btn-box .btn{/*btn-box 클래스와 button 조건을 만족하면*/
	background : transparent; /*배경은 투명*/
	border : none; /* 테두리 삭제(none)*/
	outline : none;/* 테두리 외선 삭제(none)*/
	cursor : pointer; /* 커서를 포인터형으로*/
	padding : 14px 16px; /* 위 아래 패딩 각각 14px 46px*/
	margin-right : 50px;/* 우단 여백 50px*/
	font-size : 20px; /*폰트 크기*/
	font-weight : bold; /*폰트 굵기*/
}
#btn-box .fa{/* 버튼박스에 있는 아이콘 설정*/
	margin-right : 20px; /*우단 여백 : 20px*/
}
#btn-box .btn:hover .fa{/*해당 아이콘에 커서를 올려놓았을 때*/
	color : #ff7846;/* 색 설정*/
}
.room_content_right .image{
	width : 350px;/* 이미지의 가로 크기 350px*/
}

.room_content{ /*room 설명이 있는 곳*/
	display : flex;
	justify-content : center;
	flex-direction :  row;
	/*justify-content 속성 :  '진행 축'정렬과 아이템 사이의 간격을 제어*/
	/*여기서는 center로 설정*/
	align-items : center;/*아이템 배치: 가운데 정렬*/
	text-align : center;/* 텍스트 정렬 : 가운데 정렬*/
	margin : 5% auto; /*위 5% , 아래는 자동*/
	position :  absolute; /* 절대 위치*/
	transform : translateX(3000px);/*X축을 따라 100% 이동*/
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
.room_content_left .resv{/*room_content_left의 왼쪽 a태그 설정*/
	
	width : 150px; /*가로 150px*/
	display : block; /* 블록형(요소를 앞뒤로 줄바꿈)으로 배치 */
	padding : 8px 5px;/*위 아래 여백 각각 8,5*/ 
	border-radius : 20px;/* 타원형으로 만듦*/
	text-decoration : none;/* 글자 꾸미기 없음*/
	background-color : #ff7846;/*a태그 배경색 설정*/
	color : #fff;/*a태그 글자 색 설정*/
	text-align : center;/*가운데정렬*/
}
.room_content_right{/*우단 콘텐츠 설정*/
	flex-basis : 50%;/*최초 크기*/
	text-align : center;/*가운데 정렬*/
}
.viptable{
	
	border-top : 1px solid #444444; 
	border-collapse : collapse;

}
.fieldtd{
	background-color : lightgray;
	border-bottom : 1px solid #444444; 
	width : 100px;
	padding : 5px;
}
.normaltd{
	width : 175px;
	padding : 5px;
	border-bottom : 1px solid #444444;

}

#room_content3{/*VIP룸 부분 설정*/
		/*VIP룸이 최초 화면이다.*/
	transform : translateX(0px);
}
#btn3{/*최초 화면이 VIP룸이므로*/
	color : #ff7846;
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
		<div id="btn-box"><!-- 버튼 박스 구역 -->
			<button id="btn1" class="btn" onclick="openVIP()"><i class="fa fa-html5"></i>VIP룸</button>
			<button id="btn2" class="btn" onclick="openNormal()"><i class="fa fa-css3"></i>일반룸</button>
			<button id="btn3" class="btn" onclick="openLite()"><i class="fa fa-codepen"></i>합리적인 룸</button>
		</div><!-- 버튼 박스 구역 끝 -->
		<div id="room_content1" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>VIP룸</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				VIP룸은 아늑한 공간가림과 열림의 공간미를 지닌 대청마루 중첩구조 속에서 편안함을 느낄 수 있는 아주 큰 객실입니다.
				</p>
				 
				<table class="viptable">
					<tr><td class="fieldtd">체크인</td><td class="normaltd">15:00</td><td class="fieldtd">체크아웃</td><td class="normaltd">11:00</td></tr>
					<tr><td class="fieldtd">기준인원</td><td class="normaltd">12명</td><td class="fieldtd">최대 인원</td><td class="normaltd">18명</td></tr>
					<tr><td class="fieldtd">객실 구성</td><td class="normaltd">룸2+욕실2</td><td class="fieldtd">객실 면적</td><td class="normaltd">면적 : 853.32m</td></tr>
					<tr><td class="fieldtd">객실 수</td><td class="normaltd">10실</td><td class="fieldtd"></td><td class="normaltd"></td></tr>
				</table>
				<br>
				<br>
				<a href="d_01_resvform.jsp" class="resv">예약하기</a>
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="VIPRoom.jpg" class="image"/>
				<p>VIP룸</p>
			</div>
		</div><!-- room_content가 끝나는 곳 -->
		<div id="room_content2" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>일반룸</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				일반룸은 아늑한 공간가림과 열림의 공간미를 지닌 대청마루 중첩구조 속에서 편안함을 느낄 수 있는 원룸형 더블 베드 객실입니다.
				</p>
				 
				<table class="viptable">
					<tr><td class="fieldtd">체크인</td><td class="normaltd">15:00</td><td class="fieldtd">체크아웃</td><td class="normaltd">11:00</td></tr>
					<tr><td class="fieldtd">기준인원</td><td class="normaltd">2명</td><td class="fieldtd">최대 인원</td><td class="normaltd">6명</td></tr>
					<tr><td class="fieldtd">객실 구성</td><td class="normaltd">원룸(더블)+욕실</td><td class="fieldtd">객실 면적</td><td class="normaltd">면적 : 55.32m</td></tr>
					<tr><td class="fieldtd">객실 수</td><td class="normaltd">10실</td><td class="fieldtd"></td><td class="normaltd"></td></tr>
				</table>
				<br>
				<br>
				<a href="d_01_resvform.jsp" class="resv">예약하기</a>
			
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="NormalRoom.webp" class="image"/>
				<p>일반룸</p>
				
			</div>
		</div><!-- room_content가 끝나는 곳 -->
		<div id="room_content3" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
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
				<br>
				<br>
				<a href="d_01_resvform.jsp" class="resv">예약하기</a>
			
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="IrrRoom.jpg" class="image"/>
				<p>합리적인 룸</p>
				
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
				room_content2.style.transform = "translateX(3000px)";
				room_content3.style.transform = "translateX(3000px)";
				//나머지는 안보이게(hidden 설정이 있으므로)
				btn1.style.color = "#ff7846";//btn1의 색깔을 ff7846으로 설정
				btn2.style.color = "#000";//btn2의 색깔을 흰색으로 설정
				btn3.style.color = "#000";//btn3의 색깔을 흰색으로 설정
			}
		function openNormal(){//일반룸 열기
			room_content1.style.transform = "translateX(3000px)";
			//translateX(0)이라는 것은 해당 방 정보만 보이게 한다.
			room_content2.style.transform = "translateX(0)";
			room_content3.style.transform = "translateX(3000px)";
			//나머지는 안보이게(hidden 설정이 있으므로)
			btn2.style.color = "#ff7846";//btn2의 색깔을 ff7846으로 설정
			btn1.style.color = "#000";//btn1의 색깔을 흰색으로 설정
			btn3.style.color = "#000";//btn3의 색깔을 흰색으로 설정
		}
		function openLite(){//합리적인 룸 열기
			room_content1.style.transform = "translateX(3000px)";
			//translateX(0)이라는 것은 해당 방 정보만 보이게 한다.
			room_content2.style.transform = "translateX(3000px)";
			room_content3.style.transform = "translateX(0)";
			//나머지는 안보이게(hidden 설정이 있으므로)
			btn3.style.color = "#ff7846";//btn3의 색깔을 ff7846으로 설정
			btn1.style.color = "#000";//btn1의 색깔을 흰색으로 설정
			btn2.style.color = "#000";//btn2의 색깔을 흰색으로 설정
		}
		
	</script>
	<jsp:include page="footer.jsp" flush="false"> 
	<jsp:param value="list" name="menu"/>
	</jsp:include>
</body>
</html>