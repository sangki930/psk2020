package com.sample.demo.domain;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SecurityMember extends User {
	private static final String ROLE_PREFIX = "ROLE_";
	private static final long serialVersionUID = 1L;
	
	private Member member;
	
	public SecurityMember(Member member) {
		super(member.getMemberId(), member.getPassword(), AuthorityUtils.createAuthorityList(member.getRole().toString()));
		this.member=member;
	}
	
	
}
