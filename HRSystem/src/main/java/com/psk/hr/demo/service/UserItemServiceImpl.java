package com.psk.hr.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.repo.HRRepository;
import com.psk.hr.demo.repo.UserItemRepository;

@Service
public class UserItemServiceImpl implements UserItemService{

	@Autowired
	private UserItemRepository userItemRepository;
	@Autowired
	private HRRepository hRRepository;
	
	@Override
	public void insertUser(UserItem userItem) {
		// TODO Auto-generated method stub
		userItemRepository.save(userItem);
		HR hr = HR.builder()
				.userItem(userItem)
				.build();
		hRRepository.save(hr);
		
	}

	@Override
	public void deleteUser(UserItem userItem) {
		// TODO Auto-generated method stub
		userItemRepository.deleteById(userItem.getUserId());;
	}

	@Override
	public void updateUser(UserItem userItem) {
		// TODO Auto-generated method stub
//		Optional<UserItem> userItems=userItemRepository.findById(userItem.getUserId());
//		
//		if(userItems.isPresent()) {
//			userItem=userItems.get();
//		}
//		
		userItemRepository.save(userItem);
		
	}

	@Override
	public UserItem getUserItem(UserItem userItem) {
		// TODO Auto-generated method stub
		return userItemRepository.findById(userItem.getUserId()).get();
	}

	@Override
	public Page<UserItem> getUserItemList(Pageable pageable,Specification<UserItem> spec) {
		// TODO Auto-generated method stub
		
		int page = (pageable.getPageNumber()==0) ? 0:(pageable.getPageNumber()-1);
		pageable = PageRequest.of(page,10);
		
//		return userItemRepository.findAll(pageable);
		return userItemRepository.findAll(spec, pageable);
	}

	@Override
	public void deleteUserByChecked(List<UserItem> userItemlist) {
		// TODO Auto-generated method stub
		
		userItemRepository.deleteAll(userItemlist);
	}

	@Override
	public Page<UserItem> getUserItemList(Pageable pageable) {
		int page = (pageable.getPageNumber()==0) ? 0:(pageable.getPageNumber()-1);
		pageable = PageRequest.of(page,10);
		// TODO Auto-generated method stub
		return userItemRepository.findAll(pageable);
	}

	@Override
	public UserItem getUserItem(Long id) {
		// TODO Auto-generated method stub
		Optional<UserItem> userItems=userItemRepository.findById(id);
		
		if(userItems.isPresent()) {
			return userItems.get();
		}
		return null;
	}

}
