package kopo.room.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import kopo.room.demo.hiber.Crawl;
import kopo.room.demo.hiber.CrawlService;

@RestController
@RequestMapping(value = "/Crawl")
@Api(value = "CrawlController", description = "사용자 관련 API",basePath = "/Crawl")
public class RoomRestController {
 
	/*
	 * @Autowired CrawlService CrawlService;
	 * 
	 * 
	 * @RequestMapping(value = "", method = RequestMethod.GET)
	 * 
	 * @ApiOperation(value = "사용자 목록 조회", notes = "사용자 목록을 조회하는 API.") public
	 * List<Crawl> getCrawlList(){ return CrawlService.selectCrawlList(); }
	 * 
	 * @RequestMapping(value = "/{uid}", method = RequestMethod.GET)
	 * 
	 * @ApiOperation(value = "사용자 정보 조회", notes =
	 * "사용자의 정보를 조회하는 API. Crawl entity 클래스의 uid값을 기준으로 데이터를 가져온다.") public Crawl
	 * getCrawl( @PathVariable("uid") Long uid ){ return
	 * CrawlService.selectCrawl(uid); }
	 * 
	 * @RequestMapping(value = "", method = RequestMethod.POST)
	 * 
	 * @ApiOperation(value = "사용자 정보 등록", notes =
	 * "사용자 정보를 저장하는 API. Crawl entity 클래스로 데이터를 저장한다.") public
	 * ResponseEntity<ApiResponseMessage> insertCrawl( Crawl Crawl ){
	 * ApiResponseMessage message = new ApiResponseMessage("Success", "등록되었습니다.",
	 * "", ""); ResponseEntity<ApiResponseMessage> response = new
	 * ResponseEntity<ApiResponseMessage>(message, HttpStatus.OK);
	 * 
	 * try { CrawlService.insertCrawl(Crawl); } catch(Exception ex){ message = new
	 * ApiResponseMessage("Failed", "사용자 등록에 실패하였습니다.", "ERROR00001",
	 * "Fail to registration for Crawl information."); response = new
	 * ResponseEntity<ApiResponseMessage>(message,
	 * HttpStatus.INTERNAL_SERVER_ERROR); }
	 * 
	 * return response; }
	 * 
	 * @RequestMapping(value = "", method = RequestMethod.PUT)
	 * 
	 * @ApiOperation(value = "사용자 정보 수정", notes =
	 * "사용자 정보를 수정하는 API. Crawl entity 클래스로 데이터를 수정한다.<br>이때엔 정보를 등록할 때와는 다르게 uid 값을 함깨 보내줘야한다."
	 * ) public ResponseEntity<ApiResponseMessage> updateCrawl( Crawl Crawl ){
	 * ApiResponseMessage message = new ApiResponseMessage("Success", "등록되었습니다.",
	 * "", ""); ResponseEntity<ApiResponseMessage> response = new
	 * ResponseEntity<ApiResponseMessage>(message, HttpStatus.OK);
	 * 
	 * try { CrawlService.updateCrawl(Crawl); } catch(Exception ex){ message = new
	 * ApiResponseMessage("Failed", "사용자 정보 수정에 실패하였습니다.", "ERROR00002",
	 * "Fail to update for Crawl information."); response = new
	 * ResponseEntity<ApiResponseMessage>(message,
	 * HttpStatus.INTERNAL_SERVER_ERROR); }
	 * 
	 * return response; }
	 * 
	 * @RequestMapping(value = "/{uid}", method = RequestMethod.DELETE)
	 * 
	 * @ApiOperation(value = "사용자 정보 삭제", notes =
	 * "사용자 정보를 삭제하는 API. Crawl entity 클래스의 uid 값으로 데이터를 삭제한다.") public
	 * ResponseEntity<ApiResponseMessage> deleteCrawl( @PathVariable("uid") Long uid
	 * ){ ApiResponseMessage message = new ApiResponseMessage("Success", "등록되었습니다.",
	 * "", ""); ResponseEntity<ApiResponseMessage> response = new
	 * ResponseEntity<ApiResponseMessage>(message, HttpStatus.OK);
	 * 
	 * try { CrawlService.deleteCrawl(uid); } catch(Exception ex){ message = new
	 * ApiResponseMessage("Failed", "사용자 정보 삭제에 실패하였습니다.", "ERROR00003",
	 * "Fail to remove for Crawl information."); response = new
	 * ResponseEntity<ApiResponseMessage>(message,
	 * HttpStatus.INTERNAL_SERVER_ERROR); }
	 * 
	 * return response; }
	 */
}
