package com.psk.hr.demo.domain.HR;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Builder;
import lombok.Data;


//인적사항 상세
@Entity(name="Param")
@Table(name="Param")
@Data
@Builder
public class HRUseritemParam {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long key;
	
	@Column
	private String label;
	
	@Column
	private String type;
	
	@Column
	private String value;
	
	@ManyToOne(optional=false)
//	@JoinColumn(name="emp_id")
	@JoinColumn
	@JsonManagedReference
	private HR hr;
	
}
