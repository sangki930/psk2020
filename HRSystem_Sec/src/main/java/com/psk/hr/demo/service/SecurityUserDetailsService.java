package com.psk.hr.demo.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.repo.UserItemRepository;
import com.psk.hr.demo.security.SecurityUser;

@Service
public class SecurityUserDetailsService implements UserDetailsService{

        @Autowired
        private UserItemRepository userItemRepository;

        @Override
        public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

            UserItem userItem = userItemRepository.findByUsername(username);
            if(userItem==null)//계정이 없으면
            {throw new UsernameNotFoundException(username+"사용자없음");}
            else {
               
                return new SecurityUser(userItem);//인증완료
                
            }
            
        }
        
        
        
}