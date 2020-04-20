package com.psk.hr.demo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.psk.hr.demo.domain.HR.HRUseritemCareer;
import com.psk.hr.demo.domain.HR.HRUseritemDetail;
import com.psk.hr.demo.domain.HR.HRUseritemEdu;
import com.psk.hr.demo.domain.HR.HRUseritemQualified;
import com.psk.hr.demo.repo.HRRepository;
import com.psk.hr.demo.service.HRService;
import com.psk.hr.demo.service.HRUserItemService;

@Controller
@RequestMapping("/hr")
public class HRUserItemController {

	
	private static final String folder_name="thymeleaf/hr/";
	
	 private static final Logger log = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	private HRService hRService;

	@Autowired
	private HRRepository hRRepo;
	
	@Autowired
	private HRUserItemService hRUserItemService;
	
	@RequestMapping("/detail")
	public String detail(HRUseritemDetail hRUseritemDetail) {
		
		log.info("상세 : "+hRUseritemDetail.toString());
		hRUserItemService.update(hRUseritemDetail);
		
		return "redirect:getHr?id="+hRUseritemDetail.getId();
	}
	
	
	
	
	
	/* 학력 */
	@RequestMapping("/updateEdu")
	@ResponseBody
	public void updateEdu(HRUseritemEdu hRUseritemedu) {
		
		log.info(hRUseritemedu.toString());
		
		hRUserItemService.update(hRUseritemedu);
	
	}
	
	@RequestMapping("/insertEdu")
	@ResponseBody
	public void insertEdu(HRUseritemEdu hRUseritemedu, Long hrid) {
		
		log.info(hRUseritemedu.toString());
		
		hRUseritemedu.setHr(hRService.getHR(hrid));
		
		hRUserItemService.insert(hRUseritemedu);
	
	}
	
	@RequestMapping("/deleteEdu/{eduid}")
	@ResponseBody
	public void deleteEdu(@PathVariable Long eduid) {
		
		hRUserItemService.deleteEdu(eduid);
	}
	
	/*경력*/
	
	@RequestMapping("/updateCareer")
	@ResponseBody
	public void updateCareer(HRUseritemCareer hRUseritemCareer) {
		
		log.info(hRUseritemCareer.toString());
		
		hRUserItemService.update(hRUseritemCareer);
	
	}
	
	@RequestMapping("/insertCareer")
	@ResponseBody
	public void insertCareer(HRUseritemCareer hRUseritemCareer, Long hrid) {
		
		log.info(hRUseritemCareer.toString());
		
		hRUseritemCareer.setHr(hRService.getHR(hrid));
		
		hRUserItemService.insert(hRUseritemCareer);
	
	}
	
	@RequestMapping("/deleteCareer/{careerid}")
	@ResponseBody
	public void deleteCareer(@PathVariable Long careerid) {
		
		hRUserItemService.deleteCareer(careerid);
	}
	
	/*자격/면허*/
	
	@RequestMapping("/updateQualified")
	@ResponseBody
	public void updateQualified(HRUseritemQualified hRUseritemQualified) {
		
		log.info(hRUseritemQualified.toString());
		
		hRUserItemService.update(hRUseritemQualified);
	
	}
	
	@RequestMapping("/insertQualified")
	@ResponseBody
	public void insertQualified(HRUseritemQualified hRUseritemQualified, Long hrid) {
		
		log.info(hRUseritemQualified.toString());
		
		hRUseritemQualified.setHr(hRService.getHR(hrid));
		
		hRUserItemService.insert(hRUseritemQualified);
	
	}
	
	@RequestMapping("/deleteQualified/{Qualifiedid}")
	@ResponseBody
	public void deleteQualified(@PathVariable Long Qualifiedid) {
		
		hRUserItemService.deleteQualified(Qualifiedid);
	}
	
	@RequestMapping("/test")
	public String test() {
		
		return folder_name+"getHrList2";
	}
	
	/*학력 목록*/
	 @RequestMapping("/selectAll_edus")
	 @ResponseBody
	 public List<HRUseritemEdu> selectAll_edu(Model model,Long hrid) throws Exception{
		 
		 List<HRUseritemEdu> edulist = (List<HRUseritemEdu>) hRService.getHR(hrid).getEdus();

		 System.out.println(edulist);
		 return edulist;
	 }
	 
	 /*경력 목록*/
	 @RequestMapping("/selectAll_careers")
	 @ResponseBody
	 public List<HRUseritemCareer> selectAll_career(Model model,Long hrid) throws Exception{
		 
		 List<HRUseritemCareer> careerlist = (List<HRUseritemCareer>) hRService.getHR(hrid).getCareers();

		 System.out.println(careerlist);
		 return careerlist;
	 }
	 
	 /*자격 목록*/
	 @RequestMapping("/selectAll_qualifieds")
	 @ResponseBody
	 public List<HRUseritemQualified> selectAll_qualified(Model model,Long hrid) throws Exception{
		 
		 List<HRUseritemQualified> qualifiedlist = (List<HRUseritemQualified>) hRService.getHR(hrid).getQualifieds();

		 System.out.println(qualifiedlist);
		 return qualifiedlist;
	 }
	
}
