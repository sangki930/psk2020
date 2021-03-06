package com.psk.hr.demo.logs;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.psk.hr.demo.logs.repo.ConnectLogRepository;

@SpringBootTest
public class LogsTest {

	@Autowired
	ConnectLogRepository clrepo;
	
	@Test
	public void insertTest() {
	
		ConnectLog cl = ConnectLog.builder()
				.username("asdasd")
				.time(LocalDateTime.now())
				.msg("dsdsd").build();
		clrepo.insert(cl);
		System.out.println(clrepo.findByUsername("asdasd"));
	}
	
	@Test
	public void getTest() {
		//생략
	}
}
