package com.psk.board.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.psk.board.domain.Board;
import com.psk.board.domain.Search;


public interface BoardService {

	void insertBoard(Board board);
	void updateBoard(Board board);
	void deleteBoard(Board board);
	Board getBoard(Board board);
//	Page<Board> getBoardList(Board board);//Pagenation 없음
	Page<Board> getBoardList(Pageable pageable);//Pagenation 있음
	Page<Board> getBoardList(Search search);
}
