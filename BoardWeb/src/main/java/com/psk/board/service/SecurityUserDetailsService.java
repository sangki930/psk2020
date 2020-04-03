package com.psk.board.service;

import java.lang.reflect.Member;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.psk.board.domain.*;
import com.psk.board.repo.MemberRepository;
import com.psk.board.security.SecurityUser;

@Service
public class SecurityUserDetailsService implements UserDetailsService{

		@Autowired
		private MemberRepository memberRepository;

		@Override
		public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

			Optional<com.psk.board.domain.Member> optional = memberRepository.findById(username);
			if(!optional.isPresent())//계정이 없으면
			{throw new UsernameNotFoundException(username+"사용자없음");}
			else {
				com.psk.board.domain.Member member = optional.get();
				return new SecurityUser(member);//인증완료
				
			}
			
		}
		
		
		
}
