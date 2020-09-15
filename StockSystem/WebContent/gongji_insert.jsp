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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script language="JavaScript">
function submitForm(mode){
	
	var tmp = document.getElementsByName('title')[0].value;//name인 title의 value값 가져오기
	
	for(var i=0;i<100;i++){//공백만 있는지 검사
		tmp=tmp.replace(" ","");//공백을 아무것도 없는 걸로 바꾼다.
	}//i<100은 입력한 길이 만큼 설정
	
	if(mode=="insert"){
		
		if(tmp==""){
			alert('제목을 입력해야 합니다.');
			
		}else{
	fm.action = "gongji_ins.jsp";
	fm.submit();
		}
	}
}




</script>
<style>
	.skycolor{
		background-color : lightblue; 
	}
	.font-style{
	font-family : 'Nanum Gothic';
	font-size : 30px;
	font-weight:bold;
	color : black;
}
</style>
<meta charset="UTF-8">
<title>gongji_insert</title>
</head>
<body bgcolor="lightgreen">
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속
String sql = "select id from gongji order by id desc";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);

rs.next();
int id = rs.getInt(1);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
String today = sdf.format(now);
%>
<br>
<form method = post name='fm'>
<table align=center cellspacing=1 width=800 border=0>
<tr>
		<td colspan=3 class="font-style"><p>글 쓰기</p></td>
	</tr>
</table>

<table width border=1 cellspacing=0 cellpadding=5 align =center style="border-right: hidden; border-left: hidden">
<tr>
	<td class="skycolor"><b>번호</b></td>
	<td bgcolor=white><%=id+1%><input type=hidden name=id value='<%=id+1%>'></td>
</tr>
<tr>
	<td class="skycolor"><b>제목</b></td>
	<td bgcolor=white><input type=text name=title size=70 maxlength=70></td>
</tr>
<tr>
	<td class="skycolor"><b>일자</b></td>
	<td bgcolor=white><%=today%></td>
</tr>
<tr>
	<td class="skycolor"><b>내용</b></td>
	
	<td bgcolor=white><textarea style='width:500px; height:250px;' name=content cols=70 row=600 class="DOC_TEXT" placeholder="1000자 이내로 기재해주세요.">

</textarea>
<br />
<span style="color:#aaa;" id="counter">(0 / 최대 1000자)</span>
<script>
//설명란 textarea 체크
$('.DOC_TEXT').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

    if (content.length > 1000){
        alert("최대 1000자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 1000));//첨부터 마지막 1000번째까지 글자수 자름
        $('#counter').html("(1000 / 최대 1000자)");//자른 1000자를 기재
    }
});

</script>
	
	
	</td>
</tr>
<tr>
	<td align=right bgcolor=white colspan=2>
	<input type=button value="취소" OnClick="location.href='gongji_list.jsp'">
	<input id=insert type=button value="쓰기" OnClick="submitForm('insert')">
	</td>
	
</tr>
</table>
</form>
</body>
</html> 
