<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="kopo.example.service"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<style type="text/css">
	.size{
		width : 50px;
	}
</style>
<meta charset="UTF-8">
<title>A_01</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="nominate" name="menu"/>
</jsp:include>
<table border=1 class="font-stylepurple" bgcolor=lightgray>
<%

//DB에 접속

kopo.example.service.Service_insert si=new kopo.example.service.Service_insert();
/*
int index=1;//select문의 레코드 번호
*/
int index=si.next_number();//빈 번호 찾기
kopo.example.service.Service_allview sa = new kopo.example.service.Service_allview();

for(int i=0;i<sa.getList().size();i++)//커서를 한 줄 씩 내림
{
out.println("<tr><td><form method=\"post\" action=\"A_02.jsp\">");//POST 방식으로 A_02.jsp(삭제)으로 이동
out.println("기호&nbsp&nbsp<input type=\"text\" name=\"id\" value=\""+sa.getList().get(i).getId()+"\" class=\"size\" readonly>&nbsp&nbsp이름 :");
//input 태그에 readonly 속성을 줌으로써 학번은 나오지만 수정을 못하게
out.println("<input type=\"text\" name=\"name\" value="+sa.getList().get(i).getName()+"  readonly>");
//input 태그에 readonly 속성을 줌으로써 이름은 나오지만 수정을 못하게
out.println("<input type=\"submit\" value=\"삭제\" class=\"button\">");
//삭제로 이동하는 버튼
out.println("</form></td></tr>");
}


%>
<tr><td><form method="post" action="A_03.jsp">
	기호&nbsp&nbsp<input type="text" name="id" value="<%=index%>" class="size" readonly>&nbsp&nbsp이름 :
	<input id="inputName" type="text" name="name" maxlength="10" oninput="maxLengthCheck(this)" placeholder="후보명을 적으시오." />
	<input type="submit" value="추가" class="button2">
	
	<script>/*여기서 부터는 특수문자 입력방지 코드이다.*/    
    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
    // 특수문자 정규식 변수(공백 미포함)
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;// 완성형 아닌 한글 정규식
    var replaceSpace= /[\s]/g;//공백, 탭 띄어쓰기 정규식
    
    $(document).ready(function(){//jQuery 사용
        $("#inputName").on("focusout", function() {//inputName이라는 id에서 함수를 실행함
        	//focusout : 엘리먼트(여기서는 inputName이라는 id)가 focus를 잃었을 때
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {//특수문자 정규식이랑, 미완성 한글 정규식이 일치하면
                	//.match(str) : str이랑 일치여부를 계산하는 함수
                    x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                }else if(x.match(replaceSpace)){//공백이 있다면
                	x= x.replace(replaceSpace,"");// 공백 제거
                }
                $(this).val(x);
            }
            }).on("keyup", function() {//입력 후 발생하는 이벤트
                $(this).val($(this).val().replace(replaceChar, ""));//입력후 지워짐
       });

    });       
</script>
	
	
	</form>
</td></tr>
	
</table>
<%

out.println("<button onclick=\"goBack();\">뒤로가기</button>");
out.println("<script language=\"javascript\">");
out.println("function goBack(){window.history.back(-1);}");
//out.println("function goBack(){window.history.back(-1);}");
out.println("</script>");

%>
</body>
</html>