package com.psk.hr.demo.repo;


import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.psk.hr.demo.domain.account.UserItem;

@Repository
public interface UserItemRepository extends JpaRepository<UserItem, Long>, JpaSpecificationExecutor<UserItem> {

	List<UserItem> findAll(Specification<UserItem> search);
	

//	Page<UserItem> getUserList(Pageable pageable);
}
