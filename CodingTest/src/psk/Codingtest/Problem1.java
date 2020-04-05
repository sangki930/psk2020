package psk.Codingtest;

import java.util.Scanner;

/*
 * ���̰����� �մ��� ���� ���� ſ�� ������ ���� ���� ��ǥ���� ������ �ٸ���.
 * 1���� ��ǥ�ҿ��� �մ� 1���� ���� ��Ű�µ�, 1���� �ɸ���.
 * ���� ��ϴ� �Ա����� �մԵ��� �� ������, �ִ��� ������ ������ �� 
 * �ֵ���, ���� ���� ���ִ� ��ǥ�ҷ� �ȳ��ϰ� �ִ�. ��ü�մ��� ���� ��ǥ��
 * �� �ȳ����ָ�, ��ü�մ� ���� 1�δ� 1���� ����ð��� �ҿ�ȴ�.
 * ��ϰ� ���� �����ϴµ����� �ð��� �ҿ���� �ʴ´ٰ� �����Ѵ�.
 * �մ� �׷��� ����, ���� �� ��ǥ���� ��, �� �׷�մ��� �ο��� �־��� ��
 * ���� ������ �����Ű�� ����� �ҿ�ð��� ����ϴ� ���α׷��� ����ÿ�.
 */

/*
 * �Է�
 * ù ��° �ٿ� �մ� �׷��� ���� N�� ���� �� ��ǥ��K�� ������ �־��ܴ�
 * �� ��° �ٺ��� N�ٸ�ŭ �� �׷��� �մԼ��� ������ �־�����.
 * �׵��� �Էµ� ������� ��ǥ�ҿ� ���� ����.
 * (1<=N<=1000,1<=K=10, 1<=�� �׷��� �մԼ�<=100)
 */

/*
 * ��� : ���忡 �ҿ�Ǵ� �ּ� �ð�(��)
 */

public class Problem1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n,k,cnt;
		System.out.println("�׷� �� �Է�");
		n=sc.nextInt();
//		int[] group = new int[n];
		System.out.println("���� �� ��ǥ�� ��");
		k=sc.nextInt();
		int[] ticketOffice = new int[k];
		
		for(int i=0;i<n;i++) {
			System.out.println("�׷� �� �ο� �� �Է�");
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
