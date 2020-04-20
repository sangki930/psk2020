package com.psk.hr.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CharacterEncodingFilter;

@SpringBootApplication
public class HrSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(HrSystemApplication.class, args);
	}

	//한글 깨짐 방지
	@Bean
	public FilterRegistrationBean encodingFilterBean() {
		FilterRegistrationBean registrationBean
		=new FilterRegistrationBean();
		CharacterEncodingFilter characterEncodingFilter
		=new CharacterEncodingFilter();
		characterEncodingFilter.setForceEncoding(true);
		characterEncodingFilter.setEncoding("UTF-8");
		registrationBean.setFilter(characterEncodingFilter);
		return registrationBean;
	}
}
