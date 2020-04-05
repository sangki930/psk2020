package psk.Codingtest;

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
public class Problem3_1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n,s,e;
		int arr[]=new int[150];//쓰는 시간값 배열
		int max=0;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("직원 수 입력");
		n=sc.nextInt();
		for(int i=0;i<n;i++) {
			System.out.println("s 입력");
			s=sc.nextInt();
			System.out.println("e 입력");
			e=sc.nextInt();
			for(int j=s;j<e;j++) {
				arr[j]++;
				if(max<arr[j])max=arr[j];
			}
		}

		System.out.println("결과 :"+max);
	}

}
