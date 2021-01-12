package com.psk.hr.demo.logs;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.psk.hr.demo.logs.test.TestEntity;
import com.psk.hr.demo.repo.TestEntityRepository;

@SpringBootTest
public class LogsTest {

	@Autowired
	TestEntityRepository tr;
	
	@Test
	public void insert() {
		
		TestEntity te = TestEntity.builder()
				.record("adasd")
				.build();
		tr.save(te);
		
//		for(TestEntity t : tr.findAll())
//			System.out.println(t.toString());
		tr.deleteAll();
	}
	
	@Test
	public void delete() {
		tr.deleteAll();
	}
}
