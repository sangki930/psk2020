package joa.service;

import java.util.List;

import joa.DTO.gongjiSIO;

public interface gongjiService {
	
	void createDB(); //테이블 생성
	void dropDB(); //테이블 드랍
	
	int insert(gongjiSIO gongjiSIO);
	
	gongjiSIO selectOne(int id);
	List<gongjiSIO> selectAll();
	List<gongjiSIO> selectAllById(int id);
	
	List<gongjiSIO> pageNation(int from,int cnt);//from : 어디부터 ,cnt : 개수
	
	
	int update(int id, gongjiSIO gongjiSIO);
	int update(gongjiSIO gongjiSIO);
	
	int update_reply(int id, int recnt, gongjiSIO gongjiSIO);
	
	int delete(int id);
	int delete(gongjiSIO gongjiSIO);
	
	
}
