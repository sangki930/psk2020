package com.psk.hr.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.HR.HRUseritemCareer;
import com.psk.hr.demo.domain.HR.HRUseritemDetail;
import com.psk.hr.demo.domain.HR.HRUseritemEdu;
import com.psk.hr.demo.domain.HR.HRUseritemHistory;
import com.psk.hr.demo.domain.HR.HRUseritemParam;
import com.psk.hr.demo.domain.HR.HRUseritemQualified;
import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.repo.HRRepository;
import com.psk.hr.demo.repo.HRUseritemCareerRepository;
import com.psk.hr.demo.repo.HRUseritemEduRepository;
import com.psk.hr.demo.repo.HRUseritemHistoryRepository;
import com.psk.hr.demo.repo.HRUseritemParamRepository;
import com.psk.hr.demo.repo.HRUseritemQualifiedRepository;
import com.psk.hr.demo.repo.UserItemRepository;

@Service
public class HRUserItemServiceImpl implements HRUserItemService{
	
	@Autowired
	private HRUseritemHistoryRepository historyRepo;
	@Autowired
	private HRUseritemParamRepository paramRepo;
	@Autowired
	private HRUseritemCareerRepository careerRepo;
	@Autowired
	private HRUseritemEduRepository eduRepo;
	@Autowired
	private HRUseritemQualifiedRepository qualifiedRepo;
	@Autowired
	private HRRepository hRRepo;
	@Autowired
	private UserItemRepository userRepo;
	
	

	@SuppressWarnings("preview")
	@Override
	public List<?> findAllByHr(HR hr, String entity) {
		// TODO Auto-generated method stub
		List<?> list = new ArrayList<>();
		
		switch(entity) {
		case  "career"->list = (List<?>)hr.getCareers();
		case  "edu"->list = (List<?>)hr.getEdus();
		case "history"->list = (List<?>)hr.getHistories();
		case "param"->list = (List<?>)hr.getParams();
		case "qualified"-> list=(List<?>)hr.getQualifieds();
			
		}
		
		return list;
	}
	

	public HRUseritemParam getParam(HRUseritemParam param) {
		// TODO Auto-generated method stub
		
		return paramRepo.findById(param.getKey()).get();
	}


	@Override
	public void insert(HRUseritemParam param) {
		// TODO Auto-generated method stub
		paramRepo.save(param);
	}

	@Override
	public void update(HRUseritemParam param) {
		// TODO Auto-generated method stub
		
		HRUseritemParam updateParam = paramRepo.findById(param.getKey()).get();
		
//		updateParam= HRUseritemParam.builder()
//									.label(param.getLabel())
//									.type(param.getType())
//									.build();
		updateParam.setLabel(param.getLabel());
		updateParam.setType(param.getType());
		
		paramRepo.save(updateParam);
		
	}

	@Override
	public void delete(HRUseritemParam param) {
		// TODO Auto-generated method stub
		paramRepo.delete(param);
		
	}

	@Override
	public HRUseritemHistory getHistory(HRUseritemHistory history) {
		// TODO Auto-generated method stub
		return historyRepo.findById(history.getKey()).get();
	}

	@Override
	public void insert(HRUseritemHistory history) {
		// TODO Auto-generated method stub
		historyRepo.save(history);
	}

	@Override
	public void update(HRUseritemHistory history) {
		// TODO Auto-generated method stub
		HRUseritemHistory updateHistory = historyRepo.findById(history.getKey()).get();
		
		updateHistory.setCreated(history.getCreated());
		updateHistory.setCreatedBy(history.getCreatedBy());
		updateHistory.setModified(history.getModified());
		updateHistory.setModifiedBy(history.getModifiedBy());
		
		historyRepo.save(updateHistory);
		
	}

	@Override
	public void delete(HRUseritemHistory history) {
		// TODO Auto-generated method stub
		historyRepo.delete(history);
		
	}

	@Override
	public HRUseritemEdu getEdu(HRUseritemEdu edu) {
		// TODO Auto-generated method stub
		return eduRepo.findById(edu.getId()).get();
	}

	@Override
	public void insert(HRUseritemEdu edu) {
		// TODO Auto-generated method stub
		eduRepo.save(edu);
		
	}

