package com.psk.login.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {

    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private Long id;

    @Column
    private String memberId;

    @Column
    private String password;

    @Column
    private Integer age;

    public Member(String memberId, String password, Integer age, Boolean isMarried) {
        this.memberId = memberId;
        this.password = password;
        this.age = age;

    }

    public void setPassword(String password) {
        this.password = password;
    }

}