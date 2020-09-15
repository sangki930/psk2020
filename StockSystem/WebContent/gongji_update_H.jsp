<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language = "JavaScript">
function submitForm(mode){
	if(mode=="write"){
		fm.action = "gongji_write.jsp";
	}else if(mode == "delete"){
		fm.action ="gongji_delete.jsp";
		
	}
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
<title>gongji_update_H</title>
</head>
<body bgcolor="lightgreen">
<form method = post name='fm'>
<table align=center width=650 border=1 cellspacing=0 cellpadding=5>
<tr colspan=2>

<tr>
<tr>
	<td width=75 class="skycolor"><b>번호</b></td>
	<td bgcolor=white>1<input type=hidden name=id value='INSERT'></td>
</tr>
<tr>
	<td width=75 class="skycolor"><b>제목</b></td>
	<td bgcolor="white">공지사항1</td>
</tr>
<tr>
	<td width=75 class="skycolor"><b>일자</b></td>
	<td  bgcolor="white">2019-12-15</td>
</tr>
<tr>
	<td colspan="2" bgcolor="skyblue"><b>내용</b></td></tr>
<tr>	
	<td colspan="2" bgcolor="white">공지사항내용1</td>
</tr>
</table>
<table width=650>
<tr>
	<td width=600></td>
	<td><input type=button value="목록" OnClick="location.href='gongji_list.jsp'"></td>
	<td><input type=button value="수정" OnClick="location.href='gongji_update.jsp'"></td>
</tr>

</table>
</form>
</body>
</html>