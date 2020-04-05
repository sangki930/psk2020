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
    
    private final String foldername="thymeleaf/";
    
//    @RequestMapping("/getBoardList")
//    public String getBoardList(Model model, Board board) {
//        Page<Board> boardList = boardService.getBoardList(board);
//        model.addAttribute("boardList", boardList);
//        
//        log.debug("총 element 수 : {}, 전체 page 수 : {}, 페이지에 표시할 element 수 : {}, 현재 페이지 index : {}, 현재 페이지의 element 수 : {}",
//                boardList.getTotalElements(), boardList.getTotalPages(), boardList.getSize(),
//                boardList.getNumber(), boardList.getNumberOfElements());
//        return "board/getBoardList";
//    }
    
    
    //Pagenation 추가
//    @RequestMapping("/getBoardList")
//    public String getBoardList(@PageableDefault Pageable pageable, Model model) {
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
        
//        if(search.getSearchCondition()==null) {
//            search.setSearchCondition("TITLE");
//        }
//        if(search.getSearchKeyword()==null) {
//            search.setSearchKeyword("");
//        }
        Page<Board> boardList = boardService.getBoardList(pageable);
//        Page<Board> boardList = boardService.getBoardList(search);
        model.addAttribute("boardList", boardList);

        System.out.println();
        log.debug("총 element 수 : {}, 전체 page 수 : {}, 페이지에 표시할 element 수 : {}, 현재 페이지 index : {}, 현재 페이지의 element 수 : {}",
                boardList.getTotalElements(), boardList.getTotalPages(), boardList.getSize(),
                boardList.getNumber(), boardList.getNumberOfElements());

        return foldername+"board/getBoardList";
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

        return foldername+"board/getBoardList";
    }
    
    //글 조회
    @GetMapping("/getBoard")
    public String getBoard(Board board, Model model)
    {
        Board attributeValue = boardService.getBoard(board);
        model.addAttribute("board", attributeValue);
        return foldername+"board/getBoard";
    }
    
    //글 추가 화면전환
    @GetMapping("/insertBoard")
    public String insertBoardView() {
    	return foldername+"board/insertBoard";
    }
    
    //글 추가
    @PostMapping("/insertBoard")
    public String insertBoard(Board board, @AuthenticationPrincipal SecurityUser principal) {
    	board.setMember(principal.getMember());
    	boardService.insertBoard(board);
    	
    	return "redirect:getBoardList";
    }
    
    //글 수정
    @PostMapping("/updateBoard")
    public String updateBoard(Board board) {
    	boardService.updateBoard(board);
    	return "forward:getBoardList";
    }
    
    //글 삭제
    @GetMapping
    public String deleteBoard(Board board) {
    	boardService.deleteBoard(board);
    	return "forward:getBoardList";
    }
    
    
}