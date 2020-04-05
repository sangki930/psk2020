package psk.Codingtest;

import java.util.Random;
import java.util.Scanner;

/*���Ͽ� �Ŵϴ� ������ ������ �ϳ� �������.
����, ���ΰ� ���� N,M�� ���簢�� �����Ϳ���  �� ���� ������
����� �ٸ� �� ���� ������ ã�� �����̴�. �� ��ġ�� (���� ��ǥ, ���� ��ǥ)��
ǥ���� �� �ִ�.

���ϰ� ������ ��, ���� ������ (0,0) ���� ���� ���� �ִ� ���� �Ŵϴ� �ƹ� ĭ�� ����
������ �����. �Ŵϴ� ������ �� �� ����� �ٽô� ������ �ű��� �ʴ´�. �� �� �Ŵϴ�
������ �ۿ��� ������ ���� �� �ִ� ��, ������ �ۿ� ������ ����ٸ� ���ϴ� ���� ã�⸦
�����Ѵ�. �Ŵϰ�(0,0)�� ������ ����ٸ� ������ ������ �� ����.

���ϴ� ���� �߰� ���� ã�⸦ �����Ѵ�. ���ϰ� ��,��,��,�� �� ĭ�� �����̴� �� 1�ʰ� �ɸ���.
���ϴ� �׻� �������� �� ���� ��(0,0)���� ����Ѵ�.
���ϰ� ������ ã�� �� �ִ� �ִ� �ð��� �ִ� �ð����� ã�� �� �ִ� ����� ���� ���ϴ�
���α׷��� ����ÿ�

�Է�
ù ��° �ٿ��� ����ã�� ������ �� ������ ������ ���� N�� ���� M���� �������� �����Ͽ�
�־� ����.
�� ��° �ٿ��� �Ŵϰ� ������ ���� ����, ���� ��ǥ (a,b)�� �������� �����Ͽ� �־�����.
(1<=N,M<=25 ,0<=a,b<=30)

���
���ϰ� ������ ã�� �� ���� ��, ù ��° �ٿ��� ���ϰ� ������ ã�� �ִܽð�,
�� ��° �ٿ��� �� ����� ���� ������ ����Ѵ�.*/

public class Problem5 {
	public static void main(String[] args) {
			
		Scanner sc = new Scanner(System.in);
		System.out.println("N�Է�");
		int n = sc.nextInt();
		System.out.println("M�Է�");
		int m = sc.nextInt();
		
		System.out.println("�Ŵϰ� ���� ���� ��ǥ");
		int a =sc.nextInt();
		System.out.println("�Ŵϰ� ���� ���� ��ǥ");
		int b=sc.nextInt();
		
		int answerTime=a+b;
		int answerCase=factorial(a+b)/(factorial(a)*factorial(b));
		
		if(n>25 || m>25) {
			System.out.println("fail");
			System.exit(0);
		}else if(a>30||b>30){
			System.out.println("fail");
			System.exit(0);
		}
		
		
		if(n<a || m<b) {
			System.out.println("fail");
			System.exit(0);
		}else if(n==0&&m==0) {
			System.out.println("fail");
			System.exit(0);
			
		}
		
		System.out.println("�ִ� �ð� :" + answerTime);
		System.out.println("�� ����� �� : "+answerCase);
		
		
		sc.close();
	}
	
	public static int factorial(int n) {
		int result=1;
		
		for(int i=1;i<=n;i++) {
			result = result *i;
		}
		
		return result;
	}
}
