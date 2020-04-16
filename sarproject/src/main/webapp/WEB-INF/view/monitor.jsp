<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int iauto = 2000;
	String s_url = "monitor";

	String cflag = request.getParameter("flag");

	if (cflag == null)
		cflag = "0";

	int icnt = Integer.parseInt(cflag) + 1;

	if (icnt > 10)
		icnt = 1;
	s_url = String.format("%s?flag=%d", s_url, icnt);

	String serverclass = "server";
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function refresh_start(){
	location.href = '<%=s_url%>';
	}
</script>
<style>
.server {
	background: red;
}

.blue {
	color: blue;
	font-size: 150%;
}
.yellow{
	color: yellow;
	font-size: 150%;
}
</style>
</head>
<body>
	<!-- <center>
</center> -->
	iAuto :
	<%=iauto%><br> flag :
	<%=cflag%><br>
	<script>
		var timer = setInterval('refresh_start()',<%=iauto%>);

		//setInterval 함수 : 일정한 시간 간격으로 작업을 수행하기 위해서 사용
		//여기서는 2000mils 초
	</script>
	<table border=1>
		<thead>
			<!-- <th>Server Num</th> -->
			<th>serverNum</th>
			<th>URL</th>
			<th>time</th>
			<th>CPU</th>
			<th>%User</th>
			<th>%NICE</th>
			<th>%System</th>
			<th>%iowait</th>
			<th>%steal</th>
			<th>%IDLE</th>
			<th>%Status</th>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td><spring:message code="common.listEmpty" />
						<td>
					</tr>
				</c:when>

				<c:otherwise>
					<c:forEach items="${list}" var="a">
						<c:choose>
							<c:when test="${a.idle <=40 }">
								<tr class="server">
							</c:when>
							<c:when test="${a.idle >40 }">
								<tr>
							</c:when>
						</c:choose>
						<td width=100>Server ${a.server_num}</td>
						<td width=100>${a.sar_url}</td>
						<td width=100>${a.time}</td>
						<td width=100>${a.cpu}</td>
						<td width=100>${a.user}</td>
						<td width=100>${a.nice}</td>
						<td width=100>${a.system}</td>
						<td width=100>${a.iowait}</td>
						<td width=100>${a.steal}</td>
						<td width=100>${a.idle}</td>
						<td width=100>
						<c:choose>
								<c:when test="${a.idle <=40 }">
									
								</c:when>
								<c:when test="${a.idle >40 && a.idle <=70  }">
									<span class="yellow"> <c:out value="●" /></span>
								</c:when>
								<c:when test="${a.idle >70 && a.idle <=100  }">
									<span class="blue"> <c:out value="●" /></span>
								</c:when>
								
							</c:choose> 
						
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>