package com.psk.board;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.psk.board.domain.Board;
import com.psk.board.domain.Member;
import com.psk.board.domain.Role;
import com.psk.board.repo.BoardRepository;
import com.psk.board.repo.MemberRepository;
import com.psk.board.security.SecurityUser;
import com.psk.board.service.BoardService;

@SpringBootTest
public class BoardRepositoryTest {
	
	@Autowired
	private MemberRepository memberRepo;
	
	@Autowired
	private BoardRepository boardRepo;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Test
	@Disabled
	public void testInsert() {
		Member member = Member.builder()
						.id("member")
						.password(encoder.encode("member123"))
						.name("바루스")
						.role(Role.ROLE_MEMBER)
						.enabled(true)
						.build();
		
		
		memberRepo.save(member);
		
		Member admin = Member.builder()
				.id("admin")
				.password(encoder.encode("admin123"))
				.name("박상기")
				.role(Role.ROLE_ADMIN)
				.enabled(true)
				.build();

		memberRepo.save(admin);
		
		for(int i=1; i<=10;i++) {
			Board board = Board.builder()
							.member(member)
							.title(member.getName()+"가 등록한 게시글"+i)
							.content(member.getName()+"가 쓴 내용"+i)
							.build();
			boardRepo.save(board);
			
		}
		
		for(int i=1; i<=4;i++) {
			Board board = Board.builder()
							.member(admin)
							.title(admin.getName()+"가 등록한 게시글"+i)
							.content(admin.getName()+"가 쓴 내용"+i)
							.build();
			boardRepo.save(board);
			
		}
	}
	
	@Test
	//@Disabled
	public void testGetBoard() {
		Board board = boardRepo.findById(1L).get();
		
		System.out.println("["+board.getSeq()+"번 게시글 상세 정보 ]");
		System.out.println("제목\t : "+board.getTitle());
		System.out.println("작성자\t : "+board.getMember().getName());
		System.out.println("내용\t : "+board.getContent());
		System.out.println("등록일\t : "+board.getCreateDate());
		System.out.println("조회수\t : "+board.getCnt());
	}
	
	@Test
	public void testGetBoardList() {
		
		Member member = memberRepo.findById("member").get();
		
		System.out.println("["+member.getName()+"가 등록한 게시글]");
		for(Board board : member.getBoardList()) {
			System.out.println("--->"+board.toString());
		}
	}
	
	@Autowired
	BoardService boardService;
	
}
