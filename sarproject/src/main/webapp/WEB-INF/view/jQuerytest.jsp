<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1.0">
<title>Document</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){//문서가 완성되면 버튼을 가져옴
		$("button").click(function(){
				$("p").hide();
			});
		});
</script>
</head>
<body>
	<p>메시지 : 제이쿼리 테스트 </p>
	<button>메시지 삭제</button>
</body>
</html> -->

<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {//문서가 완성되면 버튼을 가져옴
		$("button.hide").click(function() {
			$("p").hide();
		});
		$("button.show").click(function() {
			$("p").show();
		});
	});
</script>
</head>
<body>
	<p>문서 준비 이벤트에는 여러 다중 이벤트를 정의할 수 있습니다.</p>
	<p>버튼을 클릭하면 이벤트 처리를 합니다.</p>
	<button class="hide">메시지 보기</button>
	<button class="show">메시지 감춤</button>
</body>
</html> -->

<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {//문서가 완성되면 버튼을 가져옴
		$("ans").hide();
		$("p.q1").click(function() {
			$("ans.q1").show();
		});
		$("ans.q1").click(function() {
			$(this).hide();
		});
		$("p.q2").click(()=> {
			$("ans.q2").show();
		});
		$("ans.q2").click(function() {
			$(this).hide();
		});

	});
</script>
</head>
<body>
	<h2>질문1 : 대한민국의 수도는 어디입니까?</h2>
    <p class="q1">[정답 보기]</p>
    <ans class="q1">대한민국의 수도는 <strong>서울</strong>입니다.</ans>
    <br></br>
    <h2>질문2 : 대한민국의 국보1호는 무엇입니까?</h2>
    <p class="q2">[정답 보기]</p>
    <ans class="q2">대한민국의 국보1호는 <strong>숭례문</strong>입니다.</ans2>

</body>
</html> -->

<!-- 마우스 이벤트 -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var n=0;
	$(document).ready(function(){//문서가 완성되면 버튼을 가져옴
		$("div.out").mouseenter(function(){
				$("p:first",this).text("마우스 포인트 들어옴");
				$("p:last",this).text(++n);
				
			});

	});
</script>
<style>
div.out {
	width: 200px;
	height: 100px;
	border: 1px solid #000000;
	text-align: center;
	background-color: yellow;
}
</style>

</head>
<body>
	<div class="out">
		<p>마우스 이벤트 알아보기</p>
		<p>0</p>
	</div>
</body>
</html> -->


<!-- mouseleave 실습 -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var n=0;
	$(document).ready(function(){//문서가 완성되면 버튼을 가져옴
		$("div.out").mouseenter(()=>{
				$("p:first",this).text("마우스 포인트 들어옴");
				$("p:last",this).text(++n);
				
			});
		$("div.out").mouseleave(()=>{
			$("p:first",this).text("마우스 포인트 들어옴");
			$("p:last",this).text("최종 횟수 : " + n);
			
		});

	});
</script>
<style>
div.out {
	width: 200px;
	height: 100px;
	border: 1px solid #000000;
	text-align: center;
	background-color: yellow;
}
</style>

</head>
<body>
	<div class="out">
		<p>마우스 이벤트 알아보기</p>
		<p>0</p>
	</div>
</body>
</html> -->
<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var n=0;
	$(document).ready(function(){//문서가 완성되면 버튼을 가져옴
		$("div.out").mouseenter(()=>{
				$("p:first",this).text("마우스 포인트 들어옴");
				$("p:last",this).text(++n);
				
			});
		$("div.out").mouseleave(()=>{
			$("p:first",this).text("마우스 포인트 들어옴");
			$("p:last",this).text("최종 횟수 : " + n);
			
		});
		$("div.out").mousedown(()=>{//마우스를 누르고 있을 때
			$("p:first",this).hide();
			$("p:last",this).text("메시지 사라짐");
			
			});
		$("div.out").mouseup(()=>{
			$("p:first",this).show();
			$("p:last",this).text("최종 횟수 : "+n);
			
			});

	});
</script>
<style>
div.out {
	width: 200px;
	height: 100px;
	border: 1px solid #000000;
	text-align: center;
	background-color: yellow;
}
</style>

</head>
<body>
	<div class="out">
		<p>마우스 이벤트 알아보기</p>
		<p>0</p>
	</div>
