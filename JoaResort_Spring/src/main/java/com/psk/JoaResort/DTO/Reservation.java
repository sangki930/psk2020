package com.psk.JoaResort.DTO;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Reservation {
	
	Long id;//예약번호
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
}
