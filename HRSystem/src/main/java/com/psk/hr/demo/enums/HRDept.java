package com.psk.hr.demo.enums;

import lombok.Getter;

@Getter
public enum HRDept {
		생산팀("생산팀"), 인사팀("인사팀"), 개발팀("개발팀"), 연구팀("연구팀"), 캐피탈사업팀("캐피탈사업팀");
		
		private String dept;
		
		HRDept(String dept){
			this.dept=dept;
		}
	
}
