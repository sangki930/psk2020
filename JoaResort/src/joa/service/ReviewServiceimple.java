package joa.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.*;
import java.sql.*;

import joa.DTO.ReviewPage;
import joa.DTO.ReviewSIO;
import joa.DTO.Review_pagelist;
import joa.Domain.Review;
import joa.Domain.Review;
import joa.Repo.ReviewRepo;

public class ReviewServiceimple{
	
	
	public java.sql.Date getDate() { //Date ��ü�� ������
		java.util.Date d = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date date= java.sql.Date.valueOf(sdf.format(d));
		//java.sql.Date�� ��ġ�Ƿ� �ݵ�� �̷��� �Ѵ�.
		return date;
		
	}
	
	public String getFormatDate() {
		Date d = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(d);
	}
	
	

	public void createDB() { //���񽺿��� ���̺� ����
		// TODO Auto-generated method stub
		ReviewRepo.createDB(); //���̺� ���� �޼ҵ� ����
	}

	public void dropDB() {//���̺� ���
		// TODO Auto-generated method stub
		ReviewRepo.dropDB();//���̺� ���
	}
	
	public int insert(ReviewSIO ReviewSIO) {//insert문 실행
		// TODO Auto-generated method stub
		return ReviewRepo.save(
				new Review(ReviewSIO.getId(),ReviewSIO.getTitle(),ReviewSIO.getDate(),
						ReviewSIO.getContent(),
						ReviewSIO.getRootid(),ReviewSIO.getRelevel(),ReviewSIO.getRecnt()
						,ReviewSIO.getViewcnt(),ReviewSIO.getFilename()));
	}

	public ReviewSIO selectOne(int id) { //한 레코드 고르기
		// TODO Auto-generated method stub
		Review g =  ReviewRepo.getRecordById(id);
		//select문으로 얻음
		//System.out.println("Filename 확인 :"+g.getFilename());
		return new ReviewSIO(g.getId(),g.getTitle(),g.getDate(),g.getContent(),
				g.getRootid(),g.getRelevel(),g.getRecnt(),g.getViewcnt(),g.getFilename());
	}

	public List<ReviewSIO> selectAll() {//��� �����͸� ��ȸ
		// TODO Auto-generated method stub
		List<Review> reviewlist = ReviewRepo.getAllRecords();
		List<ReviewSIO> Review = new ArrayList<ReviewSIO>();
		for(Review g : reviewlist) {
			
			Review.add(new ReviewSIO(
					g.getId(),g.getTitle(),g.getDate(),g.getContent(),g.getRootid(),
					g.getRelevel(),g.getRecnt(),g.getViewcnt(),g.getFilename()));
		}
		
		
		return Review;
	}

	public List<ReviewSIO> selectAllById(int id) {
		// TODO Auto-generated method stub
		List<Review> reviewlist = ReviewRepo.getAllRecords();
		List<ReviewSIO> Review = new ArrayList<ReviewSIO>();
		for(Review g : reviewlist) {
			
			Review.add(new ReviewSIO(
					g.getId(),g.getTitle(),g.getDate(),g.getContent(),g.getRootid(),
					g.getRelevel(),g.getRecnt(),g.getViewcnt(),g.getFilename()));
		}
		
		
		return Review;
	}

	public List<ReviewSIO> pageNation(int from,int cnt){//cnt��ŭ ���ڵ� ��������
		//from�� ������, cnt�� ����
		
		List<ReviewSIO> Review = selectAll();
		int allcnt = Review.size();//�� ���ڵ� ����
		List<ReviewSIO> g=new ArrayList<ReviewSIO>();
		
		System.out.println(allcnt);
		System.out.println("from :"+from);
		System.out.println("cnt :"+cnt);
		
		for(int i=from-1;i<from+cnt-1;i++) {
			
			if(i<allcnt) {
			g.add(Review.get(i));
			}else {
				break;
			}
		}
		System.out.println("리스트 개수 : "+g.size());
		return g;
	}
	
	public ReviewPage page(int from, int cnt) {
		
		return new ReviewPage(from,cnt);
	}
	
	

	public int update(ReviewSIO ReviewSIO) {//������Ʈ
		// TODO Auto-generated method stub
		return ReviewRepo.update(
				new Review(ReviewSIO.getId(),ReviewSIO.getTitle(),ReviewSIO.getDate(),
						ReviewSIO.getContent(),
						ReviewSIO.getRootid(),ReviewSIO.getRelevel(),ReviewSIO.getRecnt()
						,ReviewSIO.getViewcnt(),ReviewSIO.getFilename()));
	}

	public int update(int id, ReviewSIO ReviewSIO) { //������Ʈ(id�� �߰�)
		// TODO Auto-generated method stub
		
		return ReviewRepo.update(
				new Review(id,ReviewSIO.getTitle(),ReviewSIO.getDate(),
						ReviewSIO.getContent(),
						ReviewSIO.getRootid(),ReviewSIO.getRelevel(),ReviewSIO.getRecnt()
						,ReviewSIO.getViewcnt(),ReviewSIO.getFilename()));
	}

	public int update_reply(int id, int recnt, ReviewSIO ReviewSIO) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	public int delete(int id) {
		// TODO Auto-generated method stub
		return ReviewRepo.delete(ReviewRepo.getRecordById(id));
	}

	public int delete(ReviewSIO ReviewSIO) {
		
		// TODO Auto-generated method stub
		return ReviewRepo.delete(ReviewRepo.getRecordById(ReviewSIO.getId()));
	}
	
	public int next_number() {
		return ReviewRepo.next_number();
	}
	
	public void viewcnt_update(int id) {//조회수 증가
		
		ReviewSIO g = selectOne(id);
		//g.setId(g.getId());
		g.setViewcnt((g.getViewcnt()+1));
		g.setFilename(g.getFilename());
		System.out.println(g.getFilename());
		update(g);
	}
	
	public void reply_update(int rootid,int relevel, int recnt) {
		ReviewRepo.reinsert(rootid,relevel,recnt);
	}
	
	
}
