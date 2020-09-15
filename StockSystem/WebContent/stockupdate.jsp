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
<jsp:param value="enrollitem" name="menu"/>
</jsp:include>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
int id=Integer.parseInt(request.getParameter("itemid"));
int from=Integer.parseInt(request.getParameter("from2"));
//String name=request.getParameter("name");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속
String sql = "select * from stock where itemid="+id;
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);
rs.next();
String content = rs.getString(6);

%>
<br>
<form method = post name='fm'>
<input type=hidden name=from3 value=<%=from%>>
<%
	//DB에 접속
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 데이터 포맷 설정
	java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
	String today = sdf.format(now);
	String stock_date = sdf.format(rs.getDate(4));
  	
%>
<table width=700 border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>
<tr><td width=100 class="att"><strong>상품 번호</strong></td><td width=150><input type=hidden name=itemid size=75 maxlength=75 value='<%=rs.getInt(1)%>'><%=rs.getInt(1)%></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td><td width=150><input type=text name=itemname size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td><td width=150><input type=text name=stock size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>재고 파악일</strong></td><td width=150><input type=hidden name=endate size=75 maxlength=75 
value=<%=today%>><%=today%></td></tr>
<tr><td width=100 class="att"><strong>상품 등록일</strong></td><td width=150><%=rs.getDate(5)%></td></tr>
<tr><td width=100 height=50 class="att"><strong>상품 설명</strong></td><td width=150><textarea style='width:500px; height:250px;' name=content cols=70 row=600 value='<%=content%>'></textarea></td></tr>
<tr><td width=100 class="att"><strong>상품사진</strong></td><td width=150></td></tr>

</table>

<table width=700 cellspacing=10>
	<tr>
		<td width=450></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=<%=from%>'">
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=35 height=50 style = "cursor:pointer;" onClick="submitForm('update')">
	<p class="fas fa-plus fa-2x green"><br></p>
	</td>
		
	</tr>
</table>

</form>
</body>
</html>