package com.sample.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sample.demo.domain.Sample;

@Repository
public interface SampleRepository extends JpaRepository<Sample, Long>{
	
}