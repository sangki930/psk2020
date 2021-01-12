package com.psk.hr.demo.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.HR.HRUseritemQualified;

@Repository
public interface HRUseritemQualifiedRepository extends JpaRepository<HRUseritemQualified, Long>, JpaSpecificationExecutor<HRUseritemQualified> {

	HRUseritemQualified findByHr(HR hR);
}
