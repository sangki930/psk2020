package joa.DTO;

import java.util.List;

import joa.DTO.*;
import joa.service.*;
import joa.Repo.*;

public class gongjiPage { //PageNation
	
	private int startpage; //���������̼��� ���� ��ȣ
	private int presentpage; //���� ������ ��ȣ
	private int endpage;//��������
	private int totalpage;//�� ������ ��
	private int prev;//���� ������ from
	private int next;//���� ������ from
	private int prev_nation;// <<�� ��������
	private int next_nation;// >>�� ��������
	
	
	
	
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getPresentpage() {
		return presentpage;
	}
	public void setPresentpage(int presentpage) {
		this.presentpage = presentpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public gongjiPage(int startpage, int presentpage, int endpage) {
		super();
		this.startpage = startpage;
		this.presentpage = presentpage;
		this.endpage = endpage;
	}
	
	public gongjiPage(int from, int cnt) {
		//from�� �� ������, cnt�� ������ ��Ÿ���� ����
		
		
		this.startpage = (from-1)/(cnt*10)+1;//10�� ���������̼� ������ 10
		this.presentpage=(from/cnt)+1;//���� ������
		this.endpage = this.startpage+9;//�� ������ ��ȣ
		this.totalpage=(gongjiRepo.getAllRecords().size()/cnt)+1;//��� Record��
		this.prev=(from-cnt-1)/(cnt*10)+1;//���� ������ ���
		this.next=(from+cnt-1)/(cnt*10)+1;//���� ������ ���
		this.prev_nation=((this.presentpage-1)/cnt)-10+1;// <<
		this.next_nation=((this.presentpage-1)/cnt)+10+1;// >>
		
		System.out.println("startpage : "+this.startpage);
		System.out.println("presentpage : "+this.presentpage);
		System.out.println("endpage : "+this.endpage);
		System.out.println("totalpage : "+this.totalpage);
		System.out.println("prev : "+this.prev);
		System.out.println("next : "+this.next);
		System.out.println("prev_nation : "+this.prev_nation);
		System.out.println("next_nation : "+this.next_nation);
		
		
		
	}
	
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getPrev_nation() {
		return prev_nation;
	}
	public void setPrev_nation(int prev_nation) {
		this.prev_nation = prev_nation;
	}
	public int getNext_nation() {
		return next_nation;
	}
	public void setNext_nation(int next_nation) {
		this.next_nation = next_nation;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public gongjiPage() {
		super();
	}

}
