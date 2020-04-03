package com.psk.board;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.psk.board.domain.Board;
import com.psk.board.domain.Member;
import com.psk.board.domain.Role;
import com.psk.board.repo.BoardRepository;
import com.psk.board.service.BoardService;

@SpringBootTest
public class BoardServiceTest {
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private BoardRepository boardrepo;

	@Test
	public void insertTest() {
		
		Member member = Member.builder()
				.id("member")
				.password("member123")
				.name("바루스")
				.role(Role.ROLE_MEMBER)
				.enabled(true)
				.build();
		
		
			Board board = Board.builder()
							.member(member)
							.title("나르"+"가 등록한 게시글")
							.content("나르"+"가 쓴 내용")
							.build();
			boardrepo.save(board);
			
		
	}
}
