package com.psk.JoaResort.DTO;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Entity
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;//글번호
	
	@Column
	private String title;//제목
	
	@Column
	private LocalDate date;//날짜
	
	@Column
	private String content;//글
	
	@Column
	private int rootid;//원글 번호
	
	@Column
	private int relevel;//글 수준
	
	@Column
	private int recnt;// 글 순서
	
	@Column
	private int viewcnt;// 조회수
	
	@Column 
	private String filename;//파일명
	
	@ManyToOne(optional=false)
	@JoinColumn
	@JsonManagedReference
	private Member member;
}
