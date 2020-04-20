package com.psk.hr.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.repo.UserItemRepository;
import com.psk.hr.demo.repo.UserSpecs;
import com.psk.hr.demo.service.UserItemService;

@Controller
@RequestMapping("/user")
//@Slf4j
public class UserItemController {

	@SuppressWarnings("unused")
	@Autowired
	private UserItemService userItemService;

	@Autowired
	private UserItemRepository userRepo;

	private static final String folder_name = "thymeleaf/user";

	@RequestMapping("/getuserItemList")
	public String member(Pageable pageable, Model model) {

		Page<UserItem> userItemList = userItemService.getUserItemList(pageable);

		model.addAttribute("userItemList", userItemList);

		return folder_name + "/getuserItemList";
	}

	@GetMapping("/getUser")
	public String getUser(UserItem userItem, Model model) {

		UserItem user = userItemService.getUserItem(userItem);
		model.addAttribute("user", user);
		return folder_name + "/getUser";
	}

	// 화면전환
	@GetMapping("/insertUser")
	public String insertUserView() {
		return folder_name + "/insert";
	}

	// 실제 삽입
	@PostMapping("/insertUser")
	@Transactional
	public String insertUser(@ModelAttribute UserItem userItem) {

		userItemService.insertUser(userItem);

		return "redirect:getuserItemList";

	}

	// 글 수정
	@PostMapping("/updateUser")
	public String updateUser(UserItem userItem) {
		
		System.out.println(userItem.getUserId());
		System.out.println(userItem.getTel());
		userItemService.updateUser(userItem);

		return "redirect:getuserItemList";
	}

	// 글 삭제
	@GetMapping("/deleteUser")
	public String deleteUser(UserItem userItem) {

		userItemService.deleteUser(userItem);
		
		return "forward:getuserItemList";
	}
	

	// 검색
	@GetMapping("/searchUser")
	public String getPostList(@RequestParam(required = false) Map<String, Object> searchRequest, Model model,
			Pageable pageable) {
		
		System.out.println("searchReq : "+searchRequest);
		Map<String, Object> searchKeys = new HashMap<>();
		
//		for (String key : searchRequest.keySet()) {
//			searchKeys.put(key.toUpperCase(), searchRequest.get(key));
//		}
		
			searchKeys.put((String) searchRequest.get("selectColumn"),(String) searchRequest.get("searchKeyword") );
		System.out.println("searchkeys : "+searchKeys);
//	    List<?> list = searchKeys.isEmpty()
//	            ? userRepo.findAll()
//	            : userRepo.findAll(UserSpecs.search(searchKeys));
		
		

		Page<?> list = searchKeys.isEmpty() ? (Page<UserItem>) userRepo.findAll()
				: userItemService.getUserItemList(pageable,UserSpecs.search(searchKeys));

		System.out.println(list);

		model.addAttribute("userItemList", list);
		model.addAttribute("selectColumn",(String)searchRequest.get("selectColumn"));
//		System.out.println("확인 : "+(String)searchKeys.get("selectColumn")+" , "+(String)searchKeys.get("searchKeyword"));
		model.addAttribute("searchKeyword",(String)searchRequest.get("searchKeyword"));
		return folder_name + "/getuserItemList";
	}


	//유저 선택 삭제
	@PostMapping("/deletelist")
	public ModelAndView paramtest(@RequestParam(value="check")String[] check) throws Exception{

		System.out.println(check);
		
		List<Long> list = new ArrayList<>();
		
		for (String str : check) {
			System.out.println(str);
			list.add(Long.parseLong(str));
		}
		
		List<UserItem> userItemlist = new ArrayList<>();
		
		for(Long id : list) {
			
			Optional<?> opt = userRepo.findById(id);
			if(opt.isPresent()) {
			userItemlist.add(userRepo.findById(id).get());
			}
		}
		
		userItemService.deleteUserByChecked(userItemlist);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:getuserItemList");
		mv.addObject("deletelist", check);
		
		return mv;
	}
	

	@RequestMapping("/getTest")
	public String testt() {
		return folder_name+"/getTest";
	}
}
