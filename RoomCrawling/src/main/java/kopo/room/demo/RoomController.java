package kopo.room.demo;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kopo.room.demo.hiber.Crawl;
import kopo.room.demo.hiber.CrawlService;

@Controller
public class RoomController {

	@Autowired 
	CrawlService CrawlService;
	
	@RequestMapping(value="/room")
	public String Room() {
		
		
		return "room";
	}
	@RequestMapping(value="/room1")
	public String Room1() {
		
		
		return "thymeleaf/room";
	}
	@RequestMapping(value="/ca")
	public String crwalingAgent() {
		
		
		Crawl crawl=CrawlService.selectCrawl(1);
		
		String url = "http://localhost:8080/JoaResort2_2/adm_login.jsp";//본인의 '조아리조트' 예약현황 주소
		String url_act ="http://localhost:8080/JoaResort2_2/adm_loginck.jsp";//로그인 체크 페이지
		/*
		String url = crawl.getLoginURL();
		 String url_act = crawl.getAdm_allview_url;
		 * */
		Document logindoc = null;
		
		Connection.Response loginForm=null;
		try {
			loginForm = Jsoup.connect(url)
			        .method(Connection.Method.GET)
			        .execute();
			logindoc = loginForm.parse();
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}//로그인 폼에서 쿠키를 생성
			
	            
	           Elements te=logindoc.select("form");
	           
	           
	           String URL = te.attr("action");
	           
	           System.out.println("URL :"+URL);
	           
	           URL="http://localhost:8080/JoaResort2_2/"+URL;
	           System.out.println("URL확인 : "+URL);
	            
	           //Document doc = Jsoup.connect(url_act)
	        	Document doc=null;
				try {
					doc = Jsoup.connect(URL)
					.data("jump", "jump가 넘어 오지 않았음")
					.data("id", "admin")
					.data("password", "1111")
					.cookies(loginForm.cookies())//파라미터 전달주의
					.post();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}//로그인 체크 페이지로 name,속성값을 로그인 체크 페이지에 넘겨줌
	           //System.out.println(doc);
	   			
	           int cnt=0;
	           Elements e=doc.select("html");//html의 태그 안부분을 가져옴
	           Pattern p = Pattern.compile("예약가능");//'예약가능'과 일치하는 부분을 찾음
	           Matcher m = p.matcher(e.text());//html안의 태그 포함 모두 출력된다.
	           while(m.find()){
	           	cnt++;
	           }
	           crawl.setEmpty_room(cnt);
	           CrawlService.updateCrawl(crawl);
		
		return "crawlingAgent";
	}
	@RequestMapping(value="/mdb")
	public String makedb(@RequestParam(name="server_num",required=false,defaultValue="0") int server_num,
			@RequestParam(name="login_url",required=false,defaultValue="0") String login_url, Model model){
		
		try {
			
			  Crawl crawl = Crawl.builder() 
					  .servernum(server_num) 
					  .login_url(login_url)
			  .uName("111") 
			  .uValue("111") 
			  .pName("111") 
			  .pValue("111")
			  .adm_allview_url("1111") 
			  .empty_room(0) 
			  .last_req_time(LocalDateTime.now())
			  .last_proc_flag(1) .
			  build();
				
		CrawlService.insertCrawl(crawl);
			
			model.addAttribute("server_num",server_num);//속성 : server_num이고 그 값은 server_num임
			model.addAttribute("login_url",login_url);//속성 : login_url이고 그 값은 login_url임
	
		
		}catch(Exception e) {
			model.addAttribute("msg", e);
			System.out.println(e);
		}
		
		
		return "makedb";
	}
	
	 @RequestMapping(value="/empty") 
	 public String emptyRoom(Model model) {
		 
		 List<Crawl> li = new ArrayList<>(); 
		 li = CrawlService.selectCrawlList();
		 for(int i=0;i<li.size()-1;i++) {
			 
			 
		 }
		 
		 
		 
		 return "emptyRoom";
	 }
	 
	 @RequestMapping(value="/test") 
	 public String test(Model model) {
		
		 
		 return "test";
	 }
	
	 
	
	
}
