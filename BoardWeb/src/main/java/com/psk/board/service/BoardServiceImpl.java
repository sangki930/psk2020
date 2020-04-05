package com.psk.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.psk.board.domain.Board;
import com.psk.board.domain.QBoard;
import com.psk.board.domain.Search;
import com.psk.board.repo.BoardRepository;
import com.querydsl.core.BooleanBuilder;

@Service
public class BoardServiceImpl implements BoardService{
    
    @Autowired
    private BoardRepository boardRepo;
    

    @Override
    public void insertBoard(Board board) {
        // TODO Auto-generated method stub
        boardRepo.save(board);
        
    }

    @Override
    public void updateBoard(Board board) {
        // TODO Auto-generated method stub
        Board findBoard = boardRepo.findById(board.getSeq()).get();
        
        findBoard.setTitle(board.getTitle());
        findBoard.setContent(board.getContent());
        boardRepo.save(findBoard);
        
    }

    @Override
    public void deleteBoard(Board board) {
        // TODO Auto-generated method stub
        boardRepo.deleteById(board.getSeq());
        
    }

    @Override
    public Board getBoard(Board board) {
        // TODO Auto-generated method stub
        return boardRepo.findById(board.getSeq()).get();
    }

//    @Override
//    public Page<Board> getBoardList(Board board) {
//        // TODO Auto-generated method stub
//        Pageable pageable = PageRequest.of(0, 10,Sort.Direction.DESC,"seq");
//        //seq를 기준으로 0번부터 10개를 내림차순으로 얻음
//        return boardRepo.getBoardList(pageable);
//        
//    }
    
    @Override
     public Page<Board> getBoardList(Pageable pageable) {
            int page = (pageable.getPageNumber() == 0) ? 0 : (pageable.getPageNumber() - 1); 
            // page는 index 처럼 0부터 시작
            pageable = PageRequest.of(page, 10);

            return boardRepo.findAll(pageable);
        }

    @Override
    public Page<Board> getBoardList(Search search) {
        // TODO Auto-generated method stub
        BooleanBuilder builder = new BooleanBuilder();
        
        QBoard qboard = QBoard.board;
        
        if(search.getSearchCondition().equals("TITLE"))
        {
            builder.and(qboard.title.like("%"+search.getSearchKeyword()+"%"));
        }else if(search.getSearchKeyword().equals("CONTENT"))
        {
            builder.and(qboard.content.like("%"+search.getSearchKeyword()+"%"));
        }
        
        Pageable pageable = PageRequest.of(0, 10,Sort.Direction.DESC,"seq");
        
        return boardRepo.findAll(builder,pageable);
    	
//    	return null;
    }

}