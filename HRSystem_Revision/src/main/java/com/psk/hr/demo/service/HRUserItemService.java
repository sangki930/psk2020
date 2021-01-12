package com.psk.hr.demo.service;

import java.util.List;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.HR.HRUseritemCareer;
import com.psk.hr.demo.domain.HR.HRUseritemDetail;
import com.psk.hr.demo.domain.HR.HRUseritemEdu;
import com.psk.hr.demo.domain.HR.HRUseritemHistory;
import com.psk.hr.demo.domain.HR.HRUseritemParam;
import com.psk.hr.demo.domain.HR.HRUseritemQualified;

public interface HRUserItemService {
	
	List<?> findAllByHr(HR hr,String entity);
	
	//details
	void update(HRUseritemDetail hRUseritemDetail);
	
	
	//params
	HRUseritemParam getParam(HRUseritemParam param);
	void insert(HRUseritemParam param);
	void update(HRUseritemParam param);
	void delete(HRUseritemParam param);
	
	//Histories
	HRUseritemHistory getHistory(HRUseritemHistory history);
		void insert(HRUseritemHistory history);
		void update(HRUseritemHistory history);
		void delete(HRUseritemHistory history);
		//Edu
		HRUseritemEdu getEdu(HRUseritemEdu edu);
		void insert(HRUseritemEdu edu);
		void update(HRUseritemEdu edu);
		void delete(HRUseritemEdu edu);
		void deleteEdu(Long id);
		//Careers
		
		HRUseritemCareer getCareer(HRUseritemCareer Career);
		void insert(HRUseritemCareer career);
		void update(HRUseritemCareer career);
		void delete(HRUseritemCareer career);
		void deleteCareer(Long id);
		//Qualifieds
		HRUseritemQualified getQualified(HRUseritemQualified Qualified);
		void insert(HRUseritemQualified Qualified);
		void update(HRUseritemQualified Qualified);
		void delete(HRUseritemQualified Qualified);
		void deleteQualified(Long id);
	

}
