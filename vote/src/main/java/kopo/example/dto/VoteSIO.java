package kopo.example.dto;

public class VoteSIO {
	
	private int id; //후보 번호
	private int age; //투표자 세대
	
	public int getAge() {
		return age;
	}


	public VoteSIO(int id, int age) {
		super();
		this.id = id;
		this.age = age;
	}


	public VoteSIO() {
		super();
	}


	public void setAge(int age) {
		this.age = age;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	
}
