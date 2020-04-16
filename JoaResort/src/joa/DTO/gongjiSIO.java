package joa.DTO;

import java.util.Date;

public class gongjiSIO {
	
	private int id;//게시글 고유 번호
	private String title;//제목
	private Date date;//날짜
	private String content;//
	private int rootid;//원글 번호
	private int relevel;//글 수준
	private int recnt;// 댓글 내 순서
	private int viewcnt;// 조회수
	private String filename;//���ϸ�
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public gongjiSIO() {
		super();
	}
	public gongjiSIO(int id, String title, Date date, String content, int rootid, int relevel, int recnt, int viewcnt, String filename) {
		super();
		this.id = id; //게시글 고유 번호
		this.title = title; //게시글 제목
		this.date = date; //게시 날짜
		this.content = content; //게시한 내용
		this.rootid = rootid; //원글 번호
		this.relevel = relevel; //
		this.recnt = recnt; //댓글 개수
		this.viewcnt = viewcnt; //조회수
		this.filename = filename;//파일명
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRootid() {
		return rootid;
	}
	public void setRootid(int rootid) {
		this.rootid = rootid;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	
}
