package joa.Domain;


import java.util.Date;
import java.sql.*;

public class gongji {//�������� Repo(DAO)
		private int id;//�۹�ȣ
		private String title;//����
		private Date date;//��¥
		private String content;//��
		private int rootid;//���� ��ȣ
		private int relevel;//�� ����
		private int recnt;// �� ����
		private int viewcnt;// ��ȸ��
		private String filename;//���ϸ�
		
		
		public gongji() {
			
		}
		
		public gongji(int id, String title, Date date, String text, int rootid, int relevel, int recnt,
				int viewcnt, String filename) {
			super();
			this.id = id;
			this.title = title;
			this.date = date;
			this.content = text;
			this.rootid = rootid;
			this.relevel = relevel;
			this.recnt = recnt;
			this.viewcnt = viewcnt;
			this.filename = filename;
		}
		public String getFilename() {
			return filename;
		}

		public void setFilename(String filename) {
			this.filename = filename;
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

		public void setContent(String text) {
			this.content = text;
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

		public void setRealfile(Blob blob) {
			// TODO Auto-generated method stub
			
		}
		
		
}
