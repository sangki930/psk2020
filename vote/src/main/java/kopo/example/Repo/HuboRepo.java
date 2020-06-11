package kopo.example.Repo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kopo.example.domain.*;
import kopo.example.domain.HuboRIO;
import kopo.example.dto.HuboSIO;

public class HuboRepo {

	
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
			System.out.println("The error is "+e);
		}
		
		return con;
	}
	

	public static int createDB() {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="create table if not exists hubo_table1("
					+"id int not null  AUTO_INCREMENT primary key, name varchar(20))"
					+"DEFAULT CHARSET=utf8;";//후보 테이블
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.executeUpdate(sql);
			ps.close();
			con.close();
			
		}catch(Exception e) {
			
		}
		return status;
	}
	public static int dropDB() {
		int status=0;
		try{
			Connection con=getConnection();
			Statement stmt = con.createStatement();
			String sql="drop table if exists hubo_table1";
					
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int insert(HuboRIO h) {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="insert into hubo_table1(id,name) values(?,?);";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,h.getId());
			ps.setString(2, h.getName());
					
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
	
	public static int update(HuboRIO h) {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="update hubo_table1 set id=? name=? where id=?;";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,h.getId());
			ps.setString(2, h.getName());
			ps.setInt(3, h.getId());//아이디를 검색하여 찾음
					
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
	public static int delete(HuboRIO h) {
		int status=0;
		try{
			Connection con=getConnection();
			String sql="delete from hubo_table1 where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,h.getId());
					
			System.out.println("후보 삭제 성공!");
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
			
		}
		return status;
		
	}
	
	public static List<HuboSIO> readAll() { //모든 후보를 읽는 부분
		
		List<HuboSIO> list = new ArrayList<HuboSIO>();
		
		
		try{
			Connection con=getConnection();
			String sql="select * from hubo_table1";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				HuboSIO h = new HuboSIO();//후보 데이터를 저장하기 위해 선언
				h.setId(rs.getInt("id"));
				h.setName(rs.getString("name"));
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
	
public static List<HuboRIO> readAllRecords() { //모든 후보를 읽는 부분
		
		List<HuboRIO> list = new ArrayList<HuboRIO>();
		
		
		try{
			Connection con=getConnection();
			String sql="select * from hubo_table1";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				HuboRIO h = new HuboRIO();//후보 데이터를 저장하기 위해 선언
				h.setId(rs.getInt("id"));
				h.setName(rs.getString("name"));
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
	

	public static HuboRIO readOne(int id) {
		
		HuboRIO h = new HuboRIO();
		
		try{
			Connection con=getConnection();
			String sql="select * from hubo_table1 where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			//sql 인젝션을 예방하기 위해 PreparedStatement 클래스로 쓴다.
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				h.setId(id);
				h.setName(rs.getString(2));
			}
				
			ps.executeQuery(sql);
			ps.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return h;
	}
	
	//readPage
	
	
}
