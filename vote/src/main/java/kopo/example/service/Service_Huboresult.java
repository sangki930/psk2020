package kopo.example.service;

import java.util.ArrayList;
import java.util.List;

import kopo.example.Repo.VoteRepo;
import kopo.example.domain.HuboRIO;
import kopo.example.dto.HuboSIO;

public class Service_Huboresult {
		
		private int id;//기호
		private String name;//후보자명
		private int count;//특정 후보자의 득표수
		private double rate;//득표율
		private int sum; //총 득표수
		
		
		public Service_Huboresult(HuboSIO h) {
			super();
			this.id = h.getId();//기호 획득
			this.name = h.getName();//후보명 획득
			//System.out.println("기호"+id+"번의 득표수"+VoteRepo.count_record(new HuboRIO(h.getId(),h.getName())));
			this.count = VoteRepo.count_record(new HuboRIO(h.getId(),h.getName()));//후보별 득표수
			this.sum = VoteRepo.readAll().size();//총 득표수
			if(this.sum!=0) {//sum이 0일 수 있으므로
			this.rate = Math.round(((float)count/sum)*100);//소수 둘째자리 까지 나타내기
			}else {
				this.rate = 0;
			}
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


		public int getCount() {
			return count;
		}


		public void setCount(int count) {
			this.count = count;
		}


		public double getRate() {
			return rate;
		}


		public void setRate(double rate) {
			this.rate = rate;
		}


		public int getSum() {
			return sum;
		}


		public void setSum(int sum) {
			this.sum = sum;
		}


		
		
		
}
