package com.psk.hr.demo.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.psk.hr.demo.domain.account.UserItem;

import lombok.Getter;

public class SecurityUser extends User{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Getter
	private UserItem userItem;

	public SecurityUser(UserItem userItem) {
		
		super(userItem.getUsername(), "{noop}"+userItem.getPassword(), 
				AuthorityUtils.createAuthorityList(userItem.getRole().toString()));
		this.userItem = userItem;
		// TODO Auto-generated constructor stub
	}

}
