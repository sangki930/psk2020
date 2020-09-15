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

<!DOCTYPE html>
<html>
<head>
<%
String filesave="C:\\Users\\501-ST14\\Desktop\\Java-workspace\\lecture07\\WebContent";

MultipartRequest upload = new MultipartRequest(request,filesave,1024*1024*16,"utf-8",new DefaultFileRenamePolicy());


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
<jsp:param value="updatecomplete" name="menu"/>
</jsp:include>
<br>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지
//int from=Integer.parseInt(request.getParameter("from3"));
Enumeration<?> params = upload.getParameterNames();
//파라미터 명을 얻어 params라는 배열에 저장
String[] p = new String[9];
int index=0;

/*파라미터 점검*/
while(params.hasMoreElements()){
String name = (String)params.nextElement();//파라미터명
String value = upload.getParameter(name);//파라미터명 획득
System.out.println(name+" : "+value);//파라미터 :  값
p[index]=value;
index++;
}

for(int i=0;i<p.length;i++){
	
	System.out.println("p["+i+"] : "+p[i]);
}

/*
p[0] : stockdate
p[1] : itemnum
p[2] : endate
p[3] : from3
p[4] : key
p[5] : content
p[6] : itemid
p[7] : itemname
p[8] : img

*/

//System.out.println(p[0]);
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
Enumeration<?> files=upload.getFileNames(); //파일명 얻기
File f=null; //먼저 null로 선언
String imgpath=null; //이미지 경로 획득

while(files.hasMoreElements()){
	String name = (String)files.nextElement();//파라미터명
	String value = upload.getFilesystemName(name);
	System.out.println(name+" "+value);
	imgpath = value;
	
	 f=upload.getFile(name);
	}
System.out.println("===경계선===");
if(f==null){
	System.out.println("얻어온 파일이 없습니다.");
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

String sql = null;
PreparedStatement pstmt = null;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date now  = new java.util.Date();//Date d = new Date();로 하면 ambiguous 오류가 나온다.
String today = sdf.format(now);
int itemnum=Integer.parseInt(p[4]);//상품번호
String endate = p[4];//등록일
String content= p[5];//내용
int stock=Integer.parseInt(p[1]);//재고현황
String itemname = p[6];
Blob b = null;


itemname = upload.getParameter("itemname");

System.out.println(itemname);
if(f==null){
	sql = "update stock set itemname=?,stocknum=?,stockdate=?,descitem=? where itemid=";
	sql +=itemnum;
	pstmt=conn.prepareStatement(sql);//sql 커넥트
	//pstmt.setInt(1,itemnum);//상품번호 대입
	pstmt.setString(1,itemname);//상품명 대입
	pstmt.setInt(2,stock);
	pstmt.setDate(3,java.sql.Date.valueOf(today));//insert할 날짜 설정
	//pstmt.setDate(5,java.sql.Date.valueOf(today));//이럴 땐 java.sql.Date.valueOf(today)와 같은 방식으로 해야한다.
	pstmt.setString(4,content);
	
	pstmt.executeUpdate();
}
else{

	b=CFTB.convertFileToBlob(f);
	sql = "update stock set itemname=?,stocknum=?,stockdate=?,descitem=?,img=? where itemid=";
	sql +=itemnum;
	pstmt=conn.prepareStatement(sql);
	//pstmt.setInt(1,itemnum);//상품번호 대입
	pstmt.setString(1,itemname);//상품명 대입
	pstmt.setInt(2,stock);
	pstmt.setDate(3,java.sql.Date.valueOf(today));//insert할 날짜 설정
	//pstmt.setDate(5,java.sql.Date.valueOf(today));//이럴 땐 java.sql.Date.valueOf(today)와 같은 방식으로 해야한다.
	pstmt.setString(4,content);
	pstmt.setBlob(5,b);
	
	
	
	pstmt.executeUpdate();
	
}

%>
<!--  
<table border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>
<tr><td width=100 class="att"><strong>상품 번호</strong></td><td width=150></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td><td width=150><input type=hidden name=itemname size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td><td width=150></td></tr>
<tr><td width=100 class="att"><strong>상품등록일</strong></td><td width=150></td></tr>
<tr><td width=100 class="att"><strong>상품 설명</strong></td><td width=150><input type=hidden name=descitem size=75 maxlength=75></td></tr>
<tr><td width=100 class="att"><strong>상품사진</strong></td>
<td width=150><iframe src='imgview.jsp' width=50 height=50></iframe></td></tr>

</table>
-->
<table width=700 cellspacing=10>
	<tr>
		<td width=450></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=<%=p[3]%>'">
		<!-- p[3] : from값 -->
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=35 height=50 style = "cursor:pointer;" onClick = "window.location='stock_insert.jsp' " onMouseOver = "window.location='stock_insert.jsp" onMouseOut = " window.status = ''">
	<p class="fas fa-plus fa-2x green"><br></p>
	</td>
		
	</tr>
</table>
</body>
</html>