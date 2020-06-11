package kopo.example.domain;

public class AgeCount {
	private int age;
	private int cnt;
	private int sum;
	private double rate;
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public AgeCount(int age, int cnt, int sum, double rate) {
		super();
		this.age = age;
		this.cnt = cnt;
		this.sum = sum;
		this.rate = rate;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getCnt() {
		return cnt;
	}
	
	public AgeCount(int age, int cnt) {
		super();
		this.age = age;
		this.cnt = cnt;
	}
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
