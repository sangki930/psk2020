package com.psk.board.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude="boardList")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Member {
	
	@Id
	@Column(name="MEMBER_ID")
	private String id;//계정명
	
	private String password;//비밀번호
	
	private String name;
	
	@Enumerated(EnumType.STRING)
	private Role role;
	
	private boolean enabled;
	
	@OneToMany(mappedBy="member",fetch=FetchType.EAGER)
	//1대 다 매핑
	//mappedBy : 양방향 매핑에서 연관관계 주인이 아님을 설정
	//FetchType.EAGER : Member가 조회될 때 관련된 Board도 같이 조회 되도록한다.
	private List<Board> boardList = new ArrayList<Board>();
	
	
}
