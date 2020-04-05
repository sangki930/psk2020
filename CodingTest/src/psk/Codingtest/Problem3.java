package psk.Codingtest;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/*
 * �˰��򷦽��� �������� �������� ���� ��ȭ�� ȭ���� �ٹ����� �ü��� �ڶ��Ѵ�.
 * 2020���� �¾� ���� ���� Ǯ���� �Ǽ����� 
 * ���� ���� ����� �Ǽ����� �����ؾ��ϴ� ������ �����.
 * ������ ��ǥ�� ����ǰ� �ִ� ��, ������ ������ ���� ��� ��������
 * ��ǥ�� �����ϱ�� �Ͽ���.
 * �������� ��ǥ ���� �ð��� �����Ͽ����� ��ǥ ���� �ð��� ��ġ�� ��찡
 * ���Ҵ�. �������� ������ �ð��� ��ȣ�� �ֱ� ���� ���ð��� ���� �����Ͽ���,
 * �׿� ���� �˰��򷦽��� ��ǥ �ν��� �����ϰ� ��ġ�� �������� ����ϴ� �ð���
 * ������ ������� �Ѵ�. ��ǥ�� �����ϴ� ���� ���� �� ������ ��ǥ ���� �ð��� �־�
 * �� ��, ��ġ�ؾ��ϴ� �ּ� �ν��� �� ������ ���Ͻÿ�
 * 
 */
/*
 * �Է� : ù ��° �ٿ��� �����Ǽ� N�� �־�����.
 * �� ��° �ٺ��� N���� �ٸ�ŭ �� ������ ��ǥ �ν��� �����ϴ� �ð� S��
 * ��ǥ �ν����� �������� �ð� E�� �־�����. ��ǥ �ν��� ��� ����
 * ���� ������ �� �� �ִ�.
 * (1<=N<=1000,0<=S<E<=150)
 */

/*
 * ��� ������ ���ð����� ��ǥ�ϴ� �� �ʿ��� �ν��� �ּ� ����(����)
 */
public class Problem3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("���� �� �Է�");
		int n=sc.nextInt();
		
		int arr[][]=new int[n][2];
		int boothCnt=1;
		
		List<Integer>[] listSet=new ArrayList[n];
		
		for(int i=0;i<n;i++) {
		
			System.out.println("s �Է�");
			arr[i][0]=sc.nextInt();
			System.out.println("e �Է�");
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
				System.out.println("���� "+listSet[i]);
				System.out.println("���� "+listSet[j]);
				System.out.println("������");
				System.out.println(intersection(listSet[i],listSet[j]));
				if(intersection(listSet[i],listSet[j]).isEmpty() 
						|| intersection(listSet[i],listSet[j]).equals(listSet[i])
						|| intersection(listSet[i],listSet[j]).equals(listSet[j])
						|| intersection(listSet[i],listSet[j]).size()==1) {
					
					System.out.println("��Ƽ��");
					continue;
				}
				boothCnt++;
			}
		}
		
		System.out.println("�ּ� �ν��� ���� : "+boothCnt);
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
