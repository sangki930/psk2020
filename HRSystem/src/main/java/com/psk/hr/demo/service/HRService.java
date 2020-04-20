package com.psk.hr.demo.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import com.psk.hr.demo.domain.HR.HR;

public interface HRService {

	String hello(String name);
	
	void insertHR(HR hR);//회원추가
	void deleteHR(HR hR);//회원삭제
	void updateHR(HR hR);//회원수정
	HR getHR(HR hR);//회원조회
	HR getHR(Long id);
	Page<HR> getHRList(Pageable pageable,Specification<HR> spec);//회원리스트 페이징
}
