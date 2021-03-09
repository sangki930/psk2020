package com.psk.hr.demo.logs.repo;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.psk.hr.demo.logs.ConnectLog;

public interface ConnectLogRepository extends MongoRepository<ConnectLog,String>{

	public ConnectLog findByUsername(String username);
	
}
