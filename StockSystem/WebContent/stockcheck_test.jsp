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

int from=Integer.parseInt(request.getParameter("from4"));
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
<br>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지

Enumeration<?> params = upload.getParameterNames();
String[] p = new String[6];
int index=0;

while(params.hasMoreElements()){
String name = (String)params.nextElement();//파라미터명
String value = upload.getParameter(name);
System.out.println(name+" "+value);
p[index]=value;
index++;
}
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
Enumeration<?> files=upload.getFileNames();
File f=null;
String imgpath=null;

while(files.hasMoreElements()){
	String name = (String)files.nextElement();//파라미터명
	String value = upload.getFilesystemName(name);
	System.out.println(name+" "+value);
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
String endate = p[1];
String content= p[2];
int stock=Integer.parseInt(p[3]);
String itemname = p[4];
Blob b = CFTB.convertFileToBlob(f);

	pstmt.setInt(1,itemnum);//상품번호 대입
	pstmt.setString(2,itemname);//상품명 대입
	pstmt.setInt(3,stock);
	pstmt.setDate(4,java.sql.Date.valueOf(today));//insert할 날짜 설정
	pstmt.setDate(5,java.sql.Date.valueOf(today));//이럴 땐 java.sql.Date.valueOf(today)와 같은 방식으로 해야한다.
	pstmt.setString(6,content);
	pstmt.setBlob(7,b);
	
	pstmt.executeUpdate();

%>
<table border=1 style="border-collapse : collapse; border-left:none; border-right:none; font-family : 'Nanum Gothic';" cellpadding=5px>
<tr><td width=100 class="att"><strong>상품 번호</strong></td><td width=150><%=itemnum%></td></tr>
<tr><td width=100 class="att"><strong>상품명</strong></td><td width=150><input type=hidden name=itemname size=75 maxlength=75><%=itemname%></td></tr>
<tr><td width=100 class="att"><strong>재고 현황</strong></td><td width=150><%=stock%></td></tr>
<tr><td width=100 class="att"><strong>상품등록일</strong></td><td width=150><%=today%></td></tr>
<tr><td width=100 class="att"><strong>상품 설명</strong></td><td width=150><input type=hidden name=descitem size=75 maxlength=75><%=content%></td></tr>
<tr><td width=100 class="att"><strong>상품사진</strong></td>
<td width=150><iframe src='imgview.jsp' width=50 height=50></iframe></td></tr>

</table>

<table width=700 cellspacing=10>
	<tr>
		<td width=450></td>
		<td width=50 height=50 align=right  style = "cursor:pointer;" onClick = "window.location='stocklist.jsp?from=<%=from%>'">
		<p class="far fa-list-alt fa-2x"></p></td>
		<td width=35 height=50 style = "cursor:pointer;" onClick = "window.location='stock_insert.jsp' " onMouseOver = "window.location='stock_insert.jsp" onMouseOut = " window.status = ''">
	<p class="fas fa-plus fa-2x green"><br></p>
	</td>
		
	</tr>
</table>
</body>
</html>