package kopo.example.dto;

import kopo.example.Repo.HuboRepo;

public class HuboSIO {
	
	private int id;
	private String name;
	public HuboSIO() {
		super();
	}
	
	public HuboSIO(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public HuboSIO(int id) {
		super();
		this.id=id;
		this.name=HuboRepo.readOne(id).getName();
		
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
