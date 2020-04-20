package com.psk.hr.demo.domain.HR;


import java.time.LocalDate;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.enums.HRDept;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude= {"qualifieds","edus","careers","histories","params"})
@Entity
@Table(name="HR",
uniqueConstraints= {
		@UniqueConstraint(
				columnNames= {"id","empId"}
				)
}
		)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HR {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(nullable=false, length=128)
	private Long id;
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Long empId;
	//사원번호
	
	/* @Column(nullable=false, length=128) */
	@Column(length=24)
	private String juminId;
	//주민등록번호
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate entered;
	//입사일
	
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate exited;
	//퇴사일
	
	@Column(nullable=false,length=128)
	@Enumerated(EnumType.STRING)
	@Builder.Default
	private HRDept hrDept=HRDept.개발팀;
	
	//@Column(nullable=true, length=128)
	@Column(length=12)
	private String rank_name;
	
	@Column(length=64)
	private String engname;
	
	@Column
	private Boolean nationality;
	//0이면 외국인, 1이면 내국인
	
	@Column(length=64)
	private String position;
	//직책
	
	@Column(length=10)
	private String typeWorking;
	//근무구분
	
	@Column(length=128)
	private String typeEntrance;
	//입사구분
	
	@Column(length=128)
	private String typeEducation;
	//최종학력
	
	@Column(length=32)
	private String typeObstacle;
	//장애유형
	@Column(length=128)
	private String carNumber;
	//차량번호
	
	@Column
	private LocalDate married;
	//결혼일
	
	@Column
	private Boolean IsMarried;
	//결혼여부
	
	
	/*
	 * 일대일 매핑
	 */
//
//	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.LAZY)
	@OneToOne(fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinColumn
	private UserItem userItem;
	

	
	/*
	 * 일대다 매핑
	 */

	//@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER,mappedBy="hr")
	
	
//	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER,mappedBy="hr")
	@OneToMany(cascade=CascadeType.ALL,mappedBy="hr")
	@JsonBackReference 
	private Collection<HRUseritemEdu> edus;//학력사항

//	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.LAZY,mappedBy="hr")
	@OneToMany(cascade=CascadeType.ALL,mappedBy="hr")
	@JsonBackReference 
	private Collection<HRUseritemCareer> careers;//경력사항 
	
//	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.LAZY,mappedBy="hr")
	@OneToMany(cascade=CascadeType.ALL,mappedBy="hr")
	@JsonBackReference
	private Collection<HRUseritemHistory> histories;//
	
//	@OneToMany(cascade=CascadeType.ALL,fetch = FetchType.LAZY,mappedBy="hr")
	@OneToMany(cascade=CascadeType.ALL,mappedBy="hr")
	@JsonBackReference
	private Collection<HRUseritemParam> params;//인원 상세
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="hr")
	//cascade : 부모가 지워졌을 때 자식을 처리,ALL은 모든자식을 처리
	@JsonBackReference
	//Json은 String으로 변환하기 떼문에 Recursive가 걸림
//	private HRUseritemQualified hRUseritemQualified; 
	private Collection<HRUseritemQualified> qualifieds;//자격/면허
	
	
	

}
