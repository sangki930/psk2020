package com.psk.JoaResort.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	public String sss() {
		
		String s="";
		switch(s)
		{
		case "1"->System.out.println("ssssss");
		}
		
		return null;
	}
	
	@GetMapping("/index")
	public String home(String s)
	{
		return "/index";
	}
}
