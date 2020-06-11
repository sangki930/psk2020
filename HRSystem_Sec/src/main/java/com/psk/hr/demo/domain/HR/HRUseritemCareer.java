package com.psk.hr.demo.domain.HR;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//경력사항
@Entity(name="Career")
@Table(name="Career")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class HRUseritemCareer {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	//@Column(nullable=true)
	@Column
	private String value;
	
	@Column(length=128)
	private String companyName;
	
	
//	@Column(nullable=false, length=128)
//	@Enumerated(EnumType.STRING)
//	private HRRank hRrank;
//	
	@Column(length=20)
	private String careerRank;
	
//	@Column(nullable=false, length=128)
//	@Enumerated(EnumType.STRING)
//	private HRDept dept;
	@Column(length=20)
	private String careerDept;
	
	@Column(length=20)
	private String work;
	
	@Column(length=20)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate enteredDate;
	
	@Column(length=20)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate exitedDate;
	
	
	@ManyToOne(optional=false,fetch = FetchType.EAGER)
	@JoinColumn
	@JsonManagedReference
	private HR hr;
}
