package com.psk.hr.demo.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.psk.hr.demo.domain.useritem.UserItem;
import com.psk.hr.demo.logs.ConnectLog;
import com.psk.hr.demo.logs.service.ConnectLogService;
import com.psk.hr.demo.repo.UserItemRepository;
import com.psk.hr.demo.security.SecurityUser;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SecurityUserDetailsService implements UserDetailsService{

        @Autowired
        private UserItemRepository userItemRepository;
        
        @Autowired
        private ConnectLogService conservice;

        @Override
        public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

            UserItem userItem = userItemRepository.findByUsername(username);
            if(userItem==null)//계정이 없으면
            {throw new UsernameNotFoundException(username+"사용자없음");}
            else {
            	String msg=username+"님이 접속하였습니다.";
            	ConnectLog cl = ConnectLog.builder()
            					.username(username)
            					.time(LocalDateTime.now())
            					.msg(msg)
            					.build();
            	
            	conservice.insertConnectLog(cl);//접속한 것을 기록
            	log.info(msg);
                return new SecurityUser(userItem);//인증완료
                
            }
            
        }
        
        
        
}