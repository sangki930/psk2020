package com.psk.JoaResort.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psk.JoaResort.DTO.Notice;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long>{

}
