package com.psk.hr.demo.domain.account;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.psk.hr.demo.domain.HR.HR;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude="hR")
@Builder
public class UserItem {

	//private String user;
	//private String group;
	@Column
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long userId;
	@Column(unique=true)
	private String username;//아이디
	@Column
	private String password;//비밀번호
	
	@Column
	private String name;//이름
	@Column
	private String tel;//연락처
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth;//생년월일
	@Column
	private Boolean gender;//성별
	@Column
	private String email;//이메일 주소
	@Column(updatable=false)
	@Builder.Default
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDateTime enrollDate = LocalDateTime.now();//가입일 
	
	/*
	 * 일대일 매핑
	 */
//	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.LAZY,mappedBy="userItem")
	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.LAZY,mappedBy="userItem")
	@JsonBackReference 
	private HR hR;
	
//	private String introduction;
//	private String addr1;//소재주소
//	private String addr2;//상세주소
//	private String zipcode;//우편번호
	
	
}
