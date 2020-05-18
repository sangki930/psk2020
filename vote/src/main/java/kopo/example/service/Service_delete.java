package kopo.example.service;

import kopo.example.Repo.HuboRepo;
import kopo.example.domain.HuboRIO;
import kopo.example.dto.HuboSIO;

public class Service_delete {
	
	private int status;
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Service_delete(int id) {
		
		HuboRepo.delete(HuboRepo.readOne(id));
		this.status=status;
	}
	
	public Service_delete(HuboSIO h) {
		HuboRepo.delete(new HuboRIO(h.getId(),h.getName()));
		this.status=status;
	}
	
	
}
