package com.psk.JoaResort.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psk.JoaResort.DTO.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long>{

	
}
