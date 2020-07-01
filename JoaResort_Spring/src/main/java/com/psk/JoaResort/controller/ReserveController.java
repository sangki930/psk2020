package com.psk.JoaResort.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReserveController {

	@ResponseBody
	@GetMapping
	public String getReply(String s) {
		return null;
	}
}