</body>
</html> -->

<!-- addclass, removeclass -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var n=0;
	$(document).ready(function(){//문서가 완성되면 버튼을 가져옴
		$("button.add").click(()=>{
			$("h1,h2,p").addClass("blue");
			$("div").addClass("important");
		});
		$("button.remove").click(()=>{
			$("h1,h2,p").removeClass("blue");
			$("div").removeClass("important");
		});

	});
</script>
<style>
.important {
	font-weight: bold;
	font-size: xx-large;
}
.blue {
	color: blue;
}
</style>

</head>
<body>
	<h1>HTML5</h1>
	<h2>CSS3</h2>
	<p>자바스크립트</p>
	<div>제이쿼리</div>
	<br>
	<button class="add">CSS 적용</button>
	<button class="remove">CSS 적용 해제</button>
</body>
</html> -->


<!-- toggleclass -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var n=0;
	$(document).ready(function(){//문서가 완성되면 버튼을 가져옴
		$("button").click(()=>{
			$("h1,h2,p,div").toggleClass("red");
		});

	});
</script>
<style>
.red {
	color: red;
	border: 1px solid blue;
}
</style>
</head>
<body>
	<h1>HTML5</h1>
	<h2>CSS3</h2>
	<p>자바스크립트</p>
	<div>제이쿼리</div>
	<br>
	<button>CSS 적용/해제</button>
</body>
</html> -->

<!-- css실습 -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var n = 0;
	$(document).ready(function() {//문서가 완성되면 버튼을 가져옴
		$("button").click(function() {
			$("p").css({
				"background-color" : "yellow",
				"font-size" : "200%"
			});

		})

	});
</script>
<style>
.red {
	color: red;
	border: 1px solid blue;
}
</style>
</head>
<body>
	<p>김길동</p>
	<div>02-123-4567</div>
	<p>이길동</p>
	<div>042-567-2929</div>
	<p>홍길동</p>
	<div>051-278-9485</div>
	<br>
	<br>
	<button>이름 강조</button>

</body>
</html> -->

<!-- css 스타일 변경 -->
<!-- <html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {//문서가 완성되면 버튼을 가져옴
		/* $("button").click(function() {
			$("p").css({
				"background-color" : "yellow",
				"font-size" : "200%"
			});

		}); */
		var xWidth = 100;
		var yHeight = 100;

		$("div").click(function() {
			$(this).width(xWidth).addClass("box");
			$(this).height(yHeight).addClass("box");
			xWidth -= 10;
			yHeight -= 10;
		});

	});
</script>
<style>
div {
	width: 100px;
	height: 100px;
	float: left;
	margin: 5px;
	background: yellow;
}

.box {
	background: red;
}
</style>

</head>
<body>
	<div>박스1</div>
	<div>박스2</div>
	<div>박스3</div>
	<div>박스4</div>
	<div>박스5</div>
</body>
</html> -->

<!-- animate 실습 -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {//문서가 완성되면 버튼을 가져옴

		$("button.b1").click(function() {
			$("img").animate({
				width : '100px'
			});
		});
		$("button.b2").click(function() {
			$("img").animate({
				width : '200px'
			});
		});
		$("button.b3").click(function() {
			$("img").animate({
				width : '300px'
			});
		});
	});
</script>
<style>
.css_pic {
	height: 430px;
	text-align: center;
}

.css_pic img {
	width: 250px;
}
</style>
</head>
<body>
	<div class="css_pic">
		버튼을 누르면 그림의 크기가 바뀝니다.
		</p>
		<button class="b1">가로 100픽셀</button>
		<button class="b2">가로 200픽셀</button>
		<button class="b3">가로 300픽셀</button>
		<br> <br> <img name="pic1" src="/static/pic1.jpg" />
	</div>
	
</body>
</html> -->

<!-- 확대 축소 실습 -->
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$("button.move").click(function() {
			$("img").animate({
				left : '300px',
				height : '300px',
				width : '350px'
			});
		});
		$("button.init").click(function() {
			$("img").animate({
				left : '0px',
				height : '100px',
				width : '130px'
			});
		});
	});
</script>
<style>
.css_pic {
	height: 430px;
	text-align: center;
}

