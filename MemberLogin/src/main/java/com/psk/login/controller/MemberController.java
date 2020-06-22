package com.psk.login.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psk.login.domain.Member;
import com.psk.login.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

	private final MemberRepository memberRepository;
	
	private final PasswordEncoder passwordEncoder;

//    @GetMapping("/main")
//    public String mainPage(Map<String, Object> model) {
//        List<Member> members = memberRepository.findAll();
//        model.put("members", members);
//        return "homepage";
//    }

    @GetMapping("/admin")
    public String adminPage(Map<String, Object> model) {
        return "adminpage";
    }

    @GetMapping("/member/new")
    public String memberJoinForm(Member memberForm) {
        return "memberJoinForm";
    }


    @PostMapping("/member/new")
    public String memberJoin(Member memberForm) {
        /* PasswordEncoder로 비밀번호 암호화 */
        memberForm.setPassword(passwordEncoder.encode(memberForm.getPassword()));
        memberRepository.save(memberForm);
        return "redirect:/main";
    }
   
    //인증된 사용자 정보 가져오기
    @RequestMapping("/main")
    public String mainPage(@AuthenticationPrincipal User user,
                            Map<String, Object> model) {
        List<Member> members = memberRepository.findAll();
        System.out.println(members);
        model.put("members", members);
        model.put("currentMemberId", user.getUsername());
        return "homepage";
    }
}
