package com.psk.hr.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.service.UserItemService;

@Controller
public class IndexController {
	
	@Autowired
	private UserItemService userItemService;
	
	private static final String folder_name = "thymeleaf/user";
	
	@RequestMapping({"/","/index"})
	public String member(Pageable pageable, Model model) {

		Page<UserItem> userItemList = userItemService.getUserItemList(pageable);

		model.addAttribute("userItemList", userItemList);

		return folder_name + "/getuserItemList";
	} 

}
