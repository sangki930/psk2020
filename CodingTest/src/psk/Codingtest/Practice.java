package psk.Codingtest;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class Practice {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			
		Map<String,Integer[]> setMap = new HashMap<>();
		
		Integer[] i = {1,2,3};
		setMap.put("11",i);
		
		System.out.println(Arrays.toString(setMap.get("11")));
		
	}

}
