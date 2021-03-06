<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
	import="java.text.*"
    pageEncoding="UTF-8"%>
<%@ page import="joa.service.gongjiServiceimple"%>
<%@ page import="joa.DTO.*"%>
<%@ page import="joa.service.*"%>
<%@ page import="joa.Domain.*"%>
<%@ page import="joa.Repo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/common.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/common.js"></script>  
<script src="js/jquery.smooth-scroll.min.js"></script> 
<title>조아리조트에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--  <link rel="stylesheet" href="Rooms.css"> -->

<%!

	String addimage = "<img src='bluearrow.jpg' width=20 height=20 />";
	
	public String addimg(int relevel){
		String add="";
		
		for(int i=1;i<=relevel;i++){
			
			add+=addimage;
		}
		
		return add;
	} 

%>
</head>
<body>

<%
	String login_ok="no";
	String login_id="";
	
	if(session.getAttribute("login_ok")!=null){
		login_ok=(String)session.getAttribute("login_ok");
	}else{
		login_ok="no";
	}
	//System.out.println("로그인 확인 : "+(String)session.getAttribute("login_ok"));
	//System.out.println("로그인 확인 : "+login_ok);
	if(session.getAttribute("login_id")!=null){
		login_id=session.getAttribute("login_id").toString();
	}
	System.out.println("로그인 확인 : "+login_id);
	
%>
<jsp:include page="loginHeader.jsp" flush="false"> 
<jsp:param value="loginHeader" name="header"/>
<jsp:param value="<%=login_ok%>" name="login_ok"/>
</jsp:include>

<jsp:include page="header.jsp" flush="false"> 
<jsp:param value="list" name="menu"/>
</jsp:include>

<%
  int from=1;
  int cnt=10;
  
    
  gongjiRepo g= new gongjiRepo();
	//g.createDB();
	
	  gongjiServiceimple gsi = new gongjiServiceimple();
	  gongjiPage gp = new gongjiPage(from,cnt);
	  List<gongjiSIO> l=gsi.pageNation(from,cnt);
  
	  int start_page=gp.getStartpage();//시작페이지
	  int end_page=gp.getEndpage();//끝페이지
	  int list_cnt_perpage=10;//페이지 네이션의 개수
	  int p=gp.getPresentpage();//현재 페이지
	  int total_pagecnt=gp.getTotalpage();//총 페이지수
  	  int next=gp.getNext();//다음 페이지
  	  int prev=gp.getPrev();//이전 페이지
  	  int next_nation=gp.getNext_nation();//>>의 from 값
  	  int prev_nation=gp.getPrev_nation();//<<의 from 값
  	  
  	  
  	  System.out.println("");
  	  
  	  System.out.println("리스트 개수 : "+l.size());
  
  	  
  	  %>
  	  
  	    <input name="from" type="hidden" value="<%=from%>">

		<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<h2 style="font-size : 40px; margin : 10px 10px 10px 10px">공지사항</h2>
			<!-- <form action="#" class="minisrch_form">
				<fieldset>
					<legend>검색</legend>
					<input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<a href="javascript:;" class="btn_srch">검색</a>
				</fieldset>
			</form> -->
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
  	  <%
  	 
  	  if(l.size()>0){ 
  	  %>
  	
				<tbody>
				<%
			        //<%=out.println(addimg(l.get(i).getRelevel()))
			        
			        
			        for(int i=from-1;i<from+l.size()-1;i++){
			        	System.out.println(addimg(l.get(i).getRelevel()));
			       %>
					<tr>
						<td><%=l.get(i).getId()%></td>
						<td class="tit_notice"><a href='e_01_view.jsp?id=<%=l.get(i).getId()%>' id="view"><%=addimg(l.get(i).getRelevel())%><%=l.get(i).getTitle()%></a> </td>
						<td><%=l.get(i).getViewcnt()%></td>
						<td><%=l.get(i).getDate()%></td>
					</tr>
				 <%
				          
				          }
						
					 }//l.size()>0일때
				     else{
				     	
				     	%>
				     	 <tr>
				            <td class="a" colspan="3">게시글이 없습니다.</td>
				            
				          </tr>
				     	<%
				     }
					%>
          
				</tbody>
			</table>
			<!-- pagination -->
			<%
			        String url="e_01.jsp?from=";
			  %>
			<div class="pagination">
					<a href="<%=url%>1" class="firstpage  pbtn"><img src="img/btn_firstpage.png" alt="첫 페이지로 이동">
					<%
				
					if(p>1){//첫 페이지가 아니면
					%>
					<a class="page-link" href="<%=url%><%=((p-2)*list_cnt_perpage+1)%>"><img src="img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
					<%
					}
						for(int i=start_page;i<start_page+10;i++){
						if(i<=total_pagecnt){
						if(i==p){
						%>
						<a class="page-link" href="<%=url%><%=(((i-1)*list_cnt_perpage)+1)%>"><%=i%></a>
						
						<%
						}else{
							
							%>
						<li class="page-item"><a class="page-link" href="<%=url%><%=(((i-1)*list_cnt_perpage)+1)%>"><%=i%></a></li>
							<%							
						}
						}else{
							
						}
						
						}
						if(p<total_pagecnt){
					%>
						<a class="nextpage  pbtn" href="<%=url%><%=(p*list_cnt_perpage+1)%>" ><img src="img/btn_nextpage.png" alt="다음 페이지로 이동"></a><!--  다음페이지 -->
						
						<%
						}
						%>
						<a href="javascript:;" class="lastpage  pbtn"><img src="img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			
			
			
			
				<%-- <a href="<%=url%>1" class="firstpage  pbtn"><img src="img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				<a href="javascript:;" class="prevpage  pbtn"><img src="img/btn_prevpage.png" alt="이전 페이지로 이동"></a> --%>
				<!-- <a href="javascript:;"><span class="pagenum currentpage">1</span></a>
				<a href="javascript:;"><span class="pagenum">2</span></a>
				<a href="javascript:;"><span class="pagenum">3</span></a>
				<a href="javascript:;"><span class="pagenum">4</span></a>
				<a href="javascript:;"><span class="pagenum">5</span></a>
				<a href="javascript:;" class="nextpage  pbtn"><img src="img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				<a href="javascript:;" class="lastpage  pbtn"><img src="img/btn_lastpage.png" alt="마지막 페이지로 이동"></a> -->
				
			</div>
			<!-- //pagination -->
			
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->
	
	<jsp:include page="footer.jsp" flush="false"> 
	<jsp:param value="list" name="menu"/>
	</jsp:include>
</body>
</html>