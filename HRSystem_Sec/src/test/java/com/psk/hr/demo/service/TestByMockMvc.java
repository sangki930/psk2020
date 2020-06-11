package com.psk.hr.demo.service;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import com.psk.hr.demo.domain.HR.HRUseritemEdu;
import com.psk.hr.demo.repo.HRUseritemEduRepository;



@SpringBootTest
@AutoConfigureMockMvc
public class TestByMockMvc {
	
	@Autowired
	private MockMvc mockMvc;
	
	@Autowired
	private HRUseritemEduRepository hRUseritemEduRepo;
	
	@Test
	public void testTest() throws Exception{
		this.mockMvc.perform(get("/n").param("name","둘리"))
			.andExpect(status().isOk())
//			.andExpect(content().string("Hello : 둘리"))
			.andDo(print());
		
	}
	
	
	@Test
	@Transactional
	public void testTest1() throws Exception{
		
		List<HRUseritemEdu> edulist=hRUseritemEduRepo.findAll();
		
		MultiValueMap<String, List<HRUseritemEdu>> m = new LinkedMultiValueMap<>();
		
		
		
//		model.addAttribute("edulist", edulist);
		System.out.println(edulist.toString());
		
		this.mockMvc.perform(post("/n").param("edulist", edulist.toString()))
		.andExpect(status().isOk())
//			.andExpect(content().string("Hello : 둘리"))
			.andDo(print());
		
	}
	
	@Test
	public void 아이디로조회() throws Exception {
		mockMvc.perform(get("/user/searchUser").param("selectColumn","name"))
				
				.andDo(print());
//				.andExpect(jsonPath("$", hasSize(1)));
		
	}
	
	@Test
	public void 컬럼으로조회() throws Exception {
		mockMvc.perform(get("/post/list").param("name","박상기"))
				
				.andDo(print());
//				.andExpect(jsonPath("$", hasSize(1)));
		
	}
	

}
