<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%!
/* page_nation 메소드 선언*/
		public void page_nation(int from,int total,javax.servlet.jsp.JspWriter out) throws IOException{
	
		
		
		int list_cnt_perpage=20;//페이지당 20개
		int list_cnt=10;//10개
		int total_pagecnt=(from/list_cnt_perpage)+1;//총 페이지 수
		int present_page=(from/list_cnt_perpage)+1;// 현재 페이지
		int start_page_num=(from/(list_cnt_perpage*list_cnt))+1;// 페이지 시작번호
		
		out.println("<table><tr>");
		out.println("<td>");
		out.println("<a href=\"stocklist.jsp?from="+from+"\">");
		out.println("◀</a>");
		out.println("</td>");
		
		for(int i=start_page_num;i<=start_page_num+list_cnt;i++){
				
		out.println("<td>");
		out.println("<a href=\""+i+"\">");
		out.println(""+i+"");
		out.println("");
		out.println("</a></td>");
		}
		out.println("<td><a href=\"stocklist.jsp?from="+(from+20)+"\"");
		out.println("▶");
		out.println("</a></td>");
		out.println("</tr></table>");		
		
	
}

%>
<style>

.icono-comment{
	color : skyblue;
	transform : scale(1);
}
.font-nanum{
	font-family : 'Nanum Gothic';
	font-size : 15px;
	color : black;
}
</style>
<meta charset="UTF-8">
<title>(주) 트와이스 재고관리 메인 페이지</title>
</head>
<body>
<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>
<form method=post>
<div style="width = 1000; height=800;" align= center>
<table style="border-collapse : collapse; border-left:none; border-right:none;" border=1 width=1000 class="font-nanum" cellpadding=10px>
<tr bgcolor = "orange"  style="border-top : 3px solid red; border-bottom : 3px solid red;">
<th class="font-thstyle" width=10%>번호</th><td width=10%>상품번호</td><th width=30%>상품명</th><th width=10%>현재 재고수</th><th width=20%>재고파악일</th><th width=20%>상품등록일</th></tr>
<%

//int from=Integer.parseInt(request.getParameter("from"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속
String sql = "select @rownum:=@rownum+1 as no, itemid,itemname,stocknum,stockdate,enrolldate from stock";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql);

int no=1;
int start_num=1;


while(rs.next()){
	
out.println("<tr><td>"+rs.getInt("no")+
		"</td></tr>");

	no++;	
}


%>

</table>
</div>
<br>
<table>
<%

%>
</table>
<div style="width = 1000; height=800;" align= center>
<table width=1000>
	<tr>
		<td width=35 height=50 style = "cursor:pointer;" onClick = "window.location='stock_insert.jsp' " onMouseOver = "window.location='stock_insert.jsp" onMouseOut = " window.status = ''">
	<p class="fas fa-pen fa-2x"></p>
	
	</td><td>
	<p class="fab fa-amazon fa-2x"></p>
	</td>
	<td></td>
		
	</tr>
</table>
</div>
</form>
</body>
</html>