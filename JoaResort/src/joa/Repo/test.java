package joa.Repo;

import java.time.LocalDate;
import java.util.List;

import joa.Domain.gongji;
import joa.Repo.gongjiRepo;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			gongjiRepo.createDB();
			
			List<gongji> list=gongjiRepo.getAllRecords();
			for(gongji g : list) {
				System.out.println("id값 : "+g.getId());
			}
			
			
			/*
			System.out.println("다음 숫자 : "+gongjiRepo.next_number());
			*/
			//LocalDate now = LocalDate.now();
			//now = now.plusDays(1); //객체가 바뀌지 않아 다시 대입
			//System.out.println(now); //2019-02-01
			
	}

	

}
