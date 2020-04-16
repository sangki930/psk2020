package psk.Codingtest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class SetTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
			
			String[] participant={"leo","eden","kiki","eden"};
			String[] completion={"eden","leo","kiki"};
	        String answer = "";
	        
	        List<String> partlist = new ArrayList<>(Arrays.asList(participant));
	        List<String> complist = new ArrayList<>(Arrays.asList(completion));
	        System.out.println(partlist);
	        
	        Iterator<String> pitr = partlist.iterator();
	        Iterator<String> citr = complist.iterator();
	        
	        while(pitr.hasNext()){
	        		
	        		String s=pitr.next();
	        		if(complist.contains(s))
	        		{
	        			pitr.remove();
	        		
	        			complist.remove(s);
	        		}
	        }
	        
	        System.out.println(partlist);
	    
	}

}
