package kopo.example.domain;

public class VoteRIO {
	
	private int id; //후보 번호
	private int age; //투표자 세대
	
	public int getAge() {
		return age;
	}


	public VoteRIO(int id, int age) {
		super();
		this.id = id;
		this.age = age;
	}


	public VoteRIO() {
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
