package com.sample.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sample.demo.domain.Sample;
import com.sample.demo.repo.SampleRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class SampleService {

	private final SampleRepository sampleRepository;
	
	public Sample getSample(Long id) {
		 return sampleRepository.getOne(id);
	}
	
	public List<Sample> getSamples(){
		return sampleRepository.findAll();
	}
	
	public void insert(Sample sample) {
		
//		log.info("insert : "+sample.toString());
		sampleRepository.save(sample);
		
	}
	
	public void delete(Sample sample) {
		
		sampleRepository.delete(sample);
	}
	
	public Sample update(Sample sample) {
		
		Sample newsample = new Sample(sample.getId(),sample.getUser(),sample.getPassword(),sample.getName(),sample.getMakesampletime());
//		log.info("update : "+newsample.toString());
		sampleRepository.save(newsample);
		
		return newsample;
	}

}
