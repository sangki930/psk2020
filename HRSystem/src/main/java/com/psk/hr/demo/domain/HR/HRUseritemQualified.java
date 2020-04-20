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

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//자격면허
@Entity(name="Qualified")
@Table(name="Qualified")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class HRUseritemQualified {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column
	private String value;
	
	@Column
	private String qualifiedName;//자격증 명
	
	@Column
	private String qualifiedNumber;//자격증 번호
	
	@Column
	private String institution;//발급기관
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate acquiDate;//취득일
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate expiredDate;//만기일
	
	
	@ManyToOne(optional=false)
	@JoinColumn
	@JsonManagedReference
	private HR hr;
	
	
	
}
