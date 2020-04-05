package psk.Codingtest;

import java.util.Scanner;

/*
 * 놀이공원에 손님이 많지 않은 탓에 날마다 문을 여는 매표소의 개수는 다르다.
 * 1개의 매표소에서 손님 1명을 입장 시키는데, 1분이 걸린다.
 * 경비원 토니는 입구에서 손님들이 올 때마다, 최대한 빠르게 입장할 수 
 * 있도록, 줄을 적게 서있는 매표소로 안내하고 있다. 단체손님은 같은 매표소
 * 로 안내해주며, 단체손님 또한 1인당 1분의 입장시간이 소요된다.
 * 토니가 줄을 배정하는데에는 시간이 소요되지 않는다고 가정한다.
 * 손님 그룹의 개수, 문을 연 매표소의 수, 각 그룹손님이 인원이 주어질 때
 * 가장 빠르게 입장시키는 방법의 소요시간을 출력하는 프로그램을 만드시오.
 */

/*
 * 입력
 * 첫 번째 줄에 손님 그룹의 개수 N과 문을 연 매표소K가 정수로 주어잔다
 * 두 번째 줄부터 N줄만큼 각 그룹의 손님수가 정수로 주어진다.
 * 그들은 입력된 순서대로 매표소에 줄을 선다.
 * (1<=N<=1000,1<=K=10, 1<=각 그룹의 손님수<=100)
 */

/*
 * 출력 : 입장에 소요되는 최소 시간(분)
 */

public class Problem1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n,k,cnt;
		System.out.println("그룹 수 입력");
		n=sc.nextInt();
//		int[] group = new int[n];
		System.out.println("문을 연 매표소 수");
		k=sc.nextInt();
		int[] ticketOffice = new int[k];
		
		for(int i=0;i<n;i++) {
			System.out.println("그룹 당 인원 수 입력");
			cnt = sc.nextInt();
			if(cnt<0||cnt>100) {
				i--;
				continue;
			}
			ticketOffice[searchMinOffice(ticketOffice)]+=cnt;
		}
		
		System.out.println(searchMaxFromArray(ticketOffice));
		sc.close();
	}
	
	private static int searchMinOffice(int[] array) {
		int min=array[0];
		int Officenum=0;
		
		if(array.length>1) {
		
		for(int i=0;i<array.length;i++) {
			if(min>=array[i]) {
				min = array[i];
				Officenum=i;
				}
			}
		}
		
		return Officenum;
	}
	
	private static int searchMaxFromArray(int[] array) {
		int max = array[0];
		
		for(int i=0;i<array.length;i++) {
			if(max<=array[i]) {
				max = array[i];
				}
			}
		
	return max;
		
	}

}
