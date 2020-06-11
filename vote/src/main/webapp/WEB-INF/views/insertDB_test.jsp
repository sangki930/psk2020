<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"
	import="javax.sql.*"
	import="java.io.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("UTF-8");//request로 받을 때, 한글깨짐 방지

//int studentid = Integer.parseInt(request.getParameter("studentid"));//학번

int id=0;
int age=0;
int rec=1000;//넣고 싶은 레코드 수
int nominate_cnt=4;//후보자 수
int unit=1000;//addbatch에 담을 개수 (메모리 고려)
//예를 들면 unit=1000이면 1000개씩 쿼리문을 Batch에 담는다.
%>
<meta charset="UTF-8">
<title>insertDB</title>
</head>
<body>
<h1>성적입력추가완료</h1>
<br>
<br>
<%

		Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
//Connection conn = Connection conn = DriverManager.getConnection("jdbc:mysql://(리눅스IP):3306/(DB이름)","(접속계정이름)","(계정비밀번호)");

		String sql = "insert ignore into tupyo_table(id,age) values(?,?)";//삽입
		String sql2 = "select count(*) from hubo_table"; //후보수 알아내기
		
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql2);//먼저 후보수를 알아내기 위한
		
		ResultSet rs = pstmt.executeQuery(sql2);
		rs.next();
		nominate_cnt = rs.getInt(1);
		pstmt.clearParameters();
		pstmt=conn.prepareStatement(sql);
		
		
		conn.setAutoCommit(false);//이코드는 자동 커밋을 켜야함
		Random r=new Random();
		for(int i=1;i<=rec;i++){
			
			//name = "학생"+i;
			id = r.nextInt(nominate_cnt)+1;//1부터 후보자수까지 랜덤
			age = r.nextInt(8)+1;//1~9까지 랜덤(세대가 10~90대이므로)
			
		pstmt.setInt(1,id);//이전페이지에서 가져온 파라미터값 대입(name)
		//out.println("name : 세팅 성공");
		//pstmt.setInt(2,studentid);//이전페이지에서 가져온 파라미터값 대입(student)*/
		pstmt.setInt(2,age);//이전페이지에서 가져온 파라미터값 대입(kor)
		//pstmt.setInt(2,kor);//이전페이지에서 가져온 파라미터값 대입(kor)
		//out.println("kor : 세팅 성공");
	
		//int rec=pstmt.executeUpdate();
		//pstmt.execute("drop table examtable;");//테이블 지우기
		
		//rs=pstmt.getGeneratedKeys();//auto_increment로 된 값 가져오기
		//studentid  = (rs.next())? rs.getInt(1):0;//ResultSet객체의 성질을 이용한 studentid 가져오기
		
		pstmt.addBatch();
		pstmt.clearParameters();
		  if( (i % 1000) == 0){
              // Batch 실행
              System.out.println(pstmt.executeBatch());//executeBatch실행 인증
              //위 메소드로 캐시에 담아있던 쿼리문들이 일괄 실행함
              System.out.println("executeBatch()성공");
              // Batch 초기화
              pstmt.clearBatch();
              // 커밋
              conn.commit() ;
               
          }
		
		}
		
		pstmt.executeBatch();
		
		pstmt.clearBatch();
		conn.commit();
		
		out.println("1000개 삽입완료");
		
		pstmt.close();
		conn.close();
	
		//아래 4줄은 뒤로가기 버튼 구현
		out.println("<button onclick=\"goBack();\">뒤로가기</button>");
		out.println("<script language=\"javascript\">");
		out.println("function goBack(){window.history.back(-1);}");
		out.println("</script>");
		

%>
</body>
</html>