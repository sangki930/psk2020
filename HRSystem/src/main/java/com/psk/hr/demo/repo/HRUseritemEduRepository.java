package com.psk.hr.demo.repo;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.HR.HRUseritemEdu;

@Repository
public interface HRUseritemEduRepository extends JpaRepository<HRUseritemEdu, Long>, JpaSpecificationExecutor<HRUseritemEdu> {

	List<HRUseritemEdu> findAllByHr(HR hR);
}
