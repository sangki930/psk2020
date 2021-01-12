package com.psk.hr.demo.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.psk.hr.demo.domain.HR.HRUseritemHistory;

@Repository
public interface HRUseritemHistoryRepository extends JpaRepository<HRUseritemHistory, Long>, JpaSpecificationExecutor<HRUseritemHistory> {

}
