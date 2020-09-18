package com.psk.hr.demo.security;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

@Configuration
public class SecurityMessageConfig {

	 @Bean
	  public MessageSource messageSource() {

	    Locale.setDefault(Locale.KOREA); // 위치 한국으로 설정
	    ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();

	    messageSource.setDefaultEncoding("UTF-8"); // 인코딩 설정
	    messageSource.setBasenames("classpath:message/security-message", "classpath:org/springframework/security/messages"); 
	    // 커스텀한 properties 파일, security properties 파일 순서대로 설정
	    messageSource.setCacheSeconds(5);
	    return messageSource;
	  }
	
}
