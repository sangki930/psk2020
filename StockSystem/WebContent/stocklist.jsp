<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="javax.servlet.jsp.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%!
/* page_nation 메소드 선언*/
/*
		public void page_nation(int from,int total) throws IOException{
	
		
		javax.servlet.jsp.JspWriter out;
		int list_cnt_perpage=20;//페이지당 20개
		int list_cnt=10;//10개
		int total_pagecnt=(total/list_cnt_perpage)+1;//총 페이지 수
		int present_page=(from/list_cnt_perpage)+1;// 현재 페이지
		int start_page=(from/(list_cnt_perpage*list_cnt))+1;// 페이지 시작번호
		int p=present_page;
		
		
		String url = "stocklist.jsp";
		
		out.println("<table><tr>");
		out.println("<td>");
		out.println("<a href=\"stocklist.jsp?from="+from+"\">");
		out.println("◀</a>");
		out.println("</td>");
		
		
		
		if(p>1){
			String ahref1 = "<a href="+url+"from="+((p-2)*list_cnt_perpage*(list_cnt)+1)+"&cnt="+list_cnt_perpage+">";
			out.println("<td>"+ahref1+"<<</td>");
			}
		for(int i=start_page;i<start_page+10;i++){
			if(i<=total_pagecnt){
			out.println("<td width=45 align=center><a href=\"stocklist.jsp?from="+(((i-1)*10)+1)+"&cnt="+list_cnt_perpage+">"+i+"</td>");
			}
			}
			if(p<total_pagecnt){
				String ahref2 = "<a href=\"stocklist.jsp?from="+(p*list_cnt_perpage*(list_cnt)+1)+">";
				out.println("<td>"+ahref2+">></td>");
			}


			String ahref3 = "<a href="+url+"from="+((total_pagecnt-1)*list_cnt_perpage+1)+">";
			out.println("<td>"+ahref3+"끝</td>");
		
		out.println("<td><a href=\"stocklist.jsp?from="+"\"");
		out.println("▶");
		out.println("</a></td>");
		out.println("</tr></table>");		
		
	
}
*/
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
<form method=get>

<div style="width = 1000; height=800;" align= center>
<table style="border-collapse : collapse; border-left:none; border-right:none;" border=1 width=1000 class="font-nanum" cellpadding=10px>
<tr bgcolor = "orange"  style="border-top : 3px solid red; border-bottom : 3px solid red;">
<th class="font-thstyle" width=5%>번호</th><th width=10%>상품번호</th><th width=35%>상품명</th><th width=10%>현재 재고수</th><th width=20%>재고파악일</th><th width=20%>상품등록일</th></tr>
<%

int from=Integer.parseInt(request.getParameter("from"));
out.println("<input type=hidden name='from1' value='"+from+"'>");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//DB에 접속

String cntsql = "select count(*) from stock";
PreparedStatement pstmt = conn.prepareStatement(cntsql);
ResultSet rs = pstmt.executeQuery(cntsql);

int total=0;

if(rs.next()){
total=rs.getInt(1);
}
String sql = "select itemid,itemname,stocknum,stockdate,enrolldate from stock limit "+(from-1)+",20";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery(sql);

int no=1;
int start_num=1;


while(rs.next()){
	
out.println("<tr><td>"+no+
		"</td><td>"+rs.getInt(1)
		+"</td><td><a href='stockview.jsp?key="+rs.getInt(1)+"&from1="+from+"'>"+rs.getString(2)
		+"</a></td><td>"+rs.getInt(3)
				+"</td><td>"+rs.getDate(4)
				+"</td><td>"+rs.getDate(5)
						+"</td></tr>");

	no++;	
}
//page_nation(from,total,javax.servlet.jsp.JspWriter out);


%>

</table>
<% %>
</div>
<br>
<div style="width = 1000; height=800;" align= center>
<table border=1>
<%

int list_cnt_perpage=20;//페이지당 20개
int list_cnt=10;//10개
int total_pagecnt=((total-1)/list_cnt_perpage)+1;//총 페이지 수
int present_page=(from/list_cnt_perpage)+1;// 현재 페이지
int start_page=(from/(list_cnt_perpage*list_cnt))+1;// 페이지 시작번호
int p=present_page;
		
System.out.println((total_pagecnt-1)*list_cnt_perpage+1);
		
		String url = "stocklist.jsp?";
		
		%>
		<td><a href='stocklist.jsp?from=1'>처음</a></td>
		<% 
		if(p>1){
			String ahref1 = "<a href="+url+"from="+((p-2)*list_cnt_perpage*(list_cnt)+1)+">";
			out.println("<td>"+ahref1+"◀</a></td>");
			}
		for(int i=start_page;i<start_page+10;i++){
			
			System.out.println(i);
			if(i<=total_pagecnt){
			out.println("<td width=45 align=center><a href=\"stocklist.jsp?from="+(((i-1)*list_cnt_perpage)+1)+"\">"+i+"</a></td>");
			}
			}
			if(p<total_pagecnt){
				String ahref2 = "<a href=\"stocklist.jsp?from="+(p*list_cnt_perpage+1)+"\">";
				out.println("<td>"+ahref2+"▶</a></td>");
			}


			String ahref3 = "<a href="+url+"from="+((total_pagecnt-1)*list_cnt_perpage+1)+">";
			out.println("<td>"+ahref3+"끝</a></td>");
		
		out.println("<tr>");
		
%>
</table>
<br>
</div>
<div style="width = 1000; height=800;" align= center>
<table width=1000>
	<tr>
		<td width=35 height=50 style = "cursor:pointer;" onClick = "window.location='stock_insert.jsp?from1=<%=from%>' " onMouseOver = "window.location='stock_insert.jsp?from1=<%=from%>" onMouseOut = " window.status = ''">
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