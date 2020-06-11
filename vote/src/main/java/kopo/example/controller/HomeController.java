package kopo.example.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) { //home.jsp로 접속
		logger.info("Welcome home! The client locale is {}.", locale);
		/*
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		*/
		return "home";
	}
	
	@RequestMapping(value = "A_02", method = RequestMethod.POST)//A_02.jsp(삭제)로 접속
	public String A_02(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "A_02";
	}
	@RequestMapping(value = "A_03", method = RequestMethod.POST)//A_03.jsp(삽입)으로 접속
	public String A_03(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "A_03";
	}
	@RequestMapping(value = "B_01", method = {RequestMethod.GET})//B_01.jsp으로 접속
	public String B_01(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "B_01";
	}
	@RequestMapping(value = "B_02", method = {RequestMethod.GET, RequestMethod.POST})//B_02.jsp으로 접속
	public String B_02(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "B_02";
	}
	@RequestMapping(value = "C_01", method = {RequestMethod.GET, RequestMethod.POST})//C_01.jsp로 접속
	public String C_01(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "C_01";
	}
	@RequestMapping(value = "C_02", method = {RequestMethod.GET, RequestMethod.POST})//C_02.jsp로 접속
	public String C_02(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "C_02";
	}
	
	
}
