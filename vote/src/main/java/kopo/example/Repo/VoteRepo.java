package kopo.example.Repo;

import kopo.example.domain.*;

import java.sql.*;
import java.util.*;


public class VoteRepo {

	
	public static Connection getConnection() {
		Connection con=null;
		try{
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
			String dbURL = "jdbc:mysql://192.168.226.129:3306/kopo09?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID="root";
			String dbPW="tkdrl123";
			con=DriverManager.getConnection(dbURL,dbID,dbPW);
			
			//Connection con = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
			//con = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?characterEncoding=UTF-8&serverTimezone=UTC","root","tkdrl123");
			
			
			
		}catch(Exception e){
			System.out.println("The error is : "+e);
		}
		
		return con;
	}
	

	public static int createDB() {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="create table if not exists vote_table("
					+"id int, age int, FOREIGN KEY (id) REFERENCES hubo_table1(id) ON DELETE CASCADE)"
					+"DEFAULT CHARSET=utf8;";
			PreparedStatement ps = con.prepareStatement(sql);
			
					
			ps.executeUpdate(sql);
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("The error is : "+e);
		}
		return status;
	}
	public static int dropDB() {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="drop table if exists %s";
			PreparedStatement ps = con.prepareStatement(sql=String.format(sql,"vote_table"));
			//보안성을 위해 PreparedStatement 클래스를 씀
					
			ps.executeUpdate(sql);
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int insert(VoteRIO v) {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="insert into vote_table(id,age) values(?,?);";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,v.getId());
			ps.setInt(2, v.getAge());
					
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
	
	public static int update(VoteRIO v) {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="update vote_table set id=? name=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,v.getId());
			ps.setInt(2, v.getAge());
			ps.setInt(3, v.getId());//아이디를 검색하여 찾음
					
			ps.executeUpdate(sql);
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
	public static int delete(VoteRIO v) {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="delete from vote_table where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,v.getId());
					
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
	
	public static List<VoteRIO> readAll() { //모든 후보를 읽는 부분
		
		List<VoteRIO> list = new ArrayList<VoteRIO>();
		
		
		try{
			Connection con=getConnection();
			String sql="select * from vote_table";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				VoteRIO h = new VoteRIO();//후보 데이터를 저장하기 위해 선언
				h.setId(rs.getInt("id"));
				h.setAge(rs.getInt("age"));
				list.add(h);
			}
			
					
			ps.executeQuery(sql);
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return list;
		
		
	}

	public static List<VoteRIO> readOne(int id) { //후보하나를 고름
		
		VoteRIO h = new VoteRIO();
		List<VoteRIO> l=new ArrayList<>();
		
		try{
			Connection con=getConnection();
			String sql="select * from vote_table where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				h.setId(id);
				h.setAge(rs.getInt(2));
				l.add(h);
			}
			System.out.println("기호 " + id +"번의 개수 : "+l.size());	
			
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return l;
	}
	
	public static int count_record(HuboRIO h) {
		int count=0;
		List<VoteRIO> l=readOne(h.getId());
		count = l.size();
		return count;
		
	}
	
	public static int count_record(int id) {
		int count=0;
		List<VoteRIO> l=readOne(id);
		count = l.size();
		return count;
		
	}
	
	public static List<AgeCount> AgeCount(int id) {
		
		List<AgeCount> l=new ArrayList<>();
		int sum=count_record(id);
		
		
		try{
			Connection con=getConnection();
			String sql="select age*10,count(*) from vote_table where id="+id+" group by age";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			//ps.setInt(1,id);
			//ps.setInt(2,age);
			ResultSet rs = ps.executeQuery();
			
			for(int i=10;i<100;i=i+10) {
				if(rs.isLast()==false){//커서의 위치가 마지막이 아니면
					rs.next();
					}
				if(i==rs.getInt(1)) {
					
					l.add(new AgeCount(rs.getInt(1),rs.getInt(2),sum,Math.round((((double)rs.getInt(2))/sum)*100.0)));
					System.out.println(i+"대"+" 개수는 : "+rs.getInt(2));
					
				}
				else {
					l.add(new AgeCount(rs.getInt(1),0,sum,0));
					System.out.println(i+"대"+" 개수는 : "+ 0);
					rs.previous();
				}
				
			}
	
			
			System.out.println("기호 " + id +"번의 개수 : "+l.size());	
			
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return l;
		
	}
	
	
	//readPage
	
	
}
