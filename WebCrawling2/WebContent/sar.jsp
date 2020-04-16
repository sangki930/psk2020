<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="javax.sql.*" %>
<%@ page contentType="text/xml; charset=UTF-8"%>
<data>
<%
{
	String command = "sar 1 1"; //실행할 명령어
	
	int linecount = 1;
	
	String line = "";
	
	Runtime rt = Runtime.getRuntime();//Runtime 객체 획득
	Process ps = null;
	
	try{
		
		ps = rt.exec(command);
		//ps=command를 실행한다.
		
		SequenceInputStream sis = new SequenceInputStream(ps.getInputStream(), ps.getErrorStream());
		InputStreamReader isr = new InputStreamReader(sis);
		BufferedReader br = new BufferedReader(isr);
		
		String retval[];
		
		while((line = br.readLine())!=null){
			if(linecount==4){//5번째 줄이 Average가 보이는 줄임
				retval=line.split(" ");
				int iCnt = 0;
				for(int i=0;i<retval.length;i++){
					retval[i]=retval[i].replaceAll(" ","");
					if(retval[i].isEmpty()){
						continue;
					}
					iCnt++;
					if(iCnt==1){
						out.println("<time>"+retval[i]+"</time>");
					}else if(iCnt==2){
						out.println("<apm>"+retval[i]+"</apm>");
					}else if(iCnt==3){
						out.println("<CPU>"+retval[i]+"</CPU>");
					}else if(iCnt==4){
						out.println("<user>"+retval[i]+"</user>");
					}else if(iCnt==5){
						out.println("<nice>"+retval[i]+"</nice>");
					}else if(iCnt==6){
						out.println("<system>"+retval[i]+"</system>");
					}else if(iCnt==7){
						out.println("<iowait>"+retval[i]+"</iowait>");
					}else if(iCnt==8){
						out.println("<steal>"+retval[i]+"</steal>");
					}else if(iCnt==9){
						out.println("<idle>"+retval[i]+"</idle>");
					}
				}
				
				
			}
			linecount++;
			
		}
		br.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

}
%>
</data>
