<%@page import="kopo.example.demo.repo.MonitorRepo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*,java.util.*,java.sql.*,javax.servlet.*,javax.sql.*,javax.naming.*" %>
<%@ page import="org.jsoup.nodes.*"%>
<%@ page import="org.jsoup.*"%>
<%@ page import="org.jsoup.Connection" %>
<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="java.net.*,java.io.*,java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20초마다 flag값 순환</title>
<%
	int iauto = 2000;
	String s_url = "scat";
	
	String cflag = request.getParameter("flag");
	
	if(cflag  == null) cflag="0";
	
	int icnt = Integer.parseInt(cflag)+1;
	
	if(icnt>10) icnt=1;
	s_url = String.format("%s?flag=%d",s_url,icnt);
%>
<script>
function refresh_start(){
	location.href = '<%=s_url%>';
}
</script>
</head>
<body>
<!-- <center>
</center> -->
iAuto : <%=iauto%><br>
flag : <%=cflag%><br>
<script>
var timer = setInterval('refresh_start()',<%=iauto%>);
/*setInterval 함수 : 일정한 시간 간격으로 작업을 수행하기 위해서 사용
 *여기서는 2000mils 초 
 
 */
</script>
<%
	/* 	String URL="http://192.168.226.129:8080/sar.jsp";//sar.jsp 불러옴
//Jsoap 커넥션으로 접속한다. // 파일을 읽을 때는 Jsoup.parse함수를 사용하면 된다.
		Connection conn = Jsoup.connect(URL);
		// Document 클래스로 xml데이터를 취득
		Document doc = conn.get();
		// item 태그를 가져온다. (iteration 타입이다.)
		Elements data = doc.select("data");//data 태그가 달린 Element를 몽땅 가져옴
		
		for(Element ele  : data){
		Elements time = ele.select("time");
		Elements apm = ele.select("apm");
		Elements CPU = ele.select("CPU");
		Elements User = ele.select("user");
		Elements nice = ele.select("nice");
		Elements system = ele.select("select");
		Elements iowait = ele.select("iowait");
		Elements steal = ele.select("steal");
		Elements idle = ele.select("idle");
		} */

		

%>
</body>
</html>