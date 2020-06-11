package com.psk.hr.demo.service;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.test.web.servlet.MockMvc;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.HR.HRUseritemCareer;
import com.psk.hr.demo.domain.HR.HRUseritemEdu;
import com.psk.hr.demo.domain.account.UserItem;
import com.psk.hr.demo.enums.HRDept;
import com.psk.hr.demo.repo.HRUseritemCareerRepository;
import com.psk.hr.demo.repo.HRUseritemEduRepository;
import com.psk.hr.demo.repo.UserItemRepository;





@SpringBootTest(webEnvironment=WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
public class TestByMockMvcSBA {
	
	@Autowired
	private TestRestTemplate testRestTemplate;
	
	@MockBean
	private HRService hRservice;
	
	@Autowired
	private UserItemService userItemService;
	
	@Autowired
	private UserItemRepository userItemRepository;
	
	@Autowired
	private MockMvc mockMvc;
	
	@Autowired
	private HRUseritemEduRepository hRUseritemEduRepository;
	
	@Autowired
	private HRUseritemCareerRepository hRUseritemCareerRepository;
	
	@Test
	public void testTest() throws Exception{
		
		String result=testRestTemplate.getForObject("/n",String.class);
		
		System.out.println(result);
		
	}
	
	@Test
	public void TestN() throws Exception{
		when(hRservice.hello("박상기")).thenReturn("성공");
		
		this.mockMvc.perform(get("/n").param("name","둘리"))
		.andExpect(status().isOk())
//		.andExpect(content().string("Hello : 둘리"))
		.andDo(print());
	}
	
	@Test
	public void TestNN() throws Exception{
when(hRservice.hello("박상기")).thenReturn("성공");
		
		this.mockMvc.perform(get("/nn").param("name","둘리"))
		.andExpect(status().isOk())
//		.andExpect(content().string("Hello : 둘리"))
		.andDo(print());
	}
	
	@Test
	public void insertTest() throws Exception{
		
		for(int i=1;i<=1;i++) {
		UserItem userItem = UserItem.builder()
									.username("admin"+i)
									.name("옥주현"+i)
									.password("1111")
									.birth(LocalDate.of(2000, 1, 31))
									.email("aaa"+i+"@aaa.com")
									.gender(true)
									.tel("")
									.hR(null)
									.build();
		
		HR hR = HR.builder()
		.carNumber("11가 5121")
		//
		.entered(LocalDate.of(2020, 1, 1).plusDays(i))
		.juminId("11111"+i)
		.exited(null)
		.rank_name("사원")
		.hrDept(HRDept.개발팀)
		.IsMarried(true)
		.married(LocalDate.of(2017, 1, 1))
		.userItem(userItem)
		.build();

					userItem.setHR(hR);
		
		
			userItemService.insertUser(userItem);
		}
		
//		HR hR = HR.builder()
//				.carNumber("11가 5121")
//				//
//				.entered(LocalDate.of(2020, 1, 1))
//				.juminId("11111")
//				.exited(null)
//				.rank_name("과장")
//				.hrDept(HRDept.개발팀)
//				.IsMarried(true)
//				.married(LocalDate.of(2017, 1, 1))
//				.userItem(userItem)
//				.build();
//		
//		userItem.setHR(hR);
//		
//		
//		userItemService.insertUser(userItem);
		
	}
//	@Test
//	@Transactional
//	public void selectOne() {
//		
//		UserItem userItem = userItemRepository.findById(30L).get();
//		
////		System.out.println(userItem.toString());
//		
//		System.out.println("HR확인 : "+userItem.getHR().toString());
//		
//		HR hR = userItem.getHR();
//		System.out.println("유저확인 : "+hR.getUserItem().toString());
//		System.out.println("Edu 확인" + hR.getEdus().toString());
//		System.out.println("Career 확인" + hR.getCareers().toString());
//		System.out.println("자격 확인 :" +hR.getQualifieds().toString());
//		
//		
//		
//		List<HRUseritemEdu> list = hRUseritemEduRepository.findAllByHr(hR);
//		
//		System.out.println(list);
//		
////		List<HRUseritemEdu> eduopt=(List<HRUseritemEdu>) hR.getEdus();
////		
////		if(eduopt.isEmpty()==false) {
////		System.out.println("Career 확인" + userItem.getHR().getEdus().toString());
////		}
//	}
	
	@Test
	public void SelectTest() {
UserItem userItem = userItemRepository.findById(11L).get();
		
//		System.out.println(userItem.toString());
		
//		
		System.out.println("HR확인 : "+userItem.getHR().toString());
		HR hR = userItem.getHR();
		System.out.println("Edu 확인" + hR.getEdus().toString());
		System.out.println("Career 확인" + hR.getCareers().toString());
		System.out.println("자격 확인 :" +hR.getQualifieds().toString());
	}
	
	@Test
//	@Transactional
	public void insertEdu() {
		HR hR = userItemRepository.findById(1L).get().getHR();
//		System.out.println(hR.getEmpId());
//		int i=33;
//		for(int i=0;i<=13;i++) {
//			
//			HRUseritemEdu hRUseritemEdu
//			= HRUseritemEdu.builder()
//					.addr("주소"+i)
//					.major("전공"+i)
//					.build();
//			hRUseritemEdu.setHr(hR);
//			hRUseritemEduRepository.save(hRUseritemEdu);
//			
//		}
		for(int i=0;i<=13;i++) {
			HRUseritemEdu hRUseritemEdu= new HRUseritemEdu();
			hRUseritemEdu.setId(null);
			hRUseritemEdu.setAddr("주소"+i);
			hRUseritemEdu.setMajor("전공"+i);
			hRUseritemEdu.setHr(hR);
			hRUseritemEduRepository.save(hRUseritemEdu);
		}
		
	}
	
	@Test
//	@Transactional
	public void delete() {
//		userItemRepository.delete(userItemRepository.findById(7L).get());
		userItemRepository.deleteById(userItemRepository.findById(7L).get().getUserId());
	}
	
	
	@Test
//	@Transactional
	public void deleteTest()
	{
		userItemService.deleteUser(userItemRepository.findById(150L).get());
		System.out.println("삭제완료");
	}
	
	@Autowired
	private HRUserItemService service;
	
	@Test
	@Transactional
	public void getTest() {
		
//		List<?> list=service.findAllByHr(userItemRepository.getOne(30L).getHR());
//		System.out.println(list);
		
	}
	
	@Test
//    @Transactional
	public void selectOne() {
		
			UserItem userItem = new UserItem();
			HR hR = new HR();
		
//		for(int i=1;i<=1;i++) {
//		userItem = UserItem.builder()
//										.username("admin"+i)
//										.name("성주현"+i)
//										.password("1111")
//										.birth(LocalDate.of(2000, 1, 31))
//										.email("aaa"+i+"@aaa.com")
//										.gender(true)
//										.tel("")
//										.hR(null)
//										.build();
//			
//			hR = HR.builder()
//			.carNumber("11가 5121")
//			//
//			.entered(LocalDate.of(2020, 1, 1).plusDays(i))
//			.juminId("111111-111111"+i)
//			.exited(null)
//			.rank_name("사원")
//			.hrDept(HRDept.개발팀)
//			.IsMarried(true)
//			.married(LocalDate.of(2017, 1, 1))
//			.userItem(userItem)
//			.build();
//
//						userItem.setHR(hR);
//			
//			
//				userItemService.insertUser(userItem);
//			}
		
		userItem = userItemRepository.findById(1L).get();
		hR = userItem.getHR();
		
//		System.out.println(userItem.toString());
		
		List<HRUseritemEdu> testlist1  =new ArrayList<>();
//		
		
		
		for(int i=1;i<=3;i++) {
	
			
			HRUseritemEdu hRUseritemEdu
			= HRUseritemEdu.builder()
					.addr("주소"+i)
					.major("전공"+i)
					.build();
			hRUseritemEdu.setHr(hR);
			System.out.println(hRUseritemEdu.toString());
			hRUseritemEduRepository.save(hRUseritemEdu);
//			
//			
			testlist1.add(hRUseritemEdu);
		}
		
		List<HRUseritemCareer> testlist2=new ArrayList<>();
		
//		
		for(int i=1;i<=4;i++) {
	
			
			HRUseritemCareer hRUseritemCareer
			= HRUseritemCareer.builder()
					.careerDept("사원")
					.companyName("회사  :" +i)
					.hr(hR)
					.build();
//			hRUseritemCareer.setHr(hR);
			hRUseritemCareerRepository.save(hRUseritemCareer);
//			
//			
			testlist2.add(hRUseritemCareer);
		}
		
//		hR.setEdus(testlist1);
//		hR.setCareers(testlist2);
//		
		System.out.println("HR확인 : "+userItem.getHR().toString());
		
		System.out.println("유저확인 : "+hR.getUserItem().toString());
		System.out.println("Edu 확인" + hR.getEdus().toString());
		System.out.println("Career 확인" + hR.getCareers().toString());
		System.out.println("자격 확인 :" +hR.getQualifieds().toString());
//		
//		
//		
//		List<HRUseritemEdu> list = hRUseritemEduRepository.findAllByHr(hR);
//		
//		System.out.println(list);
		
//		List<HRUseritemEdu> eduopt=(List<HRUseritemEdu>) hR.getEdus();
//		
//		if(eduopt.isEmpty()==false) {
//		System.out.println("Career 확인" + userItem.getHR().getEdus().toString());
//		}
	}
	
	
	@Autowired
	HRService hRService;
	
	@Test
	@Transactional
	public void selectHR() {
		
//		HR hR = userItemRepository.findById(2L).get().getHR();
		HR hR = hRService.getHR(1L);
		
		System.out.println("HR확인 : "+hR.toString());
		
//		System.out.println("유저확인 : "+hR.getUserItem().toString());
//		System.out.println("Edu 확인" + hR.getEdus().toString());
//		System.out.println("Career 확인" + hR.getCareers().toString());
//		System.out.println("자격 확인 :" +hR.getQualifieds().toString());
		
		
	}
	
	
	
}


