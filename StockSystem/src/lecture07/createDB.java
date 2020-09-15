package lecture07;

import java.sql.*;
import javax.sql.*;


public class createDB{

	public static void main(String[] args) throws ClassNotFoundException, SQLException {//레코드 생성
		// TODO Auto-generated method stub
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
		//DB에 접속
		Statement stmt = conn.createStatement();
		
		
		
		/*stmt.execute( "create table gongji("+//freewifi이라는 table 생성
				"id int not null primary key auto_increment,"+ //설치장소명
				"title varchar(70),"+//설치장소상세
				"date date,"+ //설치시도명
				"content text"+ //설치시군구명
				") DEFAULT CHARSET=utf8;");//utf-8로설정함으로 써 한글 사용 
		*/
		
		
		 stmt.execute("create table clobtest(CTEST1 VARCHAR(10),CTEST2 VARCHAR(10),C BLOB,REG_DT DATE,B BLOB);");
		 
		/*
		 stmt.execute("create table stock("+
		 "itemid int not null primary key auto_increment,"//상품번호
		 +"itemname varchar(50),"//아이템명
		 +"stocknum int,"//재고수
		 +"stockdate date," //재고 파악일
		 +"enrolldate date,"
		 +"descitem varchar(100),"+"img MEDIUMBLOB) DEFAULT CHARSET=utf8;");//재고 등록일
		  */
		//MEDIUMBLOB : 이미지는 16mb까지 저장할 수 있음
		System.out.println("테이블 생성 성공");
	
		
		stmt.close();
		conn.close();
	}

}