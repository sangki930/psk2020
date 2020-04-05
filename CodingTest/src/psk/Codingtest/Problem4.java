package psk.Codingtest;

import java.util.Arrays;
import java.util.Scanner;

/*
 *알고리즘잡스 강남 센터에서는 개별적인 학습환경을 위해 책상을 일렬로 배치하였다.
조용한 학습한경을 추구하는 코치는 수강생이 올 때마다 다른 학생과 가장 멀리 떨어진 자리에
앉도록 배정해 주었다. 반복되는 학생들의 자리 배정에 효율적인 방법을 찾던 코치는 자동으로 자리를
배정해 주는 프로그램을 만들고자 한다.
우선 자리를 배정했을 때 다른 학생과의 거리를 계산하는 프로그램을 구현 중에 있다. 책상의 개수와
현재 앉아 있는 수강생의 정보가 주어질 때, 새로 온 학생이 다른 학생들로부터 가장 멀리 앉는 경우에서
가장 가까운 학생과의 거리를 출력하는 프로그램을 만드시오
 * 
 */

/*
 * (입력)
 * 첫 번째 줄에는 책상의 개수 N이 주어진다.
 * 두 번째 줄에는 각 책상에 대한 정보가 공백으로 구분되어 주어진다.
 * 책상에 대한 정보는 0과 1로만 이루어져 있다. 1은 그 책생에
 * 학생이 앉아 있는 것을 뜻하고 0은 해당 책상이 비어 있는 것을 뜻한다.
 * 최소한 한 개의 빈자리와 한 명의 학생은 존재한다.
 */

/*
 * 새로 온 학생이 다른 학생과 가장 멀리 떨어져 앉았을 때, 가장
 * 가까운 학생과의 거리를 정수로 출력한다. 다른 학생과의
 * 거리는 |앉은자리-다른하생의 자리|로 계산한다.
 */
public class Problem4 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int seat[]=new int[20000];
		int arr[] = seat;
		int max=0;
		int n,cnt=1;
		
		System.out.println("좌석 수 입력");
		
		n=sc.nextInt();
		for(int i=0;i<n;i++) {
			seat[i]=sc.nextInt();
			
		}
		
		//양쪽에 사람이 있는 경우
		// 1 0 1 0 0 0 1
		// 1 0 1 0 0 0 0 1
		int index;
		for(index=0;index<n;index++) {
			if(seat[index]==1) {
				break;
			}
		}
		for(index=index+1;index<n;index++) {
			if(seat[index]==0) {
				cnt++;
			}
			else {
				int temp=(cnt%2==1)?cnt/2+1:cnt/2;
				if(max<temp)max=temp;
				cnt=0;
			}
		}
		
		//2. 왼쪽에 사람이 없는 경우
		cnt=0;
		for(index=0;index<n;index++) {
			if(seat[index]>0) {
				cnt++;
			}
			else {
				break;
			}
		}
		if(max<cnt)max=cnt;
		//3.오른쪽에 사람이 없는 경우
		cnt=0;
		for(index=n-1;index>=0;index--) {
			if(seat[index]>0) {
				cnt++;
			}
			else {
				break;
			}
		}
		if(max<cnt)max=cnt;
		
		System.out.println("구하고자 하는 max값 : "+max);
		
		

//			Scanner sc= new Scanner(System.in);
//			System.out.println("책상 수 입력");
//			int n= sc.nextInt();
//			
//			int seat[]= new int[n];
//			for(int i=0;i<n;i++) {
//				System.out.println("좌석정보 "+i+"번째");
//				seat[i]=sc.nextInt();
//			}
//			
//			int indexCnt=0;
//			
//			int k;
//			int owned[]=new int[n];
//			int j=1;
//			
//			for(int i=0;i<n;i++) {
//				if(seat[i]==1) {
//					j++;
//					owned[j]=(i+1);
//				}
//			}
//			
//			System.out.println(Arrays.toString(owned));
//			
//			int min=n;
//			
//			for(int i=0;i<owned.length;i++) {
//				for(int m=i;m<owned.length;m++) {
//					if(owned[i]>0 && owned[m]>0) {
//					int diff=Math.abs(owned[i]-owned[m]);
//					
//					if(diff>0) {
//						
//						System.out.println("diff 값 : "+diff);
//						
//						if(min>diff) {
//							min = diff;
//							}
//						}
//						
//					}
//					
//					System.out.println("min 값 :"+min);
//				}
//			}
//			System.out.println("최소거리 :"+min);
			
	}

}
