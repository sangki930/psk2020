package joa.service;

import java.util.List;

import joa.DTO.gongjiSIO;

public interface gongjiService {
	
	void createDB(); //���̺� ����
	void dropDB(); //���̺� ���
	
	int insert(gongjiSIO gongjiSIO);
	
	gongjiSIO selectOne(int id);
	List<gongjiSIO> selectAll();
	List<gongjiSIO> selectAllById(int id);
	
	List<gongjiSIO> pageNation(int from,int cnt);//from : ������ ,cnt : ����
	
	
	int update(int id, gongjiSIO gongjiSIO);
	int update(gongjiSIO gongjiSIO);
	
	int update_reply(int id, int recnt, gongjiSIO gongjiSIO);
	
	int delete(int id);
	int delete(gongjiSIO gongjiSIO);
	
	
}
