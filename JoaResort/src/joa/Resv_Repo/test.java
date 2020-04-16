package joa.Resv_Repo;

import java.util.List;

import joa.Domain.gongji;
import joa.Repo.gongjiRepo;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			gongjiRepo.createDB();
			
			/*List<gongji> list=gongjiRepo.getAllRecords();
			for(gongji g : list) {
				System.out.println("id값 : "+g.getId());
			}
			
			*/
			
			System.out.println("다음 숫자 : "+gongjiRepo.next_number());
			
	}

	

}
