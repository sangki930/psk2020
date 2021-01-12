package com.psk.hr.demo.enums;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Getter;

@Entity
@Getter
public enum HRRank {

	사원(1L),대리(2L),과장(3L),차장(4L),부장(5L),상무(6L),전무(7L),사장(8L),이사(9L);

	@Id
	@Column
	 private Long rankId = null;

	HRRank(Long rankId) {
		// TODO Auto-generated constructor stub
		 this.rankId=rankId;
	}
	
}
