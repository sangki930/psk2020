<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% 
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
int id=Integer.parseInt(request.getParameter("itemid"));
String content=request.getParameter("content");
%>

<script>
function submitForm(mode){
	
	var tmp = document.getElementsByName('itemname')[0].value;//name인 title의 value값 가져오기
	
	for(var i=0;i<100;i++){//공백만 있는지 검사
		tmp=tmp.replace(" ","");//공백을 아무것도 없는 걸로 바꾼다.
	}//i<100은 입력한 길이 만큼 설정
	
	if(mode=="insert"){
		
		if(tmp==""){
			alert('상품명을 입력해야 합니다.');
			
		}else{
	fm.action = "stockcheck.jsp";
	fm.submit();
		}
	}
}
</script>
<style>
.att{
	background-color : skyblue;
	border-right:1px solid skyblue;
}
.green{
		color : lightgreen;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta charset="UTF-8">
<title>stockupdate</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="updatecomplete" name="menu"/>
</jsp:include>
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속
String sql = "select * from stock where itemid="+id;
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);
rs.next();
content = rs.getString(4);

%>
<br>
<form method = post name='fm'>
<%
	//DB에 접속

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
	String today = sdf.format(now);
	
	sql = "update stock set stockdate="+today+", "+","; 
  
%>
<table width=700 border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>
<tr><td width=100 class="att"><strong>상품 번호</strong></td><td width=150><input type=text name=itemnum size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td><td width=150><input type=text name=itemname size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td><td width=150><input type=text name=stock size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>상품등록일</strong></td><td width=150><input type=hidden name=endate size=75 maxlength=75 
value=<%=today%>><%=today%></td></tr>
<tr><td width=100 height=50 class="att"><strong>상품 설명</strong></td><td width=150><textarea style='width:500px; height:250px;' name=content cols=70 row=600><%=content%></textarea></td></tr>
<tr><td width=100 class="att"><strong>상품사진</strong></td>
<td width=150></td></tr>

</table>

<table width=700 cellspacing=10>
	<tr>
		<td width=450></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist?from=1.jsp'">
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=35 height=50 style = "cursor:pointer;" onClick="submitForm('update')">
	<p class="fas fa-plus fa-2x green"><br></p>
	</td>
		
	</tr>
</table>

</form>
</body>
</html>