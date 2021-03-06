package com.psk.hr.demo.logs.test;

import javax.persistence.Id;

import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Document(collection="testentity")
@Getter
@Setter
@ToString
@Builder
public class TestEntity {

	@Id
	@Field("_id")
	private String id;
	
	@Field("record")
	private String record;
}
