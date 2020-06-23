package com.sample.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.demo.domain.Member;
import com.sample.demo.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/test")
@RequiredArgsConstructor
public class MainController {
	
	private final MemberRepository memberRepository;
	
	@RequestMapping("/homepage")//유저 전체 조회
	public String homepage(@AuthenticationPrincipal User user,Map<String, Object> model) {
		List<Member> members = memberRepository.findAll();
        model.put("members", members);
        model.put("currentMemberId", user.getUsername());
		return "test/homepage";
	}
	
	@GetMapping("/admin")//admin페이지
    public String adminPage(Map<String, Object> model) {
        return "test/adminpage";
    }
	
	@GetMapping("/new")//계정생성 화면
	public String memberJoinForm() {
		return "test/memberJoinForm";
	}
	
	private final PasswordEncoder passwordEncoder;
	
	@PostMapping("/new")//계정 생성
    public String memberJoin(Member memberForm) {
		 /* PasswordEncoder로 비밀번호 암호화 */
        memberForm.setPassword(passwordEncoder.encode(memberForm.getPassword()));
        memberRepository.save(memberForm);
        return "redirect:/login";
    }
	
}