	@Override
	public void update(HRUseritemEdu edu) {
		// TODO Auto-generated method stub
		HRUseritemEdu updateEdu = eduRepo.findById(edu.getId()).get();
		
		updateEdu.setAddr(edu.getAddr());
		updateEdu.setDegree(edu.getDegree());
		updateEdu.setEnterdate(edu.getEnterdate());
		updateEdu.setGraduatedate(edu.getGraduatedate());
		updateEdu.setMajor(edu.getMajor());
		updateEdu.setSchoolname(edu.getSchoolname());
		
		eduRepo.save(updateEdu);
	}

	@Override
	public void delete(HRUseritemEdu edu) {
		// TODO Auto-generated method stub
		eduRepo.delete(edu);
	}

	@Override
	public HRUseritemCareer getCareer(HRUseritemCareer Career) {
		// TODO Auto-generated method stub
		return careerRepo.findById(Career.getId()).get();
	}

	@Override
	public void insert(HRUseritemCareer career) {
		// TODO Auto-generated method stub
		careerRepo.save(career);
	}

	@Override
	public void update(HRUseritemCareer career) {
		// TODO Auto-generated method stub
		HRUseritemCareer updateCareer = careerRepo.findById(career.getId()).get();
		
		updateCareer.setCareerDept(career.getCareerDept());
		updateCareer.setCareerRank(career.getCareerRank());
		updateCareer.setCompanyName(career.getCompanyName());
		updateCareer.setEnteredDate(career.getEnteredDate());
		updateCareer.setExitedDate(career.getExitedDate());
		
		careerRepo.save(updateCareer);
		
	}

	@Override
	public void delete(HRUseritemCareer career) {
		// TODO Auto-generated method stub
		careerRepo.delete(career);
	}

	@Override
	public HRUseritemQualified getQualified(HRUseritemQualified qualified) {
		// TODO Auto-generated method stub
		
		return qualifiedRepo.getOne(qualified.getId());
	}

	@Override
	public void insert(HRUseritemQualified qualified) {
		// TODO Auto-generated method stub
		qualifiedRepo.save(qualified);
	}

	@Override
	public void update(HRUseritemQualified qualified) {
		// TODO Auto-generated method stub
		HRUseritemQualified updateQual = qualifiedRepo.getOne(qualified.getId());
		
		updateQual.setAcquiDate(qualified.getAcquiDate());//취득일
		updateQual.setExpiredDate(qualified.getExpiredDate());
		updateQual.setInstitution(qualified.getInstitution());
		updateQual.setQualifiedName(qualified.getQualifiedName());//자격증명
		updateQual.setQualifiedNumber(qualified.getQualifiedNumber());
		
		
		qualifiedRepo.save(updateQual);
	}

	@Override
	public void delete(HRUseritemQualified qualified) {
		// TODO Auto-generated method stub
		qualifiedRepo.delete(qualified);
		
	}


	@Override
	public void update(HRUseritemDetail hRUseritemDetail) {
		
		HRUseritemDetail h = hRUseritemDetail;
		UserItem user = userRepo.getOne(h.getUserId());
		HR hr = hRRepo.getOne(h.getId());
		
		user.setTel(h.getTel());
		user.setEmail(h.getEmail());
		
		hr.setTypeEntrance(h.getTypeEntrance());
		hr.setTypeObstacle(h.getTypeObstacle());
		hr.setCarNumber(h.getCarNumber());
		hr.setIsMarried(h.getIsMarried());
		hr.setMarried(h.getMarried()!=null?h.getMarried().plusDays(1):h.getMarried());
		
		userRepo.save(user);
		hRRepo.save(hr);
		
	}


	@Override
	public void deleteEdu(Long id) {
		// TODO Auto-generated method stub
		eduRepo.deleteById(id);
	}


	@Override
	public void deleteCareer(Long id) {
		// TODO Auto-generated method stub
		careerRepo.deleteById(id);
		
	}


	@Override
	public void deleteQualified(Long id) {
		// TODO Auto-generated method stub
		qualifiedRepo.deleteById(id);
	}

}
