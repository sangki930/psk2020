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

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name="Edu")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class HRUseritemEdu {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	@Builder.Default
	private Long id=1L;
	
	@Column
	private String value;
	
	@Column
	private String schoolname;//학교명
	
	@Column
	private String addr;//주소
	
	@Column
	private String degree;//학위
	
	@Column
	private String major;//전공
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate enterdate;//입학일
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate graduatedate;//졸업일
	
	@ManyToOne(optional=false)
	@JoinColumn
	@JsonManagedReference
	private HR hr;
	
}
