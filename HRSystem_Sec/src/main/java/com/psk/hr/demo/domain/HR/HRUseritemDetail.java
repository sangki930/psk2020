package com.psk.hr.demo.domain.HR;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HRUseritemDetail {
	
	private Long userId;
	private Long Id;
	private String tel;//UserItem
	private String email;//UserItem
	private String typeEntrance;//hr
	private String typeObstacle;
	private String carNumber;//hr
	private Boolean isMarried;//hr
	private LocalDate married;//hr


}
