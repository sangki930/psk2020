package psk.Codingtest;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/*
 * 알고리즘랩스는 임직원의 수평적인 조직 문화와 화려한 근무복지 시설을 자랑한다.
 * 2020년을 맞아 직원 전용 풀장을 건설할지 
 * 직원 전용 펜션을 건설할지 결정해야하는 문제가 생겼다.
 * 결정은 투표로 진행되고 있는 데, 공정한 선정을 위해 모든 임직원이
 * 투표에 참여하기로 하였다.
 * 직원들의 투표 가능 시간을 조사하였더니 투표 가능 시간이 겹치는 경우가
 * 많았다. 직원들의 소중한 시간을 보호해 주기 위해 대기시간을 없애 고자하였고,
 * 그에 따라 알고리즘랩스에 투표 부스로 적절하게 설치해 직원들이 대기하는 시간이
 * 없도록 만들고자 한다. 투표에 참석하는 직원 수와 각 직원의 투표 가능 시간이 주어
 * 질 때, 설치해야하는 최소 부스의 총 개수를 구하시오
 * 
 */
/*
 * 입력 : 첫 번째 줄에는 직원의수 N이 주어진다.
 * 두 번째 줄부터 N개의 줄만큼 각 직원이 투표 부스에 입장하는 시간 S와
 * 투표 부스에서 빠져나올 시간 E가 주어진다. 투표 부스가 비는 순간
 * 다음 직원이 들어갈 수 있다.
 * (1<=N<=1000,0<=S<E<=150)
 */

/*
 * 모든 직원이 대기시간없이 투표하는 데 필요한 부스의 최소 개수(정수)
 */
public class Problem3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("직원 수 입력");
		int n=sc.nextInt();
		
		int arr[][]=new int[n][2];
		int boothCnt=1;
		
		List<Integer>[] listSet=new ArrayList[n];
		
		for(int i=0;i<n;i++) {
		
			System.out.println("s 입력");
			arr[i][0]=sc.nextInt();
			System.out.println("e 입력");
			arr[i][1]=sc.nextInt();
			
			List<Integer> list1 = new ArrayList<>();
			List<Integer> list2 = new ArrayList<>();
			
			listSet[i] = createSet(arr[i][0],arr[i][1]);
		}
		
		for(int i=0;i<n;i++) {
			for(int j=i;j<n;j++) {
//				if(intersection(listSet[i],listSet[j])!=null) {
//					boothCnt++;
//				}else if(!intersection(listSet[i],listSet[j]).equals(listSet[i])){
//					boothCnt++;
//				}
				System.out.println("집합 "+listSet[i]);
				System.out.println("집합 "+listSet[j]);
				System.out.println("연산결과");
				System.out.println(intersection(listSet[i],listSet[j]));
				if(intersection(listSet[i],listSet[j]).isEmpty() 
						|| intersection(listSet[i],listSet[j]).equals(listSet[i])
						|| intersection(listSet[i],listSet[j]).equals(listSet[j])
						|| intersection(listSet[i],listSet[j]).size()==1) {
					
					System.out.println("컨티뉴");
					continue;
				}
				boothCnt++;
			}
		}
		
		System.out.println("최소 부스의 개수 : "+boothCnt);
		sc.close();
	}
	
	private static List<Integer> intersection(List<Integer> list1,List<Integer> list2){
		List<Integer> list = new ArrayList<>();

        for (Integer t : list1) {
            if (list2.contains(t)) {
                list.add(t);
            }
        }
 
        return list;
	}
	
	private static List<Integer> createSet(int s,int e){
		List<Integer> list = new ArrayList<>();
		
		for(int i=s;i<=e;i++) {
			list.add(i);
		}
		
		return list;
	}
}
