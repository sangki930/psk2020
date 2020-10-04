package com.psk.imageupload.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping("/api")
    public String idx() {
    	return "index";
    }
}
