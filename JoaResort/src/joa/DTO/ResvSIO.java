package joa.DTO;

import java.time.LocalDate;
import java.util.Date;

public class ResvSIO {
	String name;//성명
	LocalDate resv_date;//예약날짜
	int room;//방 번호(1.VIP룸 2:일반룸 3:합리적인룸)
	String addr;//주소
	String telnum;//연락처
	String in_name;//입금자명
	String comment;//남기실 말
	LocalDate write_date;//예약한 날짜
	int processing;//진행 상태
	//진행상태 1: 예약완료 2: 입금완료(예약확정) 3:환불요청
	//진행상태 4: 예약불가
	public ResvSIO(String name, LocalDate resv_date, int room, String addr, String telnum, String in_name,
			String comment, LocalDate write_date, int processing) {
		super();
		this.name = name;
		this.resv_date = resv_date;
		this.room = room;
		this.addr = addr;
		this.telnum = telnum;
		this.in_name = in_name;
		this.comment = comment;
		this.write_date = write_date;
		this.processing = processing;
	}

	
	
	public int getProcessing() {
		return processing;
	}

	public ResvSIO(){
		
	}
	
	public ResvSIO(String name, LocalDate resv_date, int room, String addr, String telnum, String in_name, String comment,
			LocalDate write_date) {
		super();
		this.name = name;
		this.resv_date = resv_date;
		this.room = room;
		this.addr = addr;
		this.telnum = telnum;
		this.in_name = in_name;
		this.comment = comment;
		this.write_date = write_date;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public LocalDate getResv_date() {
		return resv_date;
	}
	public void setResv_date(LocalDate resv_date) {
		this.resv_date = resv_date;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTelnum() {
		return telnum;
	}
	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}
	public String getIn_name() {
		return in_name;
	}
	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public LocalDate getWrite_date() {
		return write_date;
	}
	public void setWrite_date(LocalDate write_date) {
		this.write_date = write_date;
	}

	public void setProcessing(int int1) {
		// TODO Auto-generated method stub
		
	}
	
	
}

