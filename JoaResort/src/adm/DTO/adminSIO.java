package adm.DTO;


public class adminSIO {
	
	private String id; //id선언
	private String password; //비밀번호 선언
	
	
	public adminSIO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


}