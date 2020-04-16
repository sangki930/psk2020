package joa.Resv_service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.sql.*;

import joa.DTO.ResvSIO;
import joa.Domain.ResvRIO;
import joa.Resv_Repo.ReserveRepo;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;

public class ResvService implements ResvServ {

	@Override
	public int Reservation(ResvSIO r) {
		// TODO Auto-generated method stub
		int status=0;
		//"insert into "+table+"(name,resv_date,room,addr,telnum,in_name,comment,write_date,processing) "
		//+"values(?,?,?,?,?,?,?,?,?)";
		
		ReserveRepo.save(r);
		
		return status;
	}

	@Override
	public int cancel(String date,String room) throws IllegalArgumentException, ParseException {
		// TODO Auto-generated method stub
		int status=0;
		
		status=ReserveRepo.delete(ReserveRepo.getRecordByPkey(java.sql.Date.valueOf(LocalDate.parse(date)),Integer.parseInt(room)));
		//삭제 코드
		return status;
	}


	public String now() {//오늘 날짜 구하기(String 형)
		LocalDate today =LocalDate.now();
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		//한국시간을 기준으로 한다.
		
		return dformat.format(today);
		
	}

	@Override
	public int calDate(Date d, int iDay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Date convertToDate(LocalDate l) {//Date형으로 변환
		// TODO Auto-generated method stub
		Date d = new Date();
		
		
		return null;
	}

	public String getWeekday(LocalDate l) {
		// TODO Auto-generated method stub
		
		DayOfWeek weekday=l.getDayOfWeek();//요일을 얻음
		
		return weekday.getDisplayName(TextStyle.SHORT, Locale.KOREAN);//월,화...등으로 반환
	}

	public String getDay(LocalDate l) {
		
		return l.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
	}

	@Override
	public String getDayOftheWeek(LocalDate l) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<ResvSIO> setData(){//시험 데이터임
		
		ReserveRepo r = new ReserveRepo();//예약 목록
		List<ResvSIO> resv_list = new ArrayList<>();
		
		//"insert into "+table+"(name,resv_date,room,addr,telnum,in_name,comment,write_date,processing) "
				//+"values(?,?,?,?,?,?,?,?,?)";
		
		r.save(new ResvRIO("박상기",LocalDate.of(2020,02,02),1,"경기도 하남시 위례동","010-1111-2222","박상기","",LocalDate.now(),1));
		r.save(new ResvRIO("워크맨",LocalDate.of(2020,01,31),2,"경기도 성남시 분당구","010-3333-4444","JTBC","",LocalDate.now(),1));
		r.save(new ResvRIO("유튜버보겸",LocalDate.of(2020,01,25),3,"서울특별시 송파구 잠실본동","010-5555-6666","김보겸","",LocalDate.now(),1));
		
		return resv_list;
	}
	
	public String isReserved(LocalDate ld, int room) {
		
		
		return ReserveRepo.getName(ld, room);
		
	}
	
	
	public void createDB() {
		ReserveRepo r = new ReserveRepo();
		r.createDB();
	}
	
	public ResvSIO getOneRec(String date, String room){
		
		ResvRIO r = ReserveRepo.getRecordByPkey(java.sql.Date.valueOf(LocalDate.parse(date)),Integer.parseInt(room));
		if(r==null) {
			System.out.println("r 객체는 비어 있습니다.");
		}
		//RIO를 선언 하나의 데이터를 가져옴
		
		return new ResvSIO(r.getName(),r.getResv_date(),r.getRoom(),r.getAddr(),r.getTelnum(),r.getIn_name(),r.getComment(),r.getWrite_date(),r.getProcessing());
	}
	
	public String getRoom(int r) {
		
		String room="";
		
		switch(r) {
		case 1: 
			room="VIP룸";
			break;
		case 2:
			room="일반적인 룸";
			break;
		case 3:
			room="합리적인 룸";
			break;
		default:
			room="알 수 없음";
			break;
		
		}
		return room;
	}

	@Override
	public int cancel() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int update(ResvSIO r) {
		int status=0;
		
		status=ReserveRepo.update(new ResvRIO(r.getName(),r.getResv_date(),r.getRoom(),r.getAddr(),r.getTelnum(),r.getIn_name(),r.getComment(),r.getWrite_date(),r.getProcessing()));
		
		return status;
	}
	
	
}
