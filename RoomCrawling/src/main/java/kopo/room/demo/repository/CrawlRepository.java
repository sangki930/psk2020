package kopo.room.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import kopo.room.demo.hiber.Crawl;

@Repository
public interface CrawlRepository extends CrudRepository<Crawl, Integer>{

	List<Crawl> findByuName(String uName);
	Crawl findByServernum(Integer Servernum);
}
