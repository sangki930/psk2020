package com.psk.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psk.board.domain.Board;
import com.psk.board.domain.Search;
import com.psk.board.security.SecurityUser;
import com.psk.board.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
//	@RequestMapping("/getBoardList")
//	public String getBoardList(Model model, Board board) {
//		Page<Board> boardList = boardService.getBoardList(board);
//		model.addAttribute("boardList", boardList);
//		
//		log.debug("총 element 수 : {}, 전체 page 수 : {}, 페이지에 표시할 element 수 : {}, 현재 페이지 index : {}, 현재 페이지의 element 수 : {}",
//                boardList.getTotalElements(), boardList.getTotalPages(), boardList.getSize(),
//                boardList.getNumber(), boardList.getNumberOfElements());
//		return "board/getBoardList";
//	}
	
	
	//Pagenation 추가
//	@RequestMapping("/getBoardList")
//	public String getBoardList(@PageableDefault Pageable pageable, Model model) {
//        Page<Board> boardList = boardService.getBoardList(pageable);
//        model.addAttribute("boardList", boardList);
//
//        log.debug("총 element 수 : {}, 전체 page 수 : {}, 페이지에 표시할 element 수 : {}, 현재 페이지 index : {}, 현재 페이지의 element 수 : {}",
//                boardList.getTotalElements(), boardList.getTotalPages(), boardList.getSize(),
//                boardList.getNumber(), boardList.getNumberOfElements());
//
//        return "board/getBoardList";
//    }
	
	@RequestMapping("/getBoardList")
	public String getBoardList(@PageableDefault Pageable pageable, Model model) {
		
//		if(search.getSearchCondition()==null) {
//			search.setSearchCondition("TITLE");
//		}
//		if(search.getSearchKeyword()==null) {
//			search.setSearchKeyword("");
//		}
        Page<Board> boardList = boardService.getBoardList(pageable);
//        Page<Board> boardList = boardService.getBoardList(search);
        model.addAttribute("boardList", boardList);

        log.debug("총 element 수 : {}, 전체 page 수 : {}, 페이지에 표시할 element 수 : {}, 현재 페이지 index : {}, 현재 페이지의 element 수 : {}",
                boardList.getTotalElements(), boardList.getTotalPages(), boardList.getSize(),
                boardList.getNumber(), boardList.getNumberOfElements());

        return "board/getBoardList";
    }
	
	@RequestMapping("/getBoardList/search")
	public String getBoardList(Model model, Search search) {
		
		if(search.getSearchCondition()==null) {
			search.setSearchCondition("TITLE");
		}
		if(search.getSearchKeyword()==null) {
			search.setSearchKeyword("");
		}
//        Page<Board> boardList = boardService.getBoardList(pageable);
        Page<Board> boardList = boardService.getBoardList(search);
        
        model.addAttribute("boardList", boardList);

//        log.debug("총 element 수 : {}, 전체 page 수 : {}, 페이지에 표시할 element 수 : {}, 현재 페이지 index : {}, 현재 페이지의 element 수 : {}",
//                boardList.getTotalElements(), boardList.getTotalPages(), boardList.getSize(),
//                boardList.getNumber(), boardList.getNumberOfElements());

        return "board/getBoardList";
    }
	
	//글 조회
	@GetMapping("/getBoard")
	public String getBoard(Board board, Model model)
	{
		Board attributeValue = boardService.getBoard(board);
		model.addAttribute("board", attributeValue);
		
		return "board/getBoard";
	}
	
	//글 등록(화면전환)
	@GetMapping("/insertBoard")
	public String insertBoardView() {
		return "board/insertBoard";
	}
	
	//글 등록(실질적인 글 등록처리)
	/*
	 * 그냥 등록하면 실패하게 되는데 PKEY인 MEMBER_ID에 null을 넣으려고 하기 때문에 오류가 발생한다.
	 * 따라서, 이 문제는 이후에 적용할 스피링 시큐리티를 통해 로그인을 성공한 사용자가 게시글을 등록할 때,
	 * 사용자 정보를 Board 엔티티에 등록하여 처리하면 자연스럽게 해결된다.
	 */
//	@PostMapping("/insertBoard")
//	public String insertBoard(Board board) {
//		boardService.insertBoard(board);
//		return "redirect:getBoardList";
//		//getBoardList로 화면전환
//	}
	
	/*
	 * 로그인에 성공한 회원(Member)객체를 가지고 있는 SecurityUser 객체를 매개변수로 받는다.
	 * 이 때, SecurityUser 타입의 변수 앞에 @AuthenticationPricipal을 추ㄹ가하애야
	 * 인증 정보를 갖고 있는 SecurityUser 객체가 할당된다.
	 */
	@PostMapping("/insertBoard")
	public String insertBoard(Board board, @AuthenticationPrincipal SecurityUser principal) {
		System.out.println("Id가 얻어지는 지 :"+principal.getMember().getId());
		
		board.setMember(principal.getMember());
		
		boardService.insertBoard(board);
		
		System.out.println("성공하면 이 화면 출력");
		return "redirect:getBoardList";
		//getBoardList로 화면전환
	}
	
	//글 수정
	@PostMapping("/updateBoard")
	public String updateBoard(Board board) {
		boardService.updateBoard(board);
		return "forward:getBoardList";
	}
	
	//글 삭제
	@GetMapping("/deleteBoard")
	public String deleteBoard(Board board) {
		boardService.deleteBoard(board);
		return "forward:getBoardList";
	}
	
	

}
