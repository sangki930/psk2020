package kopo.example.demo.VO;

import java.time.LocalDateTime;

import lombok.*;



@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Serv {

		private @NonNull int server_num; 
		private @NonNull String sar_url; //sar.jsp의 url
		private String time; //time 필드값
		private String cpu; //cpu 필드값
		private String user;//user 필드값
		private double nice; //nice 필드값
		private double system; //system 필드값
		private double iowait; //iowait 필드값
		private double steal; //steal 필드값
		private double idle; //idle 필드값
		private LocalDateTime last_req_time; //업데이트 시간
		private int last_proc_flag;
		//마지막 작업플래그, 즉 수집 작업 시작 때 마킹하고 수집 작업함. 다음 수집작업은 +1한 서버를 조회함
		//(1:true, 0 :false)


	
}
