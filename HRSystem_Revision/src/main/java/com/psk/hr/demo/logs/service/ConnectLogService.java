package com.psk.hr.demo.logs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psk.hr.demo.logs.ConnectLog;
import com.psk.hr.demo.logs.repo.ConnectLogRepository;


//접속 기록 서비스
@Service
public class ConnectLogService {

	@Autowired
	private ConnectLogRepository conrepo;
	
	public ConnectLog getConnectLog(String username) {
		return conrepo.findByUsername(username);
	}
	
	public List<ConnectLog> getAllConnectLog() {
		return conrepo.findAll();
	}
	
	public ConnectLog insertConnectLog(ConnectLog cl) {
		return conrepo.insert(cl);
	}
	
}
