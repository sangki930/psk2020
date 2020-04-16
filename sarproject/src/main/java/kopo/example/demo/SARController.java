package kopo.example.demo;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kopo.example.demo.VO.Serv;
import kopo.example.demo.repo.MonitorRepo;

@EnableAutoConfiguration
@Controller
public class SARController {

	@Autowired
	private MonitorRepo moni;

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(MonitorRepo.class);

	@RequestMapping(value = "/test")
	public String Test() {
		return "test";

	}

	@RequestMapping(value = "/sar")
	public String SAR() {
		return "sar";

	}

	@RequestMapping(value = "/makedb")
	public String MakeDB(Model model) {

		logger.info("DB 생성");
		String s = null;
		Serv serv =null;
		/*
		 * Serv serv = Serv.builder() .server_num(1)
		 * .sar_url("http://192.168.226.129:8080/sar/sar.jsp") .build();
		 */
		
		
		try {
			moni.createDB();
			//moni.insert(serv);
			 serv = Serv.builder() .server_num(1)
					 .sar_url("http://192.168.226.129:8080/sar/sar.jsp") 
					 .build();
			 moni.insert(serv);
			serv = Serv.builder()
					.server_num(2)
					.sar_url("http://192.168.23.99:8080/WebCrawling/sar")
					.build();
			
			moni.insert(serv);
	

			s = "DBcreate 성공";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			s="DBcreate 실패";
		}
		
			model.addAttribute("msg", s);
		return "makedb";

	}

//	@RequestMapping(value = "/sca")
//	public String sar_Crawling_Agent() {
//
//		String URL = "http://192.168.226.129:8080/sar/sar.jsp";// sar.jsp 불러옴
//		// Jsoap 커넥션으로 접속한다. // 파일을 읽을 때는 Jsoup.parse함수를 사용하면 된다.
//		Connection conn = Jsoup.connect(URL);
//		// Document 클래스로 xml데이터를 취득
//		Document doc = null;
//		try {
//			doc = conn.get();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		// item 태그를 가져온다. (iteration 타입이다.)
//		Elements data = doc.select("data");// data 태그가 달린 Element를 몽땅 가져옴
//
//		
//			Elements time = data.select("time");
//			Elements apm = data.select("apm");
//			Elements CPU = data.select("CPU");
//			Elements user = data.select("user");
//			Elements nice = data.select("nice");
//			Elements system = data.select("system");
//			Elements iowait = data.select("iowait");
//			Elements steal = data.select("steal");
//			Elements idle = data.select("idle");
//			
//			System.out.println("==============================");
//			System.out.println(time.text());
//			System.out.println(user.text());
//			System.out.println(Double.parseDouble(nice.text()));
//			System.out.println(Double.parseDouble(system.text()));
//			System.out.println(Double.parseDouble(iowait.text()));
//			System.out.println(Double.parseDouble(steal.text()));
//			System.out.println(Double.parseDouble(idle.text()));
//			System.out.println(LocalDateTime.now());
//			System.out.println(1);
//			
//		
//		//Serv serv =null; 
//		Serv serv = Serv.builder()//serv 객체 만들기
//				.server_num(1)
//				.sar_url("http://192.168.226.129:8080/sar/sar.jsp")
//				.time(time.text())
//				.cpu(CPU.text())
//				  .user(user.text()) 
//				  .nice(Double.parseDouble(nice.text()))
//				  .system(Double.parseDouble(system.text()))
//				  .iowait(Double.parseDouble(iowait.text()))
//				  .steal(Double.parseDouble(steal.text()))
//				  .idle(Double.parseDouble(idle.text()))
//				.last_req_time(LocalDateTime.now())
//				.last_proc_flag(1)
//				.build();
//		try {
//			moni.update(serv);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		// moni.update()
//
//		return "sar_Crawling_Agent";
//
//	}
	@RequestMapping(value="/scat")
	public String sar_Crawling_Agent_test() {
		
		List<Serv> list=null;
		try {
			list = moni.selectAll();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		for(Serv serv : list) {
			String URL = serv.getSar_url();// sar.jsp 불러옴
			// Jsoap 커넥션으로 접속한다. // 파일을 읽을 때는 Jsoup.parse함수를 사용하면 된다.
			Connection conn = Jsoup.connect(URL);
			// Document 클래스로 xml데이터를 취득
			Document doc = null;
			try {
				doc = conn.get();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				break;
			}
			// item 태그를 가져온다. (iteration 타입이다.)
			Elements data = doc.select("data");// data 태그가 달린 Element를 몽땅 가져옴

			
				Elements time = data.select("time");
				Elements apm = data.select("apm");
				Elements CPU = data.select("CPU");
				Elements user = data.select("user");
				Elements nice = data.select("nice");
				Elements system = data.select("system");
				Elements iowait = data.select("iowait");
				Elements steal = data.select("steal");
				Elements idle = data.select("idle");
				
				System.out.println("==============================");
				System.out.println("time : "+time.text());
				System.out.println("apm : "+apm.text());
				System.out.println("user : "+user.text());
				System.out.println("nice: "+Double.parseDouble(nice.text()));
				System.out.println("system : "+Double.parseDouble(system.text()));
				System.out.println("iowait : "+Double.parseDouble(iowait.text()));
				System.out.println("steal : "+Double.parseDouble(steal.text()));
				System.out.println("idle : "+Double.parseDouble(idle.text()));
				System.out.println(Double.parseDouble(idle.text()));
				System.out.println(LocalDateTime.now());
				System.out.println(1);
				
			
			//Serv serv =null; 
			serv = Serv.builder()//serv 객체 만들기
					.server_num(serv.getServer_num())
					/* .sar_url("http://192.168.226.129:8080/sar/sar.jsp") */
					.sar_url(serv.getSar_url())
					.time(time.text())
					.cpu(CPU.text())
					  .user(user.text()) 
					  .nice(Double.parseDouble(nice.text()))
					  .system(Double.parseDouble(system.text()))
					  .iowait(Double.parseDouble(iowait.text()))
					  .steal(Double.parseDouble(steal.text()))
					  .idle(Double.parseDouble(idle.text()))
					.last_req_time(LocalDateTime.now())
					.last_proc_flag(1)
					.build();
			try {
				moni.update(serv);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				break;
			}
			
		}
		
		return "sar_Crawling_Agent_test";
	}

	@RequestMapping(value = "/monitor")
	public String monitor(Model model) {
		
		
		try {
			model.addAttribute("list", moni.selectAll());
			//전체를 고름
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "monitor";

	}

	@RequestMapping(value = "/jQtest")
	public String jQtest() {
		return "jQuerytest";

	}
	
	/*
	 * @RequestMapping(value = "/nf") public String NewFile() { return "htmltest";
	 * 
	 * }
	 */
	@RequestMapping(value = "/nff")
	public String NewFile1() {
		return "thymeleaf/NewFile";
		
	}
	@RequestMapping(value = "/nfff")
	public String NewFile2() {
		return "thymeleaf/tytest";
		
	}
}
