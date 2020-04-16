package joa.Repo;


import joa.Domain.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import joa.Domain.Review;

public class ReviewRepo {
		

	public static Connection getConnection() { //DB
		Connection con=null;
		try {
		String className="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://192.168.226.129:3306/";
		//String url="jdbc:mysql://192.168.56.1:3306/";
		String db="kopo09";
		String setup="?serverTimezone=UTC";
		String id="root";
		String password="tkdrl123";
		
		Class.forName(className);
		 con = DriverManager.getConnection(url+db+setup,id,password);
		//DB�� ����
		}catch(Exception e) {
			System.out.println(e);
			
		}
		
		return con;
		
	}
	public static int createDB() {
		int status=0;		
		
		try {
			Connection con=getConnection();
			Statement stmt = con.createStatement();
			String sql="create table if not exists review(id int not null primary key auto_increment," + 
					"						title varchar(70)," + 
					"						date date,\r\n" + 
					"						content text,\r\n" + 
					"rootid int, relevel int, recnt int, viewcnt int,filename varchar(100))" + 
					"						DEFAULT CHARSET=utf8;" + 
					"";
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		return status;
	}
	public static int dropDB() {
		int status=0;		
		
		try {
			Connection con=getConnection();
			Statement stmt = con.createStatement();
			String sql="drop table Review3;";
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		return status;
	}
	public static int save(Review g) {
		int status=0;
		try {
			Connection con=getConnection();
			String sql="insert into review(id,title,date,content,rootid,relevel,recnt,viewcnt,filename) "
			+"values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, g.getId());
			ps.setString(2, g.getTitle());
			ps.setDate(3, (Date) g.getDate());
			ps.setString(4, g.getContent());
			ps.setInt(5, g.getRootid());
			ps.setInt(6, g.getRelevel());
			ps.setInt(7,g.getRecnt());
			ps.setInt(8,g.getViewcnt());
			ps.setString(9, g.getFilename());
			status=ps.executeUpdate();
			ps.close();
			con.close();
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		return status;
		
	}
	public static int update(Review g) {//업데이트
		int status=0;
		try {
			Connection con=getConnection();
			String sql="update review set id=?, title=?, date=?,content=?,rootid=?,relevel=?,recnt=?,viewcnt=?,filename=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, g.getId());
			ps.setString(2, g.getTitle());
			ps.setDate(3,(Date) g.getDate());
			ps.setString(4, g.getContent());
			ps.setInt(5, g.getRootid());
			ps.setInt(6, g.getRelevel());
			ps.setInt(7,g.getRecnt());
			ps.setInt(8,g.getViewcnt());
			ps.setString(9,g.getFilename());
			status=ps.executeUpdate();
			ps.close();
			con.close();
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		
		return status;
		
	}
	public static int delete(Review g) {
		int status=0;
		try {
			Connection con=getConnection();
			String sql="delete from review where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, g.getId());
			status=ps.executeUpdate();
			
			ps.close();
			con.close();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		
		return status;
		
	}
	public static List<Review> getAllRecords(){
		List<Review> list = new ArrayList<Review>();
		
		try {
			Connection con=getConnection();
			String sql = "select * from review order by rootid desc, recnt asc,id asc";
			//String sql="select * from notice";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			int cnt=0;
			
			while(rs.next()) {
				cnt++;
				Review g = new Review();
				g.setId(rs.getInt("id"));
				g.setTitle(rs.getString("title"));
				g.setDate(rs.getDate("date"));
				g.setContent(rs.getString("content"));
				g.setRootid(rs.getInt("rootid"));
				g.setRelevel(rs.getInt("relevel"));
				g.setRecnt(rs.getInt("recnt"));
				g.setViewcnt(rs.getInt("viewcnt"));
				g.setFilename(rs.getString("filename"));
				list.add(g);
				System.out.println("삽입 성공 "+cnt+"회");
				
			}
			
		rs.close();
		ps.close();
		con.close();
			
		}
		catch(Exception e) {
			
		}
		return list;
	}
	
	
	
	public static Review getRecordById(int id) {//ID로 레코드 조회
		Review g=new Review();
		try {
			Connection con=getConnection();
			String sql="select * from review where id=?";
			PreparedStatement ps = con.prepareStatement(sql);	
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				g.setId(rs.getInt("id"));
				g.setTitle(rs.getString("title"));
				g.setDate(rs.getDate("date"));
				g.setContent(rs.getString("content"));
				g.setRootid(rs.getInt("rootid"));
				g.setRelevel(rs.getInt("relevel"));
				g.setRecnt(rs.getInt("recnt"));
				g.setViewcnt(rs.getInt("viewcnt"));
				g.setFilename(rs.getString("filename"));
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return g;
	}
	
	public static List<Review> getPage(int from, int cnt) {//from은 어디부터 , cnt는 개수
		
		List<Review> list = new ArrayList<>();
		
		try {
			Connection con=getConnection();
			String sql="select * from review order by rootid desc, recnt asc,id asc limit "+(from-1)+","+cnt;
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {//목록을 불러와 저장
				Review g=new Review();
				g.setId(rs.getInt("id"));
				g.setTitle(rs.getString("title"));
				g.setDate(rs.getDate("date"));
				g.setContent(rs.getString("content"));
				g.setRootid(rs.getInt("rootid"));
				g.setRelevel(rs.getInt("relevel"));
				g.setRecnt(rs.getInt("recnt"));
				g.setViewcnt(rs.getInt("viewcnt"));
				g.setFilename("filename");
				list.add(g);
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return list;

	}
	
	public static int next_number() {
		int next=0;
		int recordcnt=ReviewRepo.getAllRecords().size();
		int max=0;
		ArrayList<Integer> arr = new ArrayList<>();
		if(recordcnt>0) {
		for(int i=0;i<recordcnt;i++) {
			arr.add(ReviewRepo.getAllRecords().get(i).getId());
		}
			max=(int)Collections.max(arr);
		}else {
			max=0;
		}
		System.out.println("총 레코드 수 : "+recordcnt);
		if(recordcnt>0) {
			
			next=max+1;
			System.out.println("다음 숫자 : "+next);
			
		}else {
			next=1;
		}
		
		return next;
		
	}
	
	public static int reinsert(int rootid,int relevel, int recnt) {
		
		String sql="update review set recnt=recnt+1 where rootid="+rootid+" and recnt>"+(recnt);
		try {
			Connection con=getConnection();
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	
	
	
}
