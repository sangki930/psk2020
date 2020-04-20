package com.psk.hr.demo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.repo.HRRepository;
import com.psk.hr.demo.repo.HRSpecs;
import com.psk.hr.demo.repo.HRUseritemEduRepository;
import com.psk.hr.demo.repo.UserItemRepository;
import com.psk.hr.demo.service.HRService;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/hr")
@Slf4j
public class HRController {
	
	private static final String folder_name="thymeleaf/hr/";
	
	 private static final Logger log = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	private HRService hRService;

	@Autowired
	private HRRepository hRRepo;

	@RequestMapping("/ttt")
	public void tttt(Model model) {
		
//		List<>
//		
//		model.addAttribute("edulist", );
	}
	
	@RequestMapping("/hrhome")
	public ModelAndView hrhome(Pageable pageable) {
		
		ModelAndView mv = new ModelAndView();
		
		Page<HR> hrlist=hRRepo.findAll(pageable);
		
		mv.setViewName(folder_name+"hrhome");
		mv.addObject("hrList", hrlist);
		
		return mv;
	}
	
//	@RequestMapping("/getHrList")
//	public ModelAndView getHrList(HR hr) {
//	
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName(folder_name+"hrhome");
//		mv.addObject("hrlist", hr);
//		return mv;
//	}
	
	@GetMapping("/getHr")
	@Transactional
	public String getHr(HR hr,Model model) {
		
		hr=hRService.getHR(hr.getId());
		log.info(hr.toString());
		
		model.addAttribute("hr", hr);
		log.info(hr.getEdus().toString());
		log.info(hr.getHistories().toString());
		log.info(hr.getQualifieds().toString());
		log.info(hr.getCareers().toString());
		
		return folder_name+"getHr";
	}
	
//	@RequestMapping("/insertHr")
//	public String insertHr(HR hr){
//		
////		hRService.insertHR(hr);
//		
//		return "/hr/insertHr";
//	}
	
	@RequestMapping("/insertHr")
	public String insertHr(HR hr,Model model,UserItem userItem){
		
//		hRService.insertHR(hr);
		hr=hRService.getHR(userItem.getHR().getId());
		
		model.addAttribute("edus",hr.getEdus());
		model.addAttribute("hr", hr);
		
		
		return folder_name+"insertHr";
	}
	
	@Autowired
	private UserItemRepository userRepo;
	
	@RequestMapping("/updateHr")
	public String updateHr(HR hr,UserItem userItem){
		
		System.out.println("업데이트");
		
//		userItem = userRepo.findById(useritemid).get();
		log.info("유저 :"+userItem.toString());
		
		hr.setUserItem(userRepo.findById(userItem.getUserId()).get());
		
		log.info(hr.toString());
		hRService.updateHR(hr);
		return "redirect:"+"getHr?id="+hr.getId();
	}
	
	@RequestMapping("/deleteHr")
	public String deleteHr(Long id) {
		
		hRService.deleteHR(hRService.getHR(id));
		return "redirect:getHrList";
	}
	
	// 검색
		@GetMapping("/searchHr")
		public String getPostList(@RequestParam(required = false) Map<String, Object> searchRequest, Model model,
				Pageable pageable) {
			
			System.out.println(searchRequest);
			Map<String, Object> searchKeys = new HashMap<>();

				searchKeys.put((String) searchRequest.get("selectColumn"),(String) searchRequest.get("searchKeyword") );
			System.out.println("searchKeys : "+searchKeys);			

			Page<HR> list = searchKeys.isEmpty() ? (Page<HR>) hRRepo.findAll()
					: hRService.getHRList(pageable,HRSpecs.search(searchKeys));

			System.out.println("결과 : "+list);

			model.addAttribute("hrList", list);
			model.addAttribute("selectColumn",(String)searchRequest.get("selectColumn"));
			System.out.println("여기 오는 지 확인");
//			System.out.println("확인 : "+(String)searchKeys.get("selectColumn")+" , "+(String)searchKeys.get("searchKeyword"));
			model.addAttribute("searchKeyword",(String)searchRequest.get("searchKeyword"));
			
			return folder_name + "hrhome";
		}
		
		@Autowired
		HRUseritemEduRepository eduRepo;
		
	
	
	
}
