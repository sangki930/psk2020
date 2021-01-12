package com.psk.hr.demo.domain.HR;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Builder;
import lombok.Data;

@Entity(name="History")
@Table(name="History")
@Data
@Builder
public class HRUseritemHistory {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long key;
	
	@Column
	private String value;
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate created;
	
	@Column
	private String createdBy;
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate modified;
	
	@Column
	private String modifiedBy;
	
	@ManyToOne(optional=false)
//	@JoinColumn(name="emp_id")
	@JoinColumn
	@JsonManagedReference
	private HR hr;
	
}
