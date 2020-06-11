package kopo.example.service;

import java.util.List;

import kopo.example.Repo.HuboRepo;
import kopo.example.Repo.VoteRepo;
import kopo.example.domain.HuboRIO;
import kopo.example.domain.VoteRIO;
import kopo.example.dto.HuboSIO;
import kopo.example.dto.VoteSIO;

public class Service_insert {

	public Service_insert() {
		
	}
	public Service_insert(HuboSIO h) {
		HuboRepo.insert(new HuboRIO(h.getId(),h.getName()));
	}
	
	public void insert(int id,String name) {
		HuboRepo.insert(new HuboRIO(id,name));
	}
	
	public Service_insert(VoteSIO v) {
		VoteRepo.insert(new VoteRIO(v.getId(),v.getAge()));
	}
	
	public void insert(int id,int age) {
		VoteRepo.insert(new VoteRIO(id,age));
	}

	public int next_number() {//다음 번호 삽입 메소드
		int num=1;
		List<HuboRIO> list = HuboRepo.readAllRecords();
		
		for(int i=0;i<list.size();i++) {
			if(num!=list.get(i).getId()) {
				break;
			}
			num++;
			
		}
		
		
		
		return num;
	}
}
