<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20초마다 flag값 순환</title>
<%
	int iauto = 2000;
	String s_url = "autoreq.jsp";
	
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
</body>
</html>