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
<script>
function submitForm(mode){
	if(mode=="update"){
		fm.action = "stockupdate_test.jsp";
	}else if(mode == "delete"){
		if(window.confirm('정말 삭제하시겠습니까?'))
		{
			fm.action ="stockdelete.jsp";
		}else{
			
		}
		
	}
	fm.submit();
}
</script>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
int itemnum=Integer.parseInt(request.getParameter("key"));
int from=Integer.parseInt(request.getParameter("from1"));
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
<jsp:param value="itemdesc" name="menu"/>
</jsp:include>
<br>
<form method=post name=fm>
<input type=hidden name=key value="<%=itemnum%>">
<input type=hidden name=from2 value='<%=from%>'>
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
		System.out.println("이미지가 넘어왔음");
    in = rset.getBinaryStream("img");
    //getBinaryStream의 ()안에는 컬럼 값
    // BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
    bimg = ImageIO.read(in);
    in.close();
	}else{
		System.out.println("이미지가 넘어오지 않았음");
	}
    
    ByteArrayOutputStream baos = new ByteArrayOutputStream();//Byte단위로 처리할 OutpuStream 객체
    if(bimg!=null){
    	 ImageIO.write( bimg, "png", baos );
    	    }
 baos.flush();//OutputStream 초기화
 byte[] imageInByteArray = baos.toByteArray();//Byte 배열로 변환
 System.out.println(imageInByteArray);
 if(imageInByteArray==null){
	 System.out.println("받아들인 이미지 없음 " + imageInByteArray);
 }
 
 
 baos.close();
 String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
 //Base 64진법, ASCII코드를 가장 큰 진법으로 나타낼수 있는 수이다.
	%>
	<input type=hidden name=itemid value='<%=(rset.getInt(1))%>'>
	
<table border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>
		
<tr><td width=100 class="att"><strong>상품 번호</strong></td><td width=150><%=rset.getInt(1)%></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td><td width=150><%=rset.getString(2)%></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td><td width=150><%=rset.getInt(3)%></td></tr>
<tr><td width=100 class="att"><strong>재고 파악일</strong></td><td width=150><%=rset.getDate(4)%></td></tr>
<tr><td width=100 class="att"><strong>상품 등록일</strong></td><td width=150><%=rset.getDate(5)%></td></tr>
<tr><td width=100 class="att"><strong>상품 설명</strong></td><td width=150><%=rset.getString("descitem")%></td></tr>
<tr><td width=100 class="att"><strong>상품사진</strong></td><td width=150>
<% out.print("<img width=100 height=100 src='data:x-image/png;base64,"+ b64+"' alt='(이미지가 없습니다.)' />"); %>
</td></tr>

</table>

<table width=700 cellspacing=10>
	<tr>
		<td width=400></td>
		<td width=50 style = "cursor:pointer" onClick = "submitForm('update')"><i class="fas fa-long-arrow-alt-up fa-2x"></i></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=<%=from%>'">
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=50 height=50 style = "cursor:pointer;" onClick = "submitForm('delete')">
	
	<p class="far fa-minus-square fa-2x red"><br></p>
	</td>
		
	</tr>
</table>

</form>
</body>
</html>