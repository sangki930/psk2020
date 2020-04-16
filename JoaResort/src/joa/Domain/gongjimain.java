package joa.Domain;

import joa.Repo.*;

import java.util.List;

import joa.DTO.*;
import joa.service.*;


public class gongjimain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		gongjiRepo g= new gongjiRepo();
				g.createDB();
				  int from=1;
				  int cnt=10;
				  
				  gongjiServiceimple gsi = new gongjiServiceimple();
				  gongjiPage gp = new gongjiPage(from,cnt);
				  List<gongjiSIO> l=gsi.pageNation(from,cnt);
				  
				  System.out.println("°ª È®ÀÎ");
				  System.out.println(l.get(0).getId());
				  System.out.println(gp.getNext());
				  
				  
				  
	}

}
