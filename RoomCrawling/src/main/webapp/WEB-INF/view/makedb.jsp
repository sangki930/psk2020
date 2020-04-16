<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>DB를 생성하는 곳</h1>
<br>
<br>
<hr></hr>
<form action="mdb">
<%
int server_num=-1;
	if(request.getParameter("server_num")!=null){
	server_num=Integer.parseInt(request.getParameter("server_num"));
	}
	String login_url=request.getParameter("login_url");
	String uName=request.getParameter("uName");
	String uValue=request.getParameter("uValue");
	
	
%>

server_num 입력 : <input type="number" name="server_num"><br>
login_url 입력 : <input type="text" name="login_url"><br>

<!-- <input type="text" name="uName">
<input type="text" name="uValue">
<input type="text" name="pName">
<input type="text" name="pValue">
<input type="text" name="adm_allview_url"> -->
<!-- <input type="text" name="empty_room"> -->
<!-- <input type="text" name="last_req_time"> -->
<!-- <input type="text" name="last_proc_time"> -->


<input type="submit" name = "submit">

</form>
<%
if(server_num>-1){

	out.println("server_num값 확인 : "+server_num + "<br>");
	out.println("login_url값 확인 : "+login_url + "<br>");
	/* out.println("uName값 확인 : "+login_url + "<br>");
	out.println("uValue값 확인 : "+login_url + "<br>"); */
/* 	out.println("값 확인 : "+login_url + "<br>"); */
	/* out.println("login_url값 확인 : "+login_url + "<br>"); */

}

/* if(test!=null){
	
	out.println("<br><h1>"+test+"</h1>");
} */

%>
<%-- 확인 : ${crawl.server_num} --%>
넘어온 파라미터 값 확인 : ${server_num}
<%




%>

<br>메시지 확인 : ${msg}
</body>
</html>