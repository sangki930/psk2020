package com.psk.board.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psk.board.domain.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member,String>{

}