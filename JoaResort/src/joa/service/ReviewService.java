package joa.service;

import java.util.List;

import joa.DTO.*;

public interface ReviewService {

	void createDB(); //���̺� ����
	void dropDB(); //���̺� ���
	
	int insert(ReviewSIO reviewSIO);
	
	ReviewSIO selectOne(int id);
	List<ReviewSIO> selectAll();
	List<ReviewSIO> selectAllById(int id);
	
	List<ReviewSIO> pageNation(int from,int cnt);//from : ������ ,cnt : ����
	
	
	int update(int id, ReviewSIO reviewSIO);
	int update(ReviewSIO reviewSIO);
	
	int update_reply(int id, int recnt, ReviewSIO reviewSIO);
	
	int delete(int id);
	int delete(ReviewSIO reviewSIO);
	
	
	
	
	
}
