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
.table-style{
	border-top:0px;
	border-bottom:none;
	border-right:none;
	border-left:none;
}
.bl{
	border-bottom:1px solid black;
}
.bl2{
	border-right:1px solid black;
}
</style>
<meta charset="UTF-8">
<title>gongji_view_H</title>
</head>
<body bgcolor="lightgreen">
<form method = post name='fm'>
<table width=650 border=0 cellspacing=0 cellpadding=5 align=center class="table-style">
<tr>
<td colspan=2 class="font-style" class="bl">글 조회</td>
</tr>
<tr>
	<td width=75 class="skycolor bl bl2"><b>번호</b></td>
	<td class="bl" bgcolor="white">1<input type=hidden name=id value='INSERT'></td>
</tr>
<tr>
	<td width=75 class="skycolor bl bl2"><b>제목</b></td>
	<td class="bl"  bgcolor="white">공지사항1</td>
</tr>
<tr>
	<td width=75 class="skycolor bl bl2"><b>일자</b></td>
	<td class="bl"  bgcolor="white">2019-12-15</td>
</tr>
<tr>
	<td colspan="2" class="skycolor bl"><b>내용</b></td></tr>
<tr>	
	<td colspan="2" class="bl"  bgcolor="white">공지사항내용1</td>
</tr>
</table>
<table align=center width=650>
<tr>
	<td width=600></td>
	<td><input type=button value="취소" OnClick="location.href='gongji_list.jsp'"></td>
	<td><input type=button value="쓰기" OnClick="submitForm('write')"></td>
	<td><input type=button value="삭제" OnClick="submitForm('delete')"></td>
</tr>
</table>
</form>
</body>
</html>