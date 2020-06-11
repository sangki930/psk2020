package com.psk.hr.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.repo.UserItemRepository;
import com.psk.hr.demo.service.UserItemService;

@SpringBootTest
public class UserItemRepositoryTest {

	@Autowired
	private UserItemRepository userItemRepository;
	
	@Autowired
	private UserItemService userItemService;
	
	//insert 테스트
	@Test
	public void testInsert() {
		
		UserItem userItem =
				UserItem.builder()
				.username("sangki944")
				.name("박상기")
				.password("sangki930")
				.build();
		userItemService.insertUser(userItem);
	}
}