.css_pic img {
	width: 250px;
}
</style>
</head>
<body>
	<button class="move">확대</button>
	<button class="init">축소</button>
	<p></p>
	<img name="pic1"
		src="${pageContext.request.contextPath}/static/pic1.jpg" width="130"
		height="100" style="position: relative" />
</body>
</html> --%>

<!-- show,hide,toggle -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$("#hide").click(function() {
			$("img").hide("slow");
		});
		$("#show").click(function() {
			$("img").show("fast");
		});
		$("#toggle").click(function() {
			$("img").toggle(3000);
		});
	});
</script>
</head>
<body>
    <button id="hide">hide</button>
    <button id="show">show</button>
    <button id="toggle">toggle</button>
    <p></p>
    <img name="pic1" src="/static/pic1.jpg"/>
</body>

</html> -->


<!-- fade 실습 -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {

		$("#out").click(function(){
		$("img").fadeOut("slow");
			});
		$("#in").click(function(){
			$("img").fadeIn("slow");
				});
		$("#toggle").click(function(){
			$("img").fadeToggle("slow");
				});
		$("#to50").click(function(){
			$("img").fadeTo("slow",0.5);
				});
		$("#to10").click(function(){
			$("img").fadeTo("slow",0.5);
				});
		$("#to100").click(function(){
			$("img").fadeTo("slow",1.0);
				});
		
	});
</script>
</head>
<body>
	<button id="out">fadeOut</button>
	<button id="in">fadeIn</button>
	<button id="toggle">fadeToggle</button>
	<button id="to50">opacity 50%</button>
	<button id="to10">opacity 90%</button>
	<button id="to100">opacity 0%</button>
	<p></p>
	<img name="pic1" src="/static/pic1.jpg" />

</body>

</html> -->

<!-- slide 관련 -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {

		$("#panel").click(function() {
			$("#panel").slideUp("fast");
		});
		$("#slide").click(function() {
			$("#panel").slideDown(5000);
		});
		$("#flip").click(function() {
			$("#panel").slideToggle("slow");
		});
		$("#stop").click(function() {
			$("#panel").stop();//sliding 동작 도중 멈춤
		});

	});
</script>
<style>
#slide, #panel, #flip {
	padding: 5px;
	text-align: center;
	background-color: #e5eecc;
	border: solid 1px #c3c3c3;
}

#panel {
	padding: 70px;
	display: none;
	background-color: #ffff00;
}
</style>

</head>
<body>
	<div id="slide">[오늘의 공지사항]</div>
	<div id="panel">
		오늘은 jQuery 프로그램을 학습합니다.<br> 예제를 작성한 후 실행해보세요.
	</div>
	<div id="flip">Toggle slide</div>
	<p></p>
	<button id="stop">Stop sliding</button>


</body>

</html> -->

<!--  메소드 체이닝1 -->
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#slide").click(
						function() {
							$("#panel").css("color", "red").slideDown(2000)
									.slideUp(6000).fadeTo("slow", 0.3);
						});
			});
</script>
<style>
#slide, #panel {
	padding: 5px;
	text-align: center;
	background-color: #e5eecc;
	border: solid 1px #c3c3c3;
}

#panel {
	padding: 50px;
	display: none;
	background-color: #ffff00;
}
</style>

</head>
<body>
	<div id="slide">[오늘의 공지사항]</div>
	<div id="panel">
		오늘은 jQuery 프로그램을 학습합니다.<br>예제를 작성한 후 실행해보세요.
	</div>
</body>

</html> -->

<!-- 메소드 체이닝2 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function move(obj, time) {
		$(obj).stop().animate({
			left : -350,
			top : 0
		}, time);
	}
	function back(css) {
		$(css).stop().animate({
			left : 0,
			top : 0
		});
	}
</script>
<style>
.moving {
	border: 1px solid #000000;
	margin: 20px auto 0 auto;
	text-align: right;
	width: 550px;
}

.moving img {
	cursor: pointer;
	position: relative;
}
</style>
</head>
<body>
	<div class="init">
		<button type="button" onclick="back('.moving img')">초기화 상태</button>
		<br>
	</div>
	<div class="moving">
		<img onclick="move(this, 6000)" src="/static/pic1.jpg" /><br> 
		<img onclick="move(this, 3000)" src="/static/pic2.jpg" /><br> 
		<img onclick="move(this, 1000)" src="/static/pic3.jpg" /><br>
	</div>

</body>

</html>