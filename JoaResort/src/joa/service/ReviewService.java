package joa.service;

import java.util.List;

import joa.DTO.*;

public interface ReviewService {

	void createDB(); //테이블 생성
	void dropDB(); //테이블 드랍
	
	int insert(ReviewSIO reviewSIO);
	
	ReviewSIO selectOne(int id);
	List<ReviewSIO> selectAll();
	List<ReviewSIO> selectAllById(int id);
	
	List<ReviewSIO> pageNation(int from,int cnt);//from : 어디부터 ,cnt : 개수
	
	
	int update(int id, ReviewSIO reviewSIO);
	int update(ReviewSIO reviewSIO);
	
	int update_reply(int id, int recnt, ReviewSIO reviewSIO);
	
	int delete(int id);
	int delete(ReviewSIO reviewSIO);
	
	
	
	
	
}
