package com.psk.hr.demo.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.enums.HRDept;
import com.psk.hr.demo.repo.HRRepository;
import com.psk.hr.demo.repo.HRUseritemCareerRepository;
import com.psk.hr.demo.repo.HRUseritemEduRepository;

@Service
public class HRServiceImpl implements HRService {

	@Autowired
	private HRRepository hRRepository;
	
	@Autowired
	private HRUseritemEduRepository hRUseritemEduRepository;
	
	@Autowired
	private HRUseritemCareerRepository hRUseritemCareerRepository;

	@Override
	@Transactional
	public HR getHR(HR hR) {
		// TODO Auto-generated method stub
		
		hR = hRRepository.findById(hR.getId()).get();
		
		
//		hR.setEdus(hRUseritemEduRepository.findAllById(hR.getId()));
//		hR.setCareers(hRUseritemCareerRepository.findAll());
		
		return hR;
	}

	@Override
	public Page<HR> getHRList(Pageable pageable,Specification<HR> spec) {

		int page = (pageable.getPageNumber()==0) ? 0:(pageable.getPageNumber()-1);
		pageable = PageRequest.of(page,10);
		
		return hRRepository.findAll(spec,pageable);
	}
	

	
	

	@Override
	public void insertHR(HR hR) {
		// TODO Auto-generated method stub
		hRRepository.save(hR);
	}

	@Override
	public void deleteHR(HR hR) {
		// TODO Auto-generated method stub
		hRRepository.delete(hR);
	}

	@Override
	public void updateHR(HR hR) {
		// TODO Auto-generated method stub
		HR updateHr = hRRepository.findById(hR.getId()).get();
		
//		System.out.println(updateHr.toString());
		
		updateHr.setCareers(hR.getCareers());
		updateHr.setCarNumber(hR.getCarNumber());
		updateHr.setEdus(hR.getEdus());
		updateHr.setEmpId(hR.getEmpId());
		updateHr.setEngname(hR.getEngname());
		updateHr.setEntered(hR.getEntered()!=null?hR.getEntered().plusDays(1):hR.getEntered());
		updateHr.setExited(hR.getExited()!=null?hR.getExited().plusDays(1):hR.getExited());
		updateHr.setHistories(hR.getHistories());
		updateHr.setHrDept(hR.getHrDept()!=null?hR.getHrDept():HRDept.개발팀);
//		updateHr.setId(hR.getId());
		updateHr.setIsMarried(hR.getIsMarried());
		updateHr.setJuminId(hR.getJuminId());
		updateHr.setMarried(hR.getMarried()!=null?hR.getMarried().plusDays(1):null);
		updateHr.setNationality(hR.getNationality());
//		updateHr.setParams(hR.getParams());
		updateHr.setPosition(hR.getPosition());
//		updateHr.setQualifieds(qualifieds);
		updateHr.setRank_name(hR.getRank_name());
		updateHr.setTypeEducation(hR.getTypeEducation());
		updateHr.setTypeEntrance(hR.getTypeEntrance());
		updateHr.setTypeObstacle(hR.getTypeObstacle());
		updateHr.setTypeWorking(hR.getTypeWorking());
		
//		updateHr=HR.builder()
//				.id(hR.getId())
//				.careers(hR.getCareers())
//				.carNumber(hR.getCarNumber())
//				.engname(hR.getEngname())
//				.edus(hR.getEdus())
//				.empId(hR.getEmpId())
//				.entered(hR.getEntered()!=null?hR.getEntered().plusDays(1):hR.getEntered())
//				.exited(hR.getExited())
//				.histories(hR.getHistories())
//				.hrDept(hR.getHrDept())
//				.IsMarried(hR.getIsMarried())
//				.juminId(hR.getJuminId())
//				.married(hR.getMarried())
//				.nationality(hR.getNationality())
//				.params(hR.getParams())
//				.position(hR.getPosition())
//				.qualifieds(hR.getQualifieds())
//				.rank_name(hR.getRank_name())
//				.typeEducation(hR.getTypeEducation())
//				.typeEntrance(hR.getTypeEntrance())
//				.typeObstacle(hR.getTypeObstacle())
//				.typeWorking(hR.getTypeWorking())
//				.userItem(hR.getUserItem())
//				.build();
		
		
		hRRepository.save(updateHr);
		
		
	}

	@Override//테스트
	public String hello(String name) {
		// TODO Auto-generated method stub
		return "hello : "+name;
	}

	@Override
	@Transactional
	public HR getHR(Long id) {
		// TODO Auto-generated method stub
		HR hr = hRRepository.findById(id).get();

		return hr;
	}

}
