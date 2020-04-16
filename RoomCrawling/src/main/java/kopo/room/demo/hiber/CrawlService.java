package kopo.room.demo.hiber;

import java.util.List;

public interface CrawlService {

	/**
	 * 사용자 목록 조회
	 * 
	 * @return
	 */
	public List<Crawl> selectCrawlList();

	/**
	 * 사용자 조회
	 * 
	 * @param uid
	 * @return
	 */
	public Crawl selectCrawl(int server_num);

	/**
	 * 사용자 등록
	 * 
	 * @param Crawl
	 */
	public void insertCrawl(Crawl crawl);

	/**
	 * 사용자 정보 수정
	 * 
	 * @param Crawl
	 */
	public void updateCrawl(Crawl crawl);

	/**
	 * 사용자 삭제
	 * 
	 * @param uid
	 */
	public void deleteCrawl(int server_num);

}
