package psk.Codingtest;

import java.util.Arrays;
import java.util.Scanner;

/*
 *�˰����⽺ ���� ���Ϳ����� �������� �н�ȯ���� ���� å���� �Ϸķ� ��ġ�Ͽ���.
������ �н��Ѱ��� �߱��ϴ� ��ġ�� �������� �� ������ �ٸ� �л��� ���� �ָ� ������ �ڸ���
�ɵ��� ������ �־���. �ݺ��Ǵ� �л����� �ڸ� ������ ȿ������ ����� ã�� ��ġ�� �ڵ����� �ڸ���
������ �ִ� ���α׷��� ������� �Ѵ�.
�켱 �ڸ��� �������� �� �ٸ� �л����� �Ÿ��� ����ϴ� ���α׷��� ���� �߿� �ִ�. å���� ������
���� �ɾ� �ִ� �������� ������ �־��� ��, ���� �� �л��� �ٸ� �л���κ��� ���� �ָ� �ɴ� ��쿡��
���� ����� �л����� �Ÿ��� ����ϴ� ���α׷��� ����ÿ�
 * 
 */

/*
 * (�Է�)
 * ù ��° �ٿ��� å���� ���� N�� �־�����.
 * �� ��° �ٿ��� �� å�� ���� ������ �������� ���еǾ� �־�����.
 * å�� ���� ������ 0�� 1�θ� �̷���� �ִ�. 1�� �� å����
 * �л��� �ɾ� �ִ� ���� ���ϰ� 0�� �ش� å���� ��� �ִ� ���� ���Ѵ�.
 * �ּ��� �� ���� ���ڸ��� �� ���� �л��� �����Ѵ�.
 */

/*
 * ���� �� �л��� �ٸ� �л��� ���� �ָ� ������ �ɾ��� ��, ����
 * ����� �л����� �Ÿ��� ������ ����Ѵ�. �ٸ� �л�����
 * �Ÿ��� |�����ڸ�-�ٸ��ϻ��� �ڸ�|�� ����Ѵ�.
 */
public class Problem4 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int seat[]=new int[20000];
		int arr[] = seat;
		int max=0;
		int n,cnt=1;
		
		System.out.println("�¼� �� �Է�");
		
		n=sc.nextInt();
		for(int i=0;i<n;i++) {
			seat[i]=sc.nextInt();
			
		}
		
		//���ʿ� ����� �ִ� ���
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
		
		//2. ���ʿ� ����� ���� ���
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
		//3.�����ʿ� ����� ���� ���
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
		
		System.out.println("���ϰ��� �ϴ� max�� : "+max);
		
		

//			Scanner sc= new Scanner(System.in);
//			System.out.println("å�� �� �Է�");
//			int n= sc.nextInt();
//			
//			int seat[]= new int[n];
//			for(int i=0;i<n;i++) {
//				System.out.println("�¼����� "+i+"��°");
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
//						System.out.println("diff �� : "+diff);
//						
//						if(min>diff) {
//							min = diff;
//							}
//						}
//						
//					}
//					
//					System.out.println("min �� :"+min);
//				}
//			}
//			System.out.println("�ּҰŸ� :"+min);
			
	}

}
