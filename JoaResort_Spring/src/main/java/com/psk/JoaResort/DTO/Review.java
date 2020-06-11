package com.psk.JoaResort.DTO;

import java.time.LocalDate;

public class Review {
	
	private Long id;//게시글 고유 번호
	private String title;//제목
	private LocalDate date;//날짜
	private String content;//
	private int rootid;//원글 번호
	private int relevel;//글 수준
	private int recnt;// 댓글 내 순서
	private int viewcnt;// 조회수
	private String filename;//파일이름

}
