package com.sample.demo.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

//로그인 성공 핸들러
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	public LoginSuccessHandler() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		System.out.println(authentication.getName());
		response.sendRedirect("/test/homepage");
		
	}

}
