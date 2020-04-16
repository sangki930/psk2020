package adm.Repo;

import java.sql.*;


import adm.domain.adminRIO;

public class admRepo {
	
	//DB 접속 선언
	static final String class_name="com.mysql.cj.jdbc.Driver";
	static final String connecturl="jdbc:mysql://192.168.226.129:3306/";
	static final String database="kopo09";
	static final String setup="?serverTimezone=UTC";
	
	public static Connection getConnection() { //DB접속 메소드
		
		Connection con=null;
		try {
		Class.forName(class_name);
		 con = DriverManager.getConnection(connecturl+database+setup,"root","tkdrl123");
		//DB접속
		 System.out.println("DB Connect!!");
		}catch(Exception e) {
			System.out.println("DB Connect FAILED!!");
			System.out.println(e);
			
		}
		
		return con;
		
	}
	
	public static void createDB() {
		
		Connection con = getConnection();
		String sql ="create table if not exists adminfo ( "+
					"id varchar(20) primary key not null, "+
					"password varchar(20) ) " +
					"DEFAULT CHARSET=utf8";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.execute(sql);
			System.out.println("create table!!");
			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("create table!! FAIL");
			e.printStackTrace();
		}
		
	}
	public static void insertDB(String id,String password) {
		//id 글자수 제한
		Connection con = getConnection();
		String sql ="insert into adminfo(id,password) values (?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			ps.executeUpdate();
			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static adminRIO getAccount(String id, String password) {
		
		String getId="";
		String getPassword="";
		Connection con = getConnection();
		String sql ="select * from adminfo where id=? and password=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery(sql);
			if(rs.next()) {
				getId=rs.getString(1);
				getPassword=rs.getString(2);
			}
			
			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return new adminRIO(id,password);
	}
	
	
	
	
	
}
