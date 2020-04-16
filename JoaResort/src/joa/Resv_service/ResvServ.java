package joa.Resv_service;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.Date;

import joa.DTO.ResvSIO;

public interface ResvServ {
	
		public int Reservation(ResvSIO r);//예약
		public int cancel();//예약취소
		
		public int calDate(Date d, int iDay);
		public Date convertToDate(LocalDate l);
		public String getDayOftheWeek(LocalDate l);
		int cancel(String date, String room) throws IllegalArgumentException, ParseException;
		
		
}
