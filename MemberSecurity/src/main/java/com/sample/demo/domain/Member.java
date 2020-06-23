package com.sample.demo.domain;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@ToString
public class Member {

    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//기본키 id값

    private String memberId;//아이디

    private String password;//비밀번호

    private Integer age;//나이
    
    @Enumerated(EnumType.STRING)
    private Role role=Role.MEMBER;

    public Member(String memberId, String password, Integer age) {
        this.memberId = memberId;
        this.password = password;
        this.age = age;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
