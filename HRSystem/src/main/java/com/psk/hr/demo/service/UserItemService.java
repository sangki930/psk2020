package com.psk.hr.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import com.psk.hr.demo.domain.account.UserItem;

public interface UserItemService {
	
	void insertUser(UserItem userItem);//회원추가
	void deleteUser(UserItem userItem);//회원삭제
	void updateUser(UserItem userItem);//회원수정
	UserItem getUserItem(UserItem userItem);//회원조회
	UserItem getUserItem(Long id);
	
	Page<UserItem> getUserItemList(Pageable pageable,Specification<UserItem> spec);//회원리스트 페이징
	Page<UserItem> getUserItemList(Pageable pageable);
	
	
	
	void deleteUserByChecked(List<UserItem> userItemlist);
	
}
