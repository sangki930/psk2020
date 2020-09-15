<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
    pageEncoding="UTF-8"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="org.apache.commons.io.output.ByteArrayOutputStream"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script>
function submitForm(mode){
	
	//var tmp = document.getElementsByName('itemname')[0].value;//name인 title의 value값 가져오기
	//var tmp1 = document.getElementsByName('itemnum')[0].value;//상품번호 판별
	var tmp = document.getElementsByName('itemname')[0].value;//name인 title의 value값 가져오기
	var tmp1 = document.getElementsByName('itemid')[0].value;//상품번호 판별
	var tmp2 = document.getElementsByName('itemnum')[0].value;//재고현황 판별
	var tmp3 = document.getElementsByName('content')[0].value;//상품설명 판별
	
	for(var i=0;i<100;i++){//공백만 있는지 검사
		tmp=tmp.replace(" ","");//공백을 아무것도 없는 걸로 바꾼다.
		tmp3=tmp3.replace(" ","");
	}//i<100은 입력한 길이 만큼 설정
	
	if(mode=="update"){
		
		if(tmp==""){
			alert('상품명을 입력해야 합니다.');
			
		}else if(tmp1==""){
			alert('상품번호를 입력해야 합니다.');
		}else if(tmp2==""){
			alert('재고현황을 입력해야 합니다.');
		}else if(tmp3==""){
			alert('상품설명을 입력해야 합니다.');
		}
		else{
	fm.action = "stockupdate_check_test.jsp";
	fm.submit();
		}
	}
	else if(mode=='delete'){
		fm.action = "stockdelete.jsp";
		fm.submit();
	}
}
</script>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
int itemnum=Integer.parseInt(request.getParameter("key"));
int from=Integer.parseInt(request.getParameter("from2"));
%>
<style>
.att{
	background-color : skyblue;
	border-right:1px solid skyblue;
}
.green{
		color : lightgreen;
	}
.blue{
color : lightblue;
}
.red{
	color : red;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<meta charset="UTF-8">
<title>stockview</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="update" name="menu"/>
</jsp:include>
<br>
<form method=post name=fm runat="server" enctype="multipart/form-data">
<!-- HTML 서버 컨트롤로 변환 -->
<input type=hidden name=key value="<%=itemnum%>">
<input type=hidden name=from3 value="<%=from%>">
<%

	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
	//DB에 접속
	
	String sql="select * from stock where itemid="+itemnum;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
	String today = sdf.format(now);
	
	ResultSet rset = pstmt.executeQuery(sql);
	rset.next();
	// 바이너리 데이터를 저장하고 있는 컬럼으로부터 데이터를 가져온다
    InputStream in = null;
	BufferedImage bimg =null;
	if(rset.getBinaryStream("img")!=null){
    in = rset.getBinaryStream("img");
    //getBinaryStream()안에는 컬럼 값
    // BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
    bimg = ImageIO.read(in);
    in.close();
	}
    
    ByteArrayOutputStream baos = new ByteArrayOutputStream();//Byte단위로 처리할 OutpuStream 객체
    if(bimg!=null){
    	 ImageIO.write( bimg, "png", baos );
    	    }
 baos.flush();
 byte[] imageInByteArray = baos.toByteArray();
 baos.close();
 String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
 
	%>

<table border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>

<tr><td width=100 class="att"><strong>상품 번호</strong></td>
<td width=150><input name=itemid type=hidden value='<%=rset.getInt(1)%>'><%=rset.getInt(1)%></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td>
<td width=150><input name = itemname type='text' value ='<%=rset.getString(2)%>' ></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td>
<td width=150><input name = itemnum type=number value='<%=rset.getInt(3)%>'></td></tr>
<tr><td width=100 class="att"><strong>재고 파악일</strong></td>
<td width=150><input type=hidden name=stockdate value='<%=rset.getDate(4)%>'><%=rset.getDate(4)%></td></tr>
<tr><td width=100 class="att"><strong>상품 등록일</strong></td>
<td width=150><input type=hidden name=endate size=75 maxlength=75 value=<%=rset.getDate(5)%>><%=rset.getDate(5)%></td></tr>
<tr><td width=100 class="att"><strong>상품 설명</strong></td>
<td width=150>
<textarea style='width:500px; height:250px;' name=content cols=70 row=600 class="DOC_TEXT" placeholder="1000자 이내로 기재해주세요.">
<%=rset.getString(6)%>
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




</td></tr>
<tr><td width=100 class="att"><strong>상품사진</strong></td><td width=150>

<input type='file' id="imgInput" name="selectfile"/><br>
<% out.print("<img accept=\"image/*\" id=\"image_section\" width=100 height=100 src='data:x-image/jpg;base64,"+ b64+"' alt='현재 이미지 없음' />"); %>
<script>
function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#image_section').attr('src', e.target.result); 
	   //e.target.result : 이미지의 위치
	   
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  //readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할
	  /*
	   . 읽어오는 read 행위가 종료되는 경우에, readyState 의 상태가 DONE이 되며,  
	   loadend 이벤트가 트리거 됩니다. 
	   이와 함께,  base64 인코딩 된 스트링 데이터가 result  속성(attribute)에 담아지게 됩니다.
	   */
	  }
	 else {
		 
		 reader.onload = function (e) {
			   $('#image_section').attr('src', e.target.result); 
			   //e.target.result : 이미지의 위치
			   
			  }
		 reader.readAsDataURL(input.files[0]);
	 }
	 
	 
	}
	  //change() 메소드는 해당하는 요소의 value에 변화가 생길 경우 
	  //이를 감지하여 등록된 콜백함수를 동작시킨다
	$("#imgInput").change(function(){
	   readURL(this);
	});
</script>

</td></tr>

</table>

<table width=700 cellspacing=10>
	<tr>
		<td width=400></td>
		<td width=50 style = "cursor:pointer;" onClick = "submitForm('update')"><i class="fas fa-long-arrow-alt-up fa-2x"></i></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=<%=from%>'">
	<!-- 	<p class="far fa-list-alt fa-2x"></p></td>
		<td width=50 height=50 style = "cursor:pointer;" onClick = "submitForm('delete')"> -->
	
	<p class="far fa-list-alt fa-2x"><br></p>
	</td>
		
	</tr>
</table>

</form>
</body>
</html>