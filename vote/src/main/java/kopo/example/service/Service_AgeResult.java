package kopo.example.service;

import java.util.ArrayList;
import java.util.List;

import kopo.example.Repo.VoteRepo;
import kopo.example.domain.AgeCount;
import kopo.example.domain.HuboRIO;
import kopo.example.domain.VoteRIO;
import kopo.example.dto.HuboSIO;

public class Service_AgeResult {
	
	List<AgeCount> list=new ArrayList<>();

	public Service_AgeResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Service_AgeResult(int id) {
		
		
		this.list=VoteRepo.AgeCount(id);
		
	}

	public List<AgeCount> getList() {
		return list;
	}

	public void setList(List<AgeCount> l) {
		this.list = list;
	}
	
	
	
}
