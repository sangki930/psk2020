<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*,java.io.*,java.util.*,java.text.*"%>
<%@ page import="org.jsoup.nodes.*"%>
<%@ page import="org.jsoup.*"%>
<%@ page import="org.jsoup.select.Elements"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String url = "https://www.naver.com";
	 Pattern p = null;
	 Matcher m = null;
	 /* final String ONLY_NUM_PATTERN = "^[0-9]+$";//숫자만 나오는 정규식
     final String FILE_PATTERN = "^\\S+.(?i)(txt|pdf|hwp|xls)$"; */
     
	 final String SRC_PATTERN = "src=";
     final String CUSTOM_PATTERN = "정치";
	 int srccnt=0;
	 int polcnt=0;

		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();//Jsoup으로 해당 URL에 접속
		} catch (Exception e) {
			out.println(e);
		}
		Elements elements = doc.select("html");
		
		String naverhtml = elements.html();
		//System.out.println(naverhtml);
		
		p = Pattern.compile(SRC_PATTERN);//얻은 정규표현식(파일)으로부터 패턴을 만든다.
    	m = p.matcher(naverhtml);//만든 패턴에 맞춰 matcher 객체를 생성
    	
    	while(m.find()){
    		srccnt++;
    	}
    	
    	p = Pattern.compile(CUSTOM_PATTERN);//얻은 정규표현식(파일)으로부터 패턴을 만든다.
    	m = p.matcher(naverhtml);//만든 패턴에 맞춰 matcher 객체를 생성
    	
    	while(m.find()){
    		polcnt++;
    	}
    	
    	
		out.println("<h1>src= 개수 : " + srccnt+"</h1>");
		out.println("<h1>'정치' 개수 : " + polcnt+"</h1>");
		
	%>
</body>
</html>