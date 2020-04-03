package com.psk.board.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude="member")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Board {

	@Id
	@GeneratedValue
	private Long seq;
	
	private String title;
	
	private String content;
	
	@Column(updatable=false)
	@Builder.Default
	private LocalDateTime createDate=LocalDateTime.now();
	
	@Column(updatable=false)
	@Builder.Default
	private Long cnt=0L;
	
	@ManyToOne
	@JoinColumn(name="MEMBER_ID",nullable=false, updatable=false)
	private Member member;
	/*
	 * MEMBER_ID 칼럼을 참조하는 외래키 설정,
	 * 즉시 로딩을 처리할 때, 외부조인이 아닌 내부 조인으로 처리하여 성능을 향상시키기위해서 nullable을 false로 설정
	 * Board가 양방향에서 연관 관계 주인이 된다.
	 */
	
	
	public void setMember(Member member) {
		this.member=member;
		member.getBoardList().add(this);
	}
	
}
