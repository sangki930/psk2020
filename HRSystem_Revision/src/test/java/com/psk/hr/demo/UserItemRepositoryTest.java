package com.psk.hr.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.psk.hr.demo.domain.useritem.UserItem;
import com.psk.hr.demo.enums.Role;
import com.psk.hr.demo.repo.UserItemRepository;
import com.psk.hr.demo.service.UserItemService;

@SpringBootTest
public class UserItemRepositoryTest {

	@Autowired
	private UserItemRepository userItemRepository;
	
	@Autowired
	private UserItemService userItemService;
	
	@Test
	public void testInsertAdmin() {
		UserItem userItem =
				UserItem.builder()
				.username("sangki930")
				.name("박상기")
				.password("sangki930")
				.role(Role.ROLE_ADMIN)
				.build();
		userItemService.insertUser(userItem);
							
	}
	
	//insert 테스트
	//
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
	
	//테이블 데이터 모두 지우기
	@Test
	public void testDeleteAll() {
		userItemRepository.deleteAll();
	}
	
	@Test
	public void getUserItemTest() {
		
		System.out.println("result :"+userItemRepository.findByUsername("sangki930"));
	}
}
