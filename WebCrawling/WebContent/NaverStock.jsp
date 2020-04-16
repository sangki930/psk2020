<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*,java.io.*,java.util.*,java.text.*"%>
<%@ page import="org.jsoup.nodes.*"%>
<%@ page import="org.jsoup.*"%>
<%@ page import="org.jsoup.select.Elements"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

/*파라미터 검사*/
String stparam = null;
String endparam = null;

String stmonth = null;
String endmonth = null;

String stday =null;
String endday=null;

String code=null;

//boolean isSearch=false;

if(request.getParameter("startyear")==null ||
request.getParameter("startmonth")==null ||
request.getParameter("startday")==null)
{
	stparam="2019.01.01";
}
else{
	
if(request.getParameter("startmonth").length()==1){
	stmonth = "0"+request.getParameter("startmonth");
}else{
	stmonth = request.getParameter("startmonth");
}

if(request.getParameter("startday").length()==1){
	stday = "0"+request.getParameter("startday");
}else{
	stday = request.getParameter("startday");
}
	
stparam = request.getParameter("startyear")+"."
					+stmonth+"."
					+stday;
}
if(request.getParameter("endyear")==null ||
request.getParameter("endmonth")==null ||
request.getParameter("endday")==null)
{
	endparam="2019.01.01";
}
else{

	if(request.getParameter("endmonth").length()==1){
		endmonth = "0"+request.getParameter("endmonth");
	}
	else{
		endmonth = request.getParameter("endmonth");
	}
	if(request.getParameter("endday").length()==1){
		endday = "0"+request.getParameter("endday");
	}
	else{
		endday = request.getParameter("endday");
	}

	
endparam = request.getParameter("endyear")+"."
					+endmonth+"."
					+endday;
}

if(request.getParameter("code")==null){
	
	code="035420";
}else{
	
	code=request.getParameter("code");
}

System.out.println("stparam 확인 :"+ stparam);
System.out.println("endparam 확인 :"+ endparam);

%>
<!-- 검색란 -->
<form method=post action="NaverStock.jsp">
	종목 : 
	<input type="text" name="code"><br>
	시작 연도 : 
	<input type="number" name="startyear" maxlength=4>-
	<input type="number" name="startmonth" maxlength=2>-
	<input type="number" name="startday" maxlength=2><br>
	끝 연도 : 
	<input type="number" name="endyear" maxlength=4>-
	<input type="number" name="endmonth" maxlength=2>-
	<input type="number" name="endday" maxlength=2><br>
	<input type="submit" name="search" value="검색">
</form>
<h1>종목코드 : <%=code%></h1>
<h1><%=stparam%>부터 <%=endparam%>까지 검색결과</h1>
<!-- 테이블 시작 -->
	<table border=1>
		<thead>
			<th>날짜</th>
			<th>종가</th>
			<th>전일비</th>
			<th>시가</th>
			<th>고가</th>
			<th>저가</th>
			<th>거래량</th>
			<!-- <th>pre</th> -->
		</thead>
		<%
			int p = 1;//페이지 변수
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");//포맷을 정함

			LocalDate enddate = LocalDate.parse(endparam, formatter); //끝 날짜를 LocalDate 객체로 변환
			LocalDate startdate = LocalDate.parse(stparam, formatter); //시작 날짜를 LocalDate 객체로 변환
			
			LocalDate pre = LocalDate.now();//날짜 인덱스

			while (true) {
				String url = "https://finance.naver.com/item/sise_day.nhn?code="+code+"&page=" + p;

				Document doc = null;
				try {
					doc = Jsoup.connect(url).get();//Jsoup으로 해당 URL에 접속
				} catch (Exception e) {
					out.println(e);
				}

				Elements elem = doc.select("table.type2").select("td");
				//table만 선택하면 page nav까지 되어 있는 테이블까지 고르게 된다.
				//.type2는 클래스 즉, table중에서 클래스이름이 type2인걸 뽑는다는 뜻이다.
			

				List<String> list = new ArrayList<>();//text만 뽑는 ArrayList
				List<Element> elementlist = new ArrayList<>();//html태그랑 같이 ArrayList

				for (int i = 0; i < elem.size(); i++) {//불필요한 내용 ""이 들어간 td를 거르기 위해서 이작업을 함
					if (elem.get(i).text().equals("") == false) {
						list.add(elem.get(i).html());
						elementlist.add(elem.get(i));
					}
				}

				//불필요한 td를 걸러내면 70개가 된다.
		%>
		<tbody>
			<%
				
					for (int i = 0; i < list.size(); i = i + 7) {
						pre = LocalDate.parse(elementlist.get(i).text(), formatter);
						if (LocalDate.parse(elementlist.get(i).text(), formatter).isBefore(enddate.plusDays(1))
								&& LocalDate.parse(elementlist.get(i).text(), formatter).isAfter(startdate.minusDays(1))) {
							//날짜 범위 계산 '>='이 없으므로, 이것은 plusDays(1)와 minusDays(1)로 계산하여야 한다. 
			%>
			<tr>
				<td><%=list.get(i)%></td>
				<td><%=list.get(i + 1)%></td>
				<td align="right"><%=list.get(i + 2)%></td><!-- align right로 통일해야 정갈하게 나옴  -->
				<td><%=list.get(i + 3)%></td>
				<td><%=list.get(i + 4)%></td>
				<td><%=list.get(i + 5)%></td>
				<td><%=list.get(i + 6)%></td>
				<%-- <td><%=pre%></td> --%>
			</tr>
			<%
				}
						//System.out.println(pre);
					}
					if (pre.isEqual(startdate) || pre.isBefore(startdate)) {//현재 날짜(인덱스)가 시작날짜보다 전이거나 같을때
						break;
					}

					p++;
				}
			
			%>
		</tbody>
	</table>
</body>
</html>