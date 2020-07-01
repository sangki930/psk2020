package com.sample.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.demo.repository.MemberRepository;
import com.sample.demo.service.UserDetailsServiceImpl;


@Controller
public class SecurityController {
	
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private UserDetailsServiceImpl userDetailsServiceImpl;

	@GetMapping("/login")
	public String login(Model model,HttpServletRequest req) throws Exception{
		
		model.addAttribute("message",req.getServletContext());
		
		return "/system/loginform";
	}
	

	
	
}
