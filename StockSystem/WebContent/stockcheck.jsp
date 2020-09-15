<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
	import="com.oreilly.servlet.MultipartRequest"
	import="com.oreilly.servlet.multipart.*"
	import="lecture07.CFTB"
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
<%
String filesave="C:\\Users\\501-ST14\\Desktop\\Java-workspace\\lecture07\\WebContent";

MultipartRequest upload = new MultipartRequest(request,filesave,1024*1024*16,"utf-8",new DefaultFileRenamePolicy());
//MultipartRequest 객체 선언(request,filesave, 최대크기 1024*1024*16,인코딩방식 : utf-8,DefaultFileRenamePolicy : 파일 재명명 정책 설정)

// String m_name = multi.getParameter("m_name");


%>
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
<title>stock_insert</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false">
<jsp:param value="enrollcomplete" name="menu"/>
</jsp:include>
<%
//위는 헤더를 따로 설정하여 임포트

try{
	
%>

<br>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지

Enumeration<?> params = upload.getParameterNames();//파라미터 명 획득

//여기서부터
String[] p = new String[7];
int index=0;

while(params.hasMoreElements()){
String name = (String)params.nextElement();//파라미터명
String value = upload.getParameter(name);
System.out.println(name+" "+value);
p[index]=value;
index++;
}

for(int i=0;i<7;i++){
	System.out.println(p[i]);
	
}
//여기 까지는 파라미터명을 점검하는 코드니 없어도 됨
/*
//int itemnum=Integer.parseInt(request.getParameter("itemnum"));
String itemnum=request.getParameter("itemnum");
String itemname=request.getParameter("itemname");
String stock=request.getParameter("stock");
//int stock=Integer.parseInt(request.getParameter("stock"));
String date=request.getParameter("endate");
String content=request.getParameter("content");
*/
//File f = upload.getFile("selectfile");
Enumeration<?> files=upload.getFileNames(); //파일 이름 획득
File f=null;
String imgpath=null;

while(files.hasMoreElements()){
	String name = (String)files.nextElement();//파라미터명
	String value = upload.getFilesystemName(name);
	System.out.println(name+" "+value); //파일명 획득
	imgpath = value;
	
	 f=upload.getFile(name);
	}

if(f!=null){
	System.out.println("파일이 넘어 왔습니다.");
	
}
else{
	System.out.println("파일이 넘어오지 않았습니다.");
}

/*
System.out.println(itemname);
System.out.println(stock);
System.out.println(date);
System.out.println(content);
*/

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속

String sql = "insert into stock (itemid,itemname,stocknum,stockdate,enrolldate,descitem,img) values(?,?,?,?,?,?,?);";
PreparedStatement pstmt = conn.prepareStatement(sql);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
String today = sdf.format(now);
int itemnum=Integer.parseInt(p[0]);
int from=Integer.parseInt(p[1]);
String endate = p[2];
String content= p[3];
int stock=Integer.parseInt(p[4]);
String itemname = p[5];
Blob b=null;
if(f!=null){
b = CFTB.convertFileToBlob(f);//Blob으로 변환
}
	pstmt.setInt(1,itemnum);//상품번호 대입
	pstmt.setString(2,itemname);//상품명 대입
	pstmt.setInt(3,stock);//재고현황 대입
	pstmt.setDate(4,java.sql.Date.valueOf(today));//insert할 날짜 설정
	pstmt.setDate(5,java.sql.Date.valueOf(today));//이럴 땐 java.sql.Date.valueOf(today)와 같은 방식으로 해야한다.
	pstmt.setString(6,content);//내용 대입
	pstmt.setBlob(7,b);//이미지 파일을 Blob형으로 저장
	
	
	pstmt.executeUpdate(); //쿼리문 실행
	
	out.println("<jsp:include page=\"header.jsp\" flush=\"false\">");
	out.println("<jsp:param value=\"enrollcomplete\" name=\"menu\"/>");
	out.println("</jsp:include>");
	
	
	pstmt.clearParameters();
	sql = "select * from stock where itemid="+itemnum;
	//pstmt = conn.prepareStatement(sql);
	ResultSet rset=pstmt.executeQuery(sql);
	rset.next(); //이미지를 보기 위한것
	
	//여기서부터 가져온 파일을 이미지로써 출력하는 부분이다.
	//(중요함)
	InputStream in=null;
	BufferedImage bimg=null;
	if(rset.getBinaryStream("img")!=null){
	in = rset.getBinaryStream("img"); //img컬럼의 Blob을 가져온다.
    //getBinaryStream()안에는 컬럼 값
    // BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
    bimg = ImageIO.read(in);//Blob을 이미지로 읽음
    in.close();
	}
    
    
    ByteArrayOutputStream baos = new ByteArrayOutputStream();//Byte단위로 처리할 OutpuStream 객체
    if(bimg!=null){
 ImageIO.write( bimg, "jpg", baos );
    }
 baos.flush();
 byte[] imageInByteArray = baos.toByteArray();//Blob을 바이트 배열로 변환
 baos.close();
 String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
 //바이너리 파일을 base64형으로 변환
 

%>
<br>
<h1> 아래와 같은 내용으로 저장 완료</h1>
<table border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>
<tr><td width=100 class="att"><strong>상품 번호</strong></td><td width=150><%=itemnum%></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td><td width=150><input type=hidden name=itemname size=75 maxlength=75><%=itemname%></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td><td width=150><%=stock%></td></tr>
<tr><td width=100 class="att"><strong>상품등록일</strong></td><td width=150><%=today%></td></tr>
<tr><td width=100 class="att"><strong>상품 설명</strong></td><td width=150><input type=hidden name=descitem size=75 maxlength=75><%=content%></td></tr>
<tr><td width=100 class="att"><strong>상품사진</strong></td>
<td width=150>
<% out.print("<img width=100 height=100 src='data:x-image/png;base64,"+ b64+"' alt='사진없이 첨부되었습니다.' />"); %></td></tr>

</table>

<table width=700 cellspacing=10>
	<tr>
		<td width=450></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=<%=from%>'">
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=35 height=50 style = "cursor:pointer;" onClick = "window.location='stock_insert.jsp'" onMouseOver = "window.location='stock_insert.jsp" onMouseOut = " window.status = ''">
	<p class="fas fa-plus fa-2x green"><br></p>
	</td>
		
	</tr>
</table>

<%
}catch(Exception e){
		
		out.println("<h1>오류 발생</h1>");
		out.println(e);
		out.println("<button onclick=\"goBack();\">뒤로가기</button>");
		out.println("<script language=\"javascript\">");
		out.println("function goBack(){window.history.back(-1);}");
		out.println("</script>");
		
	}

%>
</body>
</html>