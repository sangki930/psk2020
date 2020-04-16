<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>반응형 드롭다운</title>
<link rel="stylesheet" type="text/css" href="Responsive_dropdown.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" 
integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
.z{
	z-index: 30;
}
</style>
</head>
<body>
	 <header id="idheader">
		<div id="logo"><a href="index.jsp" id="ahome">조아리조트</a></div>
		<nav id="header_nav">
			<ul id="lists">
				<li><a href="index.jsp">Home</a></li>
				<li class="sub-menu"><a href="#">리조트소개</a>
					<ul class="z">
						<li class="z"><a href="a_01.jsp">조아리조트</a></li>
						<li class="z"><a href="a_01_test.jsp">VIP룸</a></li>
						<li class="z"><a href="a_02_test.jsp">일반룸</a></li>
						<li class="z"><a href="a_03_test.jsp">합리적인룸</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">찾아오기</a>
					<ul class="z">
						<li><a href="b_01.jsp">조아리조트 위치</a></li>
						<li><a href="b_02.jsp">버스 이용</a></li>
						<li><a href="b_03.jsp">자가용 이용</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">주변여행지</a>
					<ul class="z">
						<li class="z"><a href="c_01.jsp">율동공원</a></li>
						<li class="z"><a href="c_02.jsp">중앙공원</a></li>
						<li class="z"><a href="c_03.jsp">탄천</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">예약하기</a>
					<ul class="z">
						<li class="z"><a href="d_01.jsp">예약현황</a></li>
						<li class="z"><a href="d_01_resvform.jsp">예약하기</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">팬션소식</a>
					<ul class="z">
						<li class="z"><a href="e_01.jsp">공지사항</a></li>
						<li class="z"><a href="e_02.jsp">이용후기</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="menu-toggle"><i class="fa fa-bars" aria-hidden="true"></i></div>
	</header>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		/* $(document).ready(function(){ */
			$('.menu-toggle').click(function(){
				$('#header_nav').toggleClass('active_nav');
				
			/* 	 if ($("#header_nav").hasClass("active_nav")===true) {
					 $("#header_nav").addClass("active_nav z");
				    } else {
				    	 $("#header_nav").removeClass("active_nav");
				    	 $("#header_nav").delay(600).removeClass("z");
				    } */
			});
			$('ul li').click(function(){
				$(this).siblings().removeClass('active_nav');
				$(this).delay(600).removeClass('z');
				$(this).toggleClass('active_nav');
			});
		/* }); */
	</script>
</body>
</html>