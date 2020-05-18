package kopo.example.service;

import java.util.ArrayList;
import java.util.List;

import kopo.example.Repo.HuboRepo;
import kopo.example.domain.*;
import kopo.example.dto.HuboSIO;

public class Service_allview {
	
	
	private List<HuboSIO> list = new ArrayList<HuboSIO>();
	
	public Service_allview() {
		this.list=HuboRepo.readAll();
		
	}

	public List<HuboSIO> getList() {
		return list;
	}

	public void setList(List<HuboSIO> list) {
		this.list = list;
	}
	
}
