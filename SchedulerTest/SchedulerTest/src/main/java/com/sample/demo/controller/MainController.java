package com.sample.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.demo.domain.Sample;
import com.sample.demo.service.SampleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/sample")
@RequiredArgsConstructor
@Slf4j
public class MainController {

	private final SampleService sampleService;

	@RequestMapping("/getSamples")
	@ResponseBody
	public void getSamples() {
		log.info("getSamples---");
		
		List<Sample> list = (ArrayList<Sample>)sampleService.getSamples();
		for(Sample s : list) {
			log.info("확인 : "+s.toString());

		}
		
		
	}

	@RequestMapping("/doInsert")
	@ResponseBody
//	@Scheduled(cron = "1 * * * * *")
	public void doInsert() {
		for (int i = 0; i < 10000; i++) {

			Sample sample = Sample.builder().user("유저" + i).password("" + (i * 1000 + i)).name("이름" + i).build();
			sampleService.insert(sample);
			log.info("insert : "+sample.toString());

		}

	}

}
