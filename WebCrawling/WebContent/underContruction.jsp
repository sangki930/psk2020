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
<title>공사정보 확인</title>
<style>
th{

	background-color: lightgreen;

}
</style>
</head>
<body>
<a href='kakaomaptest.jsp'>카카오맵테스트</a>
<table border=1>
<thead>
	<th>공사정보유형</th>
	<th>차단 방법</th>
	<th>차단된 차로 수</th>
	<th>공사 시작일</th>
	<th>공사 종료일</th>
	<th>공사 실제 개시시간</th>
	<th>공사 실제 종료시간</th>
	<th>공사 상황정보 메시지</th>
	<th>공사 우회 정보 메시지</th>
	<th>진행방향</th>
	<th>지도보기</th>
</thead>
<tbody>
<%
	String URL
	="http://openapi.its.go.kr:8082/api/NEventIdentity?key=1498271446332&ReqType=2&MinX=127.100000&MaxX=128.890000&MinY=34.100000%20&MaxY=39.100000&type=its";

	/*아래의 내용들은 각 태그의 값들을 가져오는 부분이다.*/
	/* seq=items.item(i).getAttributes().getNamedItem("seq").getNodeValue();
	hour = e.getElementsByTagName("hour").item(0).getFirstChild().getNodeValue();
	day = e.getElementsByTagName("day").item(0).getFirstChild().getNodeValue();
	temp = e.getElementsByTagName("temp").item(0).getFirstChild().getNodeValue();
	tmx = e.getElementsByTagName("tmx").item(0).getFirstChild().getNodeValue();
	tmn = e.getElementsByTagName("tmn").item(0).getFirstChild().getNodeValue();
	sky = e.getElementsByTagName("sky").item(0).getFirstChild().getNodeValue();
	pty = e.getElementsByTagName("pty").item(0).getFirstChild().getNodeValue();
	wfKor = e.getElementsByTagName("wfKor").item(0).getFirstChild().getNodeValue();
	wfEn = e.getElementsByTagName("wfEn").item(0).getFirstChild().getNodeValue();
	pop = e.getElementsByTagName("pop").item(0).getFirstChild().getNodeValue();
	r12 = e.getElementsByTagName("r12").item(0).getFirstChild().getNodeValue();
	s12 = e.getElementsByTagName("s12").item(0).getFirstChild().getNodeValue();
	ws = e.getElementsByTagName("ws").item(0).getFirstChild().getNodeValue();
	wd = e.getElementsByTagName("wd").item(0).getFirstChild().getNodeValue();
	wdKor = e.getElementsByTagName("wdKor").item(0).getFirstChild().getNodeValue();
	wdEn = e.getElementsByTagName("wdEn").item(0).getFirstChild().getNodeValue();
	reh = e.getElementsByTagName("reh").item(0).getFirstChild().getNodeValue();
	r06 = e.getElementsByTagName("r06").item(0).getFirstChild().getNodeValue();
	s06 = e.getElementsByTagName("s06").item(0).getFirstChild().getNodeValue(); */
	
	List<String> lat = new ArrayList<>();
	List<String> alt = new ArrayList<>();
	
	try {
		// Jsoap 커넥션으로 접속한다. // 파일을 읽을 때는 Jsoup.parse함수를 사용하면 된다.
		Connection conn = Jsoup.connect(URL);
		// Document 클래스로 xml데이터를 취득
		Document doc = conn.get();
		// item 태그를 가져온다. (iteration 타입이다.)
		Elements datas = doc.select("data");//data 태그가 달린 Element를 몽땅 가져옴
		//System.out.println(datas);
		//Elements datacount = doc.select("datacount");
		int datacount = Integer.parseInt(doc.select("datacount").text());
		//datacount는 데이터의 개수이다.
		System.out.println("datacount 확인 : "+ datacount);
		
		for (Element ele : datas) {
		// item 태그의 title 태그를 취득한다.
		Elements eventdirection = ele.select("eventdirection");//방향
		Elements coordy = ele.select("coordy");//위도
		//Elements type = ele.select("type"); // 도로정보 (its : 국도 / ex : 고속도로 / police : 경찰청)
		Elements eventid = ele.select("eventid");//공사번호
		Elements coordx = ele.select("coordx"); //경도
		Elements eventstatusmsg = ele.select("eventstatusmsg");//공사상태
		Elements lanesblocktype = ele.select("lanesblocktype");
		//공사로 인한 차로 차단 방법
		//(0:통제없음/1:갓길통제/2:차로 부분 통제 /3:전면통제)
		Elements eventStartTime = ele.select("eventstarttime");
		Elements eventEndTime = ele.select("eventendtime");
		
		Elements eventstartday = ele.select("eventstartday");
		Elements eventendday = ele.select("eventendday");
		Elements expectedCnt = ele.select("expectedcnt");//우회정보 개수
		Elements lanesblocked = ele.select("lanesblocked");//공사로인한 차단 차로수
		Elements expecteddetourmsg = ele.select("expecteddetourmsg");
		
		Elements eventtype = ele.select("eventtype");//공사정보 유형
			
		String eventtypetoSTR = eventtype.text();
		
		%>
		<tr>
		<td><%=eventtype.text()%></td>
		<td><%=lanesblocktype.text()%></td>
		<td><%=lanesblocked.text()%></td>
		<td><%=eventstartday.text()%></td>
		<td><%=eventendday.text()%></td>
		<td><%=eventStartTime.text()%></td>
		<td><%=eventEndTime.text()%></td>
		<td><%=eventstatusmsg.text()%></td>
		<td><%=expecteddetourmsg.text()%></td>
		<td><%=eventdirection.text()%></td>
		<form method=post action='oneMapView.jsp'>
		<input type='hidden' name='coordx' value='<%=coordx.text()%>'>
		<input type='hidden' name='coordy' value='<%=coordy.text()%>'>
		<td><!-- <a href='oneMapView.jsp'>지도보기</a -->
			<input type='submit' name='submit' value="지도보기">
		</td>
		</form>
		</tr>
		<%
		lat.add(coordx.text());
		alt.add(coordy.text());
		System.out.println("확인 :"+eventdirection.text());		
		// text를 출력한다.
		//System.out.println(subnode.text());
		}
		} catch (Throwable e) {
		e.printStackTrace();
		}

 %>
</tbody>
</table>
<form method="POST" action="allMapView.jsp">
<%
for(int i=0;i<lat.size();i++){
%>
<input type='hidden' name='lat' value='<%=lat.get(i)%>'>
<input type='hidden' name='alt' value='<%=alt.get(i)%>'>
<%
}
%>
<input type='submit' name='allsubmit' value="전체지도보기">
</form>
</body>
</html>