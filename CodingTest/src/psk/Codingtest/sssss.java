package psk.Codingtest;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Locale;

public class sssss {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char[] a = "12345".toCharArray();
		int[] b = new int[a.length];
		
		int sum=0;
		
		for(int i=0;i<a.length;i++) {
			b[i] = (int)a[i];
			System.out.println(b[i]);
			sum+=a[i];
		}
		System.out.println(sum);
		
		DayOfWeek d = LocalDate.of(2016, 1, 2).getDayOfWeek();
		String an = d.getDisplayName(TextStyle.SHORT, Locale.ENGLISH).toUpperCase();

		System.out.println(an);
		
	}
	
public static int searchPair(String start, String end,String inputString){
        
        StringBuilder input = new StringBuilder(inputString);
        
        int cnt=0;
        
        int i=0;
    	int ok = 1;
        
    	
    	
        while(i<=input.length()) {
        	
        	 if(ok == 1){
        		 
                 i=input.indexOf(start,i);
                     ok=0;
                     System.out.println("이쪽 편 i값: "+i);
                     System.out.println("ok 값 : "+ok);
                     
                     if(i<0) {
                    	 break;
                     }else {
                    	 continue;
                     }
                 }
            if(ok == 0 ){
                     i=input.indexOf(end,i);
                     ok=1;
                     System.out.println("반대편 i값: "+i);
                     System.out.println("ok 값 : "+ok);
                     cnt++;
                     if(i<0) {
                    	 break;
                     }else {
                    	 continue;
                     }
                         
                 }
                 if(i==input.length()-1) {
                 	break;
                 }
        	
        }
        
        return cnt;
    }

}
