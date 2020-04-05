package psk.Codingtest;

import java.util.Arrays;
import java.util.Scanner;

/*
 * ���Ͽ��� 7���� �Ϳ��� ��ī�� �ִ�. ���ϴ� ��ī�� 3�ð��� �����޶��
 * ��Ź�� �޾Ҵ�. ��̿��� ���̿� �ͼ����� ���� ���ϴ� ��� ��ī��
 * ������� ����ϰ� �Ǿ���. ���Ͽ��� ���� ���̵� ���ö��� ��,
 * �ٷ� ���� ī����̸� �ϴ� ���̴�.
 * 
 * ���Ͽ��Դ� 0~9������ ����ī�尡 �ִ�. ���ϴ� ����ī�� �� 3���� ���
 * ��ī���� �ָ� ��ī�� ���� �� �ִ� ���� ū �� ���� ����� ������. �� ��
 * ���ϴ� K��° ���� ����� ���� ��, STOP�� ��ģ��.
 * ���� �� ���ڸ��� 0���� ���� �� �� �ִ�.
 * STOP�� ������ ���� ���� ����ϴ� ���α׷��� ����ÿ�.
 */

/*
 * �Է�
 * ù ��° �ٿ� ���ϰ� �� 3���� ���� �ٸ� ����ī�尡 �������� ���е� ������ �־�����
 * �� ��° �ٿ� STOP�� ��ĥ K�� �־�����.
 * (1<=K<=6)
 */
public class Problem2 {

	public static void main(String[] args) {

		int[] numberCard = new int[10];
		for (int i = 0; i < numberCard.length; i++) {
			numberCard[i] = i;
		}

		String[] selectCard = new String[3];
		Scanner sc = new Scanner(System.in);

		for (int i = 0; i < 3; i++) {
			System.out.println(i + "��° ī�� �Է�");
			selectCard[i] = Integer.toString(sc.nextInt());
		}

		String[] nums = new String[6];

		nums[0] = selectCard[0] + selectCard[1] + selectCard[2];
		nums[1] = selectCard[0] + selectCard[2] + selectCard[1];
		nums[2] = selectCard[1] + selectCard[0] + selectCard[2];
		nums[3] = selectCard[1] + selectCard[2] + selectCard[0];
		nums[4] = selectCard[2] + selectCard[0] + selectCard[1];
		nums[5] = selectCard[2] + selectCard[1] + selectCard[0];

		Arrays.sort(nums);

		System.out.println("STOP�� ����");
		int stop = sc.nextInt();

		System.out.println("���");
		System.out.println("�� : "+nums[stop-1]);

	}
}
