<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.net.URLEncoder"
	import="java.io.FileInputStream"
	import="java.io.File"
    pageEncoding="UTF-8"%>
   <%
   
   //관례적인 표현
   //파일 읽기 <-- 파일의 MIME(유형) <-->유형이 없을 때
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filedownload.jsp</title>
</head>
<body>
<h3>파일다운로드</h3>
<%
	//파일을 다운로드 할 때 파일의 제목이 인코딩에 따라 제목이 깨질 수 있다.
	//그러므로 인코딩이 필요함
	//FileInputStream : byte Stream-여러 유혀으이 byte 단위 읽기 전송
	//FileReader : char Stream-문자 최적화
	
	String fileName=request.getParameter("filename");

	//업로드 폴더 위치와 업로 폴더의 이름을 알아야한다.
	String savePath="upload";
	ServletContext context = getServletContext();
	
	//갖고 온 위치에 연결해서 파일을 다운로드 받으면 된다.
	String sDownPath = context.getRealPath(savePath);
	
	System.out.print("다운로드 위치:"+sDownPath);
	
	String sFilePath = sDownPath+"\\"+fileName;//문자열
	
	//sFilePath로 파일로 인식한다.
	File f = new File(sFilePath);
	
	//읽어와야할 용량은 최대 업로드 용량을 초과하지 않는다.
	byte[]  b= new byte[5*1024*1024];
	
	FileInputStream in = new FileInputStream(f);
	
	//유형확인 - 읽어올 경로의 파일의 유형 - >페이지 생성할 때 타입을 설정해야 한다.
	String sMimeType = getServletContext().getMimeType(sFilePath);
	
	System.out.println("유형 :"+ sMimeType);
	
	//지정되지 않은 유형 예외처리
	
	if(sMimeType==null){
		// 관례적인 표현
		sMimeType="application.octec-stream"; //일련된 8bit 스트림 형식
		//유형이 알려지지 않은 파일에 대한 읽기 형식 지정
		
	}
	
	//파일 다운로드 시작
	//유형을 알려준다.
	response.setContentType(sMimeType);// text/html; charset=utf-8을 대체
	
	//업로드 파일의 제목이 깨질 수 있다. URLEncode
	//String sEncoding = new String(fileName.getBytes())
	String A = new String(fileName.getBytes("euc-kr"),"8859_1");
	String B = "utf-8";
	String sEncoding = URLEncoder.encode(A,B);
	
	//기타 내용을 헤더에 올려야한다.
	//기타 내용을 보고 브라우저에서 다운로드 시 화면에 출려시켜준다.
	
	String AA="Content-Disposition";
	String BB="attachment; filename="+sEncoding;
	response.setHeader(AA,BB);
	
	//브라우저에 쓰기
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead=0;
	
	//바이트 배열 b의 0번퉈 numRead번까지 브라우저로 출력
	while((numRead=in.read(b,0,b.length))!=-1){
		out2.write(b,0,numRead);
	}
	out2.flush();
	out2.close();
	in.close();
%>

</body>
</html>