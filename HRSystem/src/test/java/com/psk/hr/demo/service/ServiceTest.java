package com.psk.hr.demo.service;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.HR.HRUseritemEdu;
import com.psk.hr.demo.repo.HRUseritemCareerRepository;
import com.psk.hr.demo.repo.HRUseritemEduRepository;

@SpringBootTest
public class ServiceTest {

	@Autowired
	private HRService hRservice;
	
	@Autowired
	private UserItemService userItemService;
	
//	@Autowired
//	private MockMvc mockMvc;
	@Autowired
	private HRUserItemService hRUserItemService; 
	
	@Autowired
	private HRUseritemEduRepository hRUseritemEduRepository;
	
	@Autowired
	private HRUseritemCareerRepository hRUseritemCareerRepository;
	
	@Test
//	@Transactional
	void basicTest() {
		
//		UserItem userItem =null;
//		
//		for(int i=1;i<=1;i++) {
//			
//			userItem = UserItem.builder()
//					.username("admin"+i)
//					.name("옥주현"+i)
//					.password("1111")
//					.birth(LocalDate.of(1999, 1, 31))
//					.email("aaa"+i+"@aaa.com")
//					.gender(true)
//					.tel("01099999999")
//					.build();
//			
//			userItemService.insertUser(userItem);
//			
//		}
		
		HR hr = userItemService.getUserItem(3L).getHR();
		System.out.println(hr.toString());
		
	}
	
	@Test
	void basicTest2() {
		
		HR hr = userItemService.getUserItem(3L).getHR();
		HRUseritemEdu edu =null;
		
		
		for(int i=0;i<4;i++) {
			edu = HRUseritemEdu.builder()
					.addr("성남")
					.hr(hr)
					.build();
			hRUserItemService.insert(edu);
		}
		
	}
	
	
}
