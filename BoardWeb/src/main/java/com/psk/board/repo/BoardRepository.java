package com.psk.board.repo;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import com.psk.board.domain.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board,Long>
,QuerydslPredicateExecutor<Board>{
	
	@Query("SELECT b FROM Board b")
	Page<Board> getBoardList(Pageable pageable);
	//페이징 처리를 위해 Page로 받아 들임
}
