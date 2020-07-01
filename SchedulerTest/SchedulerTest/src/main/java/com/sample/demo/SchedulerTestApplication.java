package com.sample.demo;

import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.sample.demo.service.SampleService;

@SpringBootApplication
@EnableScheduling
//@EnableBatchProcessing
public class SchedulerTestApplication {

	@Autowired
	static SampleService sampleService;

	public static void main(String[] args) {
		SpringApplication.run(SchedulerTestApplication.class, args);

	}

}
