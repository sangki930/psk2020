package joa.Resv_Repo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import joa.DTO.ResvSIO;
import joa.Domain.ResvRIO;
import joa.Domain.gongji;

public class ReserveRepo {

	static String table="reserve";
	
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
		String connect=url+db+setup;
		
		Class.forName(className);
		 con = DriverManager.getConnection(connect,id,password);
		//DB접속
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
			String sql="create table if not exists "+table+" ( "+
					"name varchar(20), "+   //성명	
					"resv_date date not null, "+  //예약일
					"room int not null, "+ //예약방 1:VIP룸 2:일반룸 3:합리적인룸
					"addr varchar(100), "+  //주소
					"telnum varchar(20), "+ //연락처
					"in_name  varchar(20), "+ //입금자명
					"comment  text, "+ //남기실말
					"write_date date, "+// 예약한(이 글을 쓴) 날짜
					"processing int, "+//현재 진행 1:예약완료 2: 입금완료(예약확정) 3: 환불요청 4:...
					"primary key (resv_date,room) )"+  // 예약일과 룸을 합쳐서 DB의 키로 사용
					"DEFAULT CHARSET=utf8"; 
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
			String sql="drop table "+table+";";
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		return status;
	}
	public static int save(ResvRIO r) {//RIO를 받음
		int status=0;
		try {
			Connection con=getConnection();
			String sql="insert into "+table+"(name,resv_date,room,addr,telnum,in_name,comment,write_date,processing) "
			+"values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, r.getName());
			ps.setDate(2, Date.valueOf(r.getResv_date()));
			ps.setInt(3, r.getRoom());
			ps.setString(4, r.getAddr());
			ps.setString(5, r.getTelnum());
			ps.setString(6, r.getIn_name());
			ps.setString(7,r.getComment());
			ps.setDate(8,Date.valueOf(r.getWrite_date()));
			ps.setInt(9, r.getProcessing());
			status=ps.executeUpdate();
			ps.close();
			con.close();
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		return status;
		
	}
	
	public static int save(ResvSIO r) {//SIO를 받음
		int status=0;
		try {
			Connection con=getConnection();
			String sql="insert into "+table+"(name,resv_date,room,addr,telnum,in_name,comment,write_date,processing) "
			+"values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			
			System.out.println("날짜 확인 :"+Date.valueOf(r.getResv_date().plusDays(1)));
			ps.setString(1, r.getName());
			ps.setDate(2, Date.valueOf(r.getResv_date().plusDays(1)));//하루 늦게 들어가는 경우도 있어 하루를 추가
			ps.setInt(3, r.getRoom());
			ps.setString(4, r.getAddr());
			ps.setString(5, r.getTelnum());
			ps.setString(6, r.getIn_name());
			ps.setString(7,r.getComment());
			ps.setDate(8,Date.valueOf(r.getWrite_date()));
			ps.setInt(9, r.getProcessing());
			status=ps.executeUpdate();
			ps.close();
			con.close();
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		return status;
		
	}
	
	public static int update(ResvRIO r) {
		int status=0;
		try {
			Connection con=getConnection();
			String sql="update "+table+" set name=?, resv_date=?,room=?, addr=?,telnum=?,in_name=?,comment=?,write_date=?,processing=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, r.getName());
			ps.setDate(2, Date.valueOf(r.getResv_date()));
			ps.setInt(3, r.getRoom());
			ps.setString(4, r.getAddr());
			ps.setString(5, r.getTelnum());
			ps.setString(6, r.getIn_name());
			ps.setString(7,r.getComment());
			ps.setDate(8,Date.valueOf(r.getWrite_date()));
			ps.setInt(9, r.getProcessing());
			status=ps.executeUpdate();
			ps.close();
			con.close();
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		
		return status;
		
	}
	public static int delete(ResvRIO r) throws ParseException {
		int status=0;
		try {
			Connection con=getConnection();
			String sql="delete from "+table+" where resv_date=? and room=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setDate(1, Date.valueOf(r.getResv_date()));
			//Date.ValueOf() : LocalDate 객체로 변환
			ps.setInt(2, r.getRoom());
			status=ps.executeUpdate();
			
			ps.close();
			con.close();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	
		
		return status;
		
	}
	
	public static List<ResvRIO> ResvRIO(){//모든 데이터 조회
		List<ResvRIO> list = new ArrayList<>();
		
		try {
			
			Connection con=getConnection();
			String sql = "select * from "+table;
			//String sql="select * from notice";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			int cnt=0;
			
			while(rs.next()) {
				cnt++;
				ResvRIO r = new ResvRIO();
				r.setName(rs.getString("name"));
				r.setResv_date(rs.getDate("resv_date").toLocalDate());
				r.setRoom(rs.getInt("room"));
				r.setAddr(rs.getString("addr"));
				r.setTelnum(rs.getString("telnum"));
				r.setIn_name(rs.getString("in_name"));
				r.setComment(rs.getString("comment"));
				r.setWrite_date(rs.getDate("write_date").toLocalDate());
				r.setProcessing(rs.getInt("processing"));
				
				
				list.add(r);
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
	
	
	
	public static ResvRIO getRecordByPkey(Date resv_date,int room) {
		ResvRIO r=new ResvRIO();
		String date=resv_date.toLocalDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		//String으로 변환
		try {
			Connection con=getConnection();
			System.out.println("getRecordByPkey에서 Date: "+date);
			System.out.println("getRecordByPkey에서 Room: "+room);
			String sql="select * from reserve where resv_date='"+date+"' and room="+room+"";
			PreparedStatement ps = con.prepareStatement(sql);	
			//ps.setDate(1, resv_date);
			//ps.setInt(1, room);
			ResultSet rs=ps.executeQuery(sql);
			if(rs.next()) {
				r.setName(rs.getString("name"));
				r.setResv_date(rs.getDate("resv_date").toLocalDate());
				//toLocalDate : Date객체에서 LocalDate로 변환
				r.setRoom(rs.getInt("room"));
				r.setAddr(rs.getString("addr"));
				r.setTelnum(rs.getString("telnum"));
				r.setIn_name(rs.getString("in_name"));
				r.setComment(rs.getString("comment"));
				r.setWrite_date(rs.getDate("write_date").toLocalDate());
				r.setProcessing(rs.getInt("processing"));
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return r;
	}
	
	public static void setData() {
		
		ResvRIO r = new ResvRIO();
		
		for(int i=0;i<10;i++) {
			
			save(new ResvRIO());
			
		}
		
		
		
	}
	
	public static String getName(LocalDate ld, int room) {
		//ResvRIO r=new ResvRIO();
		String name="";
		String pattern="yyyy-MM-dd";
		try {
			Connection con=getConnection();
			String sql="select name from reserve where resv_date='"+ld.format(DateTimeFormatter.ofPattern(pattern))+"' and room=?";
			PreparedStatement ps = con.prepareStatement(sql);	
			//ps.setDate(1, Date.valueOf(ld));
			ps.setInt(1, room);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				name=rs.getString("name");
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return name;
		
	}
	
	
}
