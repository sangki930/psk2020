package kopo.room.demo.hiber;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.*;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="crawlagent")
public class Crawl {

	//@Id는 해당 테이블의 row를 식별할 Column을 의미한다.
	//즉 "PKEY"가 걸린 Column을 의미한다.
	//@GeneratedValue int형의 경우 "auto increment"를 사용할 수 있는데 이런 경우에 명시를 해준다(자동증가 행이라는걸 의미)
	
	
	@Id
	/* @GeneratedValue */
	private @Column(name="servernum") int servernum;
	

	private @Column(name="login_url") String login_url;
	private @Column(name="uName") String uName;
	private @Column(name="uValue") String uValue;
	private @Column(name="pName") String pName;
	private @Column(name="pValue") String pValue;
	private @Column(name="adm_allview_url") String adm_allview_url;
	private @Column(name="empty_room") int empty_room;
	private @Column(name="last_req_time") LocalDateTime last_req_time;
	private @Column(name="last_proc_flag") int last_proc_flag;
	
}
