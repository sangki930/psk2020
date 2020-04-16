package kopo.room.demo.hiber;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.ImmutableList;

import kopo.room.demo.repository.CrawlRepository;



	@Service
	public class CrawlServiceImple implements CrawlService {
	 
	    @Autowired
	    CrawlRepository CrawlRepository;
	     
	    @Override
	    @Transactional(readOnly = true, isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	    public List<Crawl> selectCrawlList() {
	        return (List<Crawl>) CrawlRepository.findAll();
	    }
	 
	    @Override
	    @Transactional(readOnly = true, isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	    public Crawl selectCrawl(int server_num) {
	        return (Crawl) CrawlRepository.findByServernum(server_num);
	    }
	 
	    @Override
	    @Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	    public void insertCrawl(Crawl Crawl) {
	        CrawlRepository.save(Crawl);
	    }
	 
	    @Override
	    @Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	    public void updateCrawl(Crawl Crawl) {
	        CrawlRepository.save(Crawl);
	    }
	 
	    @Override
	    @Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	    public void deleteCrawl(int server_num) {
	        CrawlRepository.deleteById(server_num);
	 
	    }
	
	

}
