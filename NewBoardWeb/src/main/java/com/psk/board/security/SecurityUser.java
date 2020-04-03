package com.psk.board.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.psk.board.domain.Member;


public class SecurityUser extends User{

    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private Member member;

    public SecurityUser(Member member) {
        //암호화 미적용
//        super(member.getId(), "{noop}"+member.getPassword(), 
//                AuthorityUtils.createAuthorityList(member.getRole().toString()));
        super(member.getId(), member.getPassword(), 
                AuthorityUtils.createAuthorityList(member.getRole().toString()));
        this.member=member;
        // TODO Auto-generated constructor stub
    }
    
    public Member getMember() {
        return member;
    }
    

}