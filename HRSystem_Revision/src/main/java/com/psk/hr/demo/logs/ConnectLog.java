package com.psk.hr.demo.logs;

import java.time.LocalDateTime;

import javax.persistence.Id;

import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Builder;
import lombok.Data;


//접속 기록 로그
@Document
@Data
@Builder
public class ConnectLog {

	//로그 id
	@Id
	private String id;
	
	//계정명
	private String username;
	
	//접속 시간
	private LocalDateTime time;
	
	//메시지
	private String msg;
	
}
