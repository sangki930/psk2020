<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script language="JavaScript">
function submitFrom(mode){
	fm.action = "gongji_write.jsp?key=INSERT";
	fm.submit();
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
<title>gongji_insert_H</title>
</head>
<body bgcolor="lightgreen">
<br>
<table align=center cellspacing=1 width=800 border=0>
<tr>
		<td colspan=3 class="font-style"><p>글 쓰기</p></td>
	</tr>
</table>
<form method = post name='fm'>
<table width border=1 cellspacing=0 cellpadding=5 align =center style="border-right: hidden; border-left: hidden">
<tr>
	<td class="skycolor"><b>번호</b></td>
	<td bgcolor=white>신규(insert)<input type=hidden name=id value='INSERT'></td>
</tr>
<tr>
	<td class="skycolor"><b>제목</b></td>
	<td bgcolor=white><input type=text name=title size=70 maxlength=70></td>
</tr>
<tr>
	<td class="skycolor"><b>일자</b></td>
	<td bgcolor=white>2019-12-15</td>
</tr>
<tr>
	<td class="skycolor"><b>내용</b></td>
	<td bgcolor=white><textarea style='width:500px; height:250px;' name=content id="content" class="DOC_TEXT" cols=70 row=600></textarea>
	<br />
	<span style="color:#aaa;" id="counter">(0 / 최대 1000자)</span>
	</td>
	<script>CKEDITOR.replace('content');
	//설명란 textarea 체크
	$('.DOC_TEXT').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

	    if (content.length > 1000){
	        alert("최대 1000자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 1000));//첨부터 마지막 1000번째까지 글자수 자름
	        $('#counter').html("(1000 / 최대 1000자)");//자른 1000자를 기재
	    }
	})
	</script>
</tr>
<tr>
	<td colspan=2 align=right bgcolor=white>
	<input type=button value="취소" OnClick="location.href='gongji_list.jsp'">
	<input type=button value="쓰기" OnClick="submitForm('write')">
	</td>
	
</tr>
</table>
</form>
</body>
</html>