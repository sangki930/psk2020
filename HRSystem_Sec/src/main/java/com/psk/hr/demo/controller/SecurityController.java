package com.psk.hr.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecurityController {
	
	@GetMapping("/thymeleaf/system/lll")
	public void lll() {
		
	}
    
    @GetMapping("/system/login")
    public String login() {
		return "thymeleaf/system/login";}
    @GetMapping("/system/accessDenied")
    public String accessDenied() {
    	return "thymeleaf/system/accessDenied";
    }
//    @GetMapping("/system/logout")
//    public String logout() {
//    	return "thymeleaf/logout";
//    }
    @GetMapping("/system/logout")
    public String logout() {
    	return "thymeleaf/system/login";
    }
    @GetMapping("/admin/adminPage")
    public String admin() {
    	return "thymeleaf/admin/adminPage";
    }
   
    
    
}
