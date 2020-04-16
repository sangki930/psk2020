package psk.Practice;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class Practice02 {
		public static void main(String[] args) {
			
			String[] arr = {"1233","12456","12789"};
			
			String s = "123456";
			System.out.println(s.indexOf("1234567"));
			boolean answer = true;
			
			for(int i=0;i<arr.length;i++) {
				for(int j=0;j<arr.length;j++) {
					if(i==j) continue;

					if(!(compareStr(arr[i],arr[j]))) {
						answer=false;
						break;
					}
				}
			}
			
			System.out.println(answer);
			
			Map<String,Integer> m = new HashMap<String,Integer>();
			
			int[][] i = {{1,2},{2,3,4}};
			System.out.println("배열길이 :"+i.length);
			
			int[] a = {4,7,2,8,1};
			Arrays.sort(a);
			System.out.println(Arrays.toString(a));
			
		}
		
		public static boolean compareStr(String s1,String s2) {
			char[] c1 = s1.toCharArray();
			char[] c2 = s2.toCharArray();
			int cnt=0;
			
			if(s1.length()>=s2.length()) {
				for(int i=0;i<s2.length();i++) {
					if((c1[i]==c2[i])) {
						cnt++;
					}
				}
			}else {
				for(int i=0;i<s1.length();i++) {
					if((c1[i]==c2[i])) {
						cnt++;
					}
				}
			}
			
			if((cnt==s1.length()) || (cnt==s2.length())){
				return false;
			}
			
			return true;
		}
		
}
