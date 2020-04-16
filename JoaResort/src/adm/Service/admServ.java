package adm.Service;

import adm.domain.adminRIO;

public class admServ {
	
	
	
	
	public admServ() {
		
		
	}
	
	public boolean idcheck(String id, String password) {//id와 password을 직접 받음
		
		adminRIO a = new adminRIO(id,password);
		if(a.getId().equals(id) && a.getPassword().equals(password)) {
			
			return true;
		}else {
			return false;
		}
		
	}
	
	public boolean idcheck(adminRIO a) {//adminRIO를 받음
		
		
		if(a.getId().equals("") && a.getPassword().equals("")) {
			
			return true;
		}else {
			return false;
		}
		
	}
	
	
	

}
