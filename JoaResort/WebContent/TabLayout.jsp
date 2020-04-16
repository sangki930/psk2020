<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	color : #ff7846;/* 색 설정*/
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
	transform : translateX(100%);/*X축을 따라 100% 이동*/
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
	background-color : #ff7846;/*a태그 배경색 설정*/
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
	color : #ff7846;
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

	<div id="hero"><!-- hero에 들어갈 id 지정 -->
		<div class="btn-box"><!-- 버튼 박스 구역 -->
			<button id="btn1" class="btn" onclick="openVIP()"><i class="fa fa-html5"></i>VIP룸</button>
			<button id="btn2" class="btn" onclick="openNormal()"><i class="fa fa-css3"></i>일반룸</button>
			<button id="btn3" class="btn" onclick="openLite()"><i class="fa fa-codepen"></i>합리적인 룸</button>
		</div><!-- 버튼 박스 구역 끝 -->
		<div id="room_content1" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>VIP룸</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				객실은 모두 금연입니다.
				최대정원 이상 입실 불가합니다.
				조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.
				클린형은 취사가 불가합니다.
				어메니티 추가 시 유료제공됩니다. (5,000원 / 1 세트) ※ 3월 1일부
				타월 추가 시 페이스타월 1장당 500원 추가됩니다. ※ 3월 1일부 1장당 1,000원
				</p>
				<a href="#" id="resv">클릭 ㄱㄱ</a>
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="VIPRoom.jpg" class="image"/>
				<p>면적 : 853.32m</p>
				
			</div>
		</div><!-- room_content가 끝나는 곳 -->
		<div id="room_content2" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>일반룸</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				객실은 모두 금연입니다.
				최대정원 이상 입실 불가합니다.
				조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.
				클린형은 취사가 불가합니다.
				어메니티 추가 시 유료제공됩니다. (5,000원 / 1 세트) ※ 3월 1일부
				타월 추가 시 페이스타월 1장당 500원 추가됩니다. ※ 3월 1일부 1장당 1,000원
				</p>
				<a href="#" id="resv">클릭 ㄱㄱ</a>
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="VIPRoom.jpg" class="image"/>
				<p>면적 : 853.32m</p>
				
			</div>
		</div><!-- room_content가 끝나는 곳 -->
		<div id="room_content3" class="room_content"><!-- id가 room_content인 구역 -->
			<div class="room_content_left"><!-- 왼쪽 div -->
				<h1>합리적인 룸</h1>
				<p id="text_content"><!-- 글귀를 적는 곳 -->
				객실은 모두 금연입니다.
				최대정원 이상 입실 불가합니다.
				조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.
				클린형은 취사가 불가합니다.
				어메니티 추가 시 유료제공됩니다. (5,000원 / 1 세트) ※ 3월 1일부
				타월 추가 시 페이스타월 1장당 500원 추가됩니다. ※ 3월 1일부 1장당 1,000원
				</p>
				<a href="#" id="resv">클릭 ㄱㄱ</a>
			</div><!-- room_content_left가 끝나는 곳 -->
			<div class="room_content_right">
				<img src="VIPRoom.jpg" class="image"/>
				<p>면적 : 853.32m</p>
				
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
				room_content2.style.transform = "translateX(100%)";
				room_content3.style.transform = "translateX(100%)";
				//나머지는 안보이게(hidden 설정이 있으므로)
				btn1.style.color = "#ff7846";//btn1의 색깔을 ff7846으로 설정
				btn2.style.color = "#000";//btn2의 색깔을 흰색으로 설정
				btn3.style.color = "#000";//btn3의 색깔을 흰색으로 설정
			}
		function openNormal(){//일반룸 열기
			room_content1.style.transform = "translateX(100%)";
			//translateX(0)이라는 것은 해당 방 정보만 보이게 한다.
			room_content2.style.transform = "translateX(0)";
			room_content3.style.transform = "translateX(100%)";
			//나머지는 안보이게(hidden 설정이 있으므로)
			btn2.style.color = "#ff7846";//btn2의 색깔을 ff7846으로 설정
			btn1.style.color = "#000";//btn1의 색깔을 흰색으로 설정
			btn3.style.color = "#000";//btn3의 색깔을 흰색으로 설정
		}
		function openLite(){//합리적인 룸 열기
			room_content1.style.transform = "translateX(100%)";
			//translateX(0)이라는 것은 해당 방 정보만 보이게 한다.
			room_content2.style.transform = "translateX(100%)";
			room_content3.style.transform = "translateX(0)";
			//나머지는 안보이게(hidden 설정이 있으므로)
			btn3.style.color = "#ff7846";//btn3의 색깔을 ff7846으로 설정
			btn1.style.color = "#000";//btn1의 색깔을 흰색으로 설정
			btn2.style.color = "#000";//btn2의 색깔을 흰색으로 설정
		}
		
	</script>
</body>
</html>