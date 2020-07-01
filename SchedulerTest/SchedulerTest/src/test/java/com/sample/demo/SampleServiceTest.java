package com.sample.demo;


import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.sample.demo.domain.Sample;
import com.sample.demo.repo.SampleRepository;
import com.sample.demo.service.SampleService;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class SampleServiceTest {
	
	@Autowired
	private SampleService sampleService;
	
	@Autowired
	private SampleRepository sampleRepository;
	
	@Test
	public void getSamples()
	{
	
		ArrayList<Sample> list = (ArrayList<Sample>) sampleRepository.findAll();
		
		
		for(Sample s : list) {
			log.info("샘플 확인 : "+s);
		}
		
	}	
	@Test
	public void insert() {
		
		for(int i=0;i<1000;i++) {
			
			Sample sample = Sample.builder()
					.user("유저"+i)
					.password(""+(i*1000+i))
					.name("이름"+i)
					.build();
			sampleService.insert(sample);
			
		}
		
		
	}

}
