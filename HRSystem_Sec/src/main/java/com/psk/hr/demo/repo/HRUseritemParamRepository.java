package com.psk.hr.demo.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.psk.hr.demo.domain.HR.HRUseritemParam;


@Repository
public interface HRUseritemParamRepository extends JpaRepository<HRUseritemParam, Long>, JpaSpecificationExecutor<HRUseritemParam> {

}
