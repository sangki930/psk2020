package com.psk.hr.demo.logs.repo;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.psk.hr.demo.logs.ReqLog;

public interface ReqLogRepository extends MongoRepository<ReqLog, String>{

}
