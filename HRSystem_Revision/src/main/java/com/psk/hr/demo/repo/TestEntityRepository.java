package com.psk.hr.demo.repo;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.psk.hr.demo.logs.test.TestEntity;

public interface TestEntityRepository extends MongoRepository<TestEntity,Long>{

}
