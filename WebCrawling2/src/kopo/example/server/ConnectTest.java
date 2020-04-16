package kopo.example.server;

import java.sql.*;

public class ConnectTest {
	public static void main(String[] args) {
		Connection con =null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://192.168.226.129:3306/kopo09?characterEncoding=UTF-8&serverTimezone=UTC";
			con=DriverManager.getConnection(url,"root","tkdrl123");
			System.out.println("접속확인");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
