package joa.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.*;
import java.sql.*;

import joa.DTO.gongjiPage;
import joa.DTO.gongjiSIO;
import joa.Domain.gongji;
import joa.Repo.gongjiRepo;

public class gongjiServiceimple implements gongjiService {
	
	
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
	
	

	@Override
	public void createDB() { //���񽺿��� ���̺� ����
		// TODO Auto-generated method stub
		gongjiRepo.createDB(); //���̺� ���� �޼ҵ� ����
	}

	@Override
	public void dropDB() {//���̺� ���
		// TODO Auto-generated method stub
		gongjiRepo.dropDB();//���̺� ���
	}
	
	@Override
	public int insert(gongjiSIO gongjiSIO) {//insert문 실행
		// TODO Auto-generated method stub
		return gongjiRepo.save(
				new gongji(gongjiSIO.getId(),gongjiSIO.getTitle(),gongjiSIO.getDate(),
						gongjiSIO.getContent(),
						gongjiSIO.getRootid(),gongjiSIO.getRelevel(),gongjiSIO.getRecnt()
						,gongjiSIO.getViewcnt(),gongjiSIO.getFilename()));
	}

	@Override
	public gongjiSIO selectOne(int id) { //한 레코드 고르기
		// TODO Auto-generated method stub
		gongji g =  gongjiRepo.getRecordById(id);
		//select문으로 얻음
		//System.out.println("Filename 확인 :"+g.getFilename());
		return new gongjiSIO(g.getId(),g.getTitle(),g.getDate(),g.getContent(),
				g.getRootid(),g.getRelevel(),g.getRecnt(),g.getViewcnt(),g.getFilename());
	}

	@Override
	public List<gongjiSIO> selectAll() {//��� �����͸� ��ȸ
		// TODO Auto-generated method stub
		List<gongji> gongjilist = gongjiRepo.getAllRecords();
		List<gongjiSIO> gongji = new ArrayList<gongjiSIO>();
		for(gongji g : gongjilist) {
			
			gongji.add(new gongjiSIO(
					g.getId(),g.getTitle(),g.getDate(),g.getContent(),g.getRootid(),
					g.getRelevel(),g.getRecnt(),g.getViewcnt(),g.getFilename()));
		}
		
		
		return gongji;
	}

	@Override
	public List<gongjiSIO> selectAllById(int id) {
		// TODO Auto-generated method stub
		List<gongji> gongjilist = gongjiRepo.getAllRecords();
		List<gongjiSIO> gongji = new ArrayList<gongjiSIO>();
		for(gongji g : gongjilist) {
			
			gongji.add(new gongjiSIO(
					g.getId(),g.getTitle(),g.getDate(),g.getContent(),g.getRootid(),
					g.getRelevel(),g.getRecnt(),g.getViewcnt(),g.getFilename()));
		}
		
		
		return gongji;
	}

	public List<gongjiSIO> pageNation(int from,int cnt){//cnt��ŭ ���ڵ� ��������
		//from�� ������, cnt�� ����
		
		List<gongjiSIO> gongji = selectAll();
		int allcnt = gongji.size();//�� ���ڵ� ����
		List<gongjiSIO> g=new ArrayList<gongjiSIO>();
		
		System.out.println(allcnt);
		System.out.println("from :"+from);
		System.out.println("cnt :"+cnt);
		
		for(int i=from-1;i<from+cnt-1;i++) {
			
			if(i<allcnt) {
			g.add(gongji.get(i));
			}else {
				break;
			}
		}
		
		return g;
	}
	
	public gongjiPage page(int from, int cnt) {
		
		return new gongjiPage(from,cnt);
	}
	
	

	@Override
	public int update(gongjiSIO gongjiSIO) {//������Ʈ
		// TODO Auto-generated method stub
		return gongjiRepo.update(
				new gongji(gongjiSIO.getId(),gongjiSIO.getTitle(),gongjiSIO.getDate(),
						gongjiSIO.getContent(),
						gongjiSIO.getRootid(),gongjiSIO.getRelevel(),gongjiSIO.getRecnt()
						,gongjiSIO.getViewcnt(),gongjiSIO.getFilename()));
	}

	@Override
	public int update(int id, gongjiSIO gongjiSIO) { //������Ʈ(id�� �߰�)
		// TODO Auto-generated method stub
		
		return gongjiRepo.update(
				new gongji(id,gongjiSIO.getTitle(),gongjiSIO.getDate(),
						gongjiSIO.getContent(),
						gongjiSIO.getRootid(),gongjiSIO.getRelevel(),gongjiSIO.getRecnt()
						,gongjiSIO.getViewcnt(),gongjiSIO.getFilename()));
	}

	@Override
	public int update_reply(int id, int recnt, gongjiSIO gongjiSIO) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return gongjiRepo.delete(gongjiRepo.getRecordById(id));
	}

	@Override
	public int delete(gongjiSIO gongjiSIO) {
		
		// TODO Auto-generated method stub
		return gongjiRepo.delete(gongjiRepo.getRecordById(gongjiSIO.getId()));
	}
	
	public int next_number() {
		return gongjiRepo.next_number();
	}
	
	public void viewcnt_update(int id) {//조회수 증가
		
		gongjiSIO g = selectOne(id);
		//g.setId(g.getId());
		g.setViewcnt((g.getViewcnt()+1));
		g.setFilename(g.getFilename());
		System.out.println(g.getFilename());
		update(g);
	}
	
	public void reply_update(int rootid,int relevel, int recnt) {
		gongjiRepo.reinsert(rootid,relevel,recnt);
	}
	
	
}
