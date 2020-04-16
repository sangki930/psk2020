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
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<title>조아리조트에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Compiled and minified CSS -->
<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> -->

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
	height : 100px;
	background-color : yellow;
	position : relative;
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
 #map {
        height: 60%;
        width: 60%;
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


<div id="wrap" class="wrap">
<form method=post>
 
  <header><br><br><h2>조아리조트 위치</h2></header>
  <br>
  <hr>
  <div class="content">
  	<div class="aside">
  	</div>
  
  	<div class="main">
	  		<div class="main_content">
	  			<h3>조아리조트의 위치는 이곳입니다.</h3>
	      	<br><br>
	  		</div>
	  		<div id="map">
					  <script>
					    
					    var lat = 37.3860521;
					    	var longti= 127.1214038;
					    
					      function initMap() {
					        var joaResort = new google.maps.LatLng(lat, longti);
								//joaResort라는 객체 선언
					        var map = new google.maps.Map(document.getElementById('map'), {
					          center: joaResort,
					          zoom: 15
					        });
					
					        var coordInfoWindow = new google.maps.InfoWindow();
					        coordInfoWindow.setContent(createInfoWindowContent(joaResort, map.getZoom()));
					        coordInfoWindow.setPosition(joaResort);
					        coordInfoWindow.open(map);
					
					        map.addListener('zoom_changed', function() {
					          coordInfoWindow.setContent(createInfoWindowContent(joaResort, map.getZoom()));
					          coordInfoWindow.open(map);
					        });
					      }
					
					      var TILE_SIZE = 256;
					
					      function createInfoWindowContent(latLng, zoom) {
					        var scale = 1 << zoom;
					
					        var worldCoordinate = project(latLng);
					
					        var pixelCoordinate = new google.maps.Point(
					            Math.floor(worldCoordinate.x * scale),
					            Math.floor(worldCoordinate.y * scale));
					
					        var tileCoordinate = new google.maps.Point(
					            Math.floor(worldCoordinate.x * scale / TILE_SIZE),
					            Math.floor(worldCoordinate.y * scale / TILE_SIZE));
					
					        /*
					        return [
					          'Chicago, IL',
					          'LatLng: ' + latLng,
					          'Zoom level: ' + zoom,
					          'World Coordinate: ' + worldCoordinate,
					          'Pixel Coordinate: ' + pixelCoordinate,
					          'Tile Coordinate: ' + tileCoordinate
					        ].join('<br>');
					        */
					        return [
					            '조아리조트',
					            '위도: ' + lat,
					            '경도: ' + longti,
					            'Zoom level: ' + zoom,
					          ].join('<br><br>');
					        //join : 배열 중간에 '<br>'을 삽입
					        
					      }
					
					      // The mapping between latitude, longitude and pixels is defined by the web
					      // mercator projection.
					      function project(latLng) {
					        var siny = Math.sin(latLng.lat() * Math.PI / 180);
					
					        // Truncating to 0.9999 effectively limits latitude to 89.189. This is
					        // about a third of a tile past the edge of the world tile.
					        siny = Math.min(Math.max(siny, -0.9999), 0.9999);
					
					        return new google.maps.Point(
					            TILE_SIZE * (0.5 + latLng.lng() / 360),
					            TILE_SIZE * (0.5 - Math.log((1 + siny) / (1 - siny)) / (4 * Math.PI)));
					      }
					    </script>
					    <script async defer
					    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_e-W237WxWJmJFw4MjdooNs_3Rj7hGR0&callback=initMap">
					    </script>
				
				</div>
 				<div>
 					<p>
 					</p>
 				</div>
		</div>
  	</div>
</div>
</form>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<jsp:include page="footer.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>
</body>
</html>