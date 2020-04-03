package com.psk.board.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.psk.board.service.SecurityUserDetailsService;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private SecurityUserDetailsService userDetailsService;

	@Override
	protected void configure(HttpSecurity security) throws Exception {
		// TODO Auto-generated method stub
		security.userDetailsService(userDetailsService);
		
		security.authorizeRequests().antMatchers("/","/system/**").permitAll();
		// '/'와 'system'으로 시작하는 경로에는 인증되지 않은 모든 사용자가 접근
		security.authorizeRequests().antMatchers("/board/**").authenticated();
		// '/board'로 시작하는 경로에는 인증된 사용자만 접근 할 수 있다.
		security.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
		// '/admin'으로 시작하는 경로에는 'ADMIN'권한을 가진 사용자만 접근할 수 있다.
		
		security.csrf().disable();
		security.formLogin().loginPage("/system/login")
		.defaultSuccessUrl("/board/getBoardList", true);
		//인증되지 않은 사용자가 '/board'로 시작하는 경로를 요청했을 때는 '/system/login'으로 리다이렉트
		//로그인에 성공하면, '/board/getBoardList'화면으로 리다이렉트
		
		security.exceptionHandling().accessDeniedPage("/system/accessDenied");
		//로그인 실패하면 /system/accessDenied로 이동
		security.logout().logoutUrl("/system/logout")
		.invalidateHttpSession(true).logoutSuccessUrl("/");
		//사용자가 /system/logout 요청을 전송(즉, 로그아웃할려고 하면)하면 세션을 강제 종료하고
		//인덱스페이지로 이동
		
	}
	
	@Bean
	//암호환 빈 등록
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
		
	}
	
		
}
