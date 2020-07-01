package com.sample.demo.domain;

import java.time.Instant;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class SampleResults {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String user;
	private String name;
	private String password;
	
	@DateTimeFormat
	private Instant makesampletime = Instant.now();


	@Builder
	public SampleResults(Long id, String user, String name, String password, Instant makesampletime) {
		super();
		this.id = id;
		this.user = user;
		this.name = name;
		this.password = password;
		this.makesampletime = makesampletime;
	}
	
	public SampleResults setBatch() {
		
		this.setMakesampletime(Instant.now());
		return this;
	}
	
}
