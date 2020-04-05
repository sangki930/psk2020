package psk.Codingtest;

import java.util.Arrays;
import java.util.Scanner;

/*
 * 유니에게 7살의 귀여운 조카가 있다. 유니는 조카를 3시간만 돌봐달라는
 * 부탁을 받았다. 어린이와의 놀이에 익숙하지 않은 유니는 어떻게 조카와
 * 놀어줄지 고민하게 되었다. 유니에게 좋은 아이디어가 떠올랐는 데,
 * 바로 숫자 카드놀이를 하는 것이다.
 * 
 * 유니에게는 0~9까지의 숫자카드가 있다. 유니는 숫자카드 중 3장을 골라
 * 조카에게 주면 조카는 만들 수 있는 가장 큰 수 까지 만들어 나간다. 이 때
 * 유니는 K번째 수가 만들어 졌을 때, STOP을 외친다.
 * 수의 맨 앞자리가 0으로 시작 할 수 있다.
 * STOP을 외쳤을 때의 수를 출력하는 프로그램을 만드시오.
 */

/*
 * 입력
 * 첫 번째 줄에 유니가 고른 3장의 서로 다른 숫자카드가 공백으로 구분된 정수로 주어진다
 * 두 번째 줄에 STOP을 외칠 K가 주어진다.
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
			System.out.println(i + "번째 카드 입력");
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

		System.out.println("STOP할 숫자");
		int stop = sc.nextInt();

		System.out.println("결과");
		System.out.println("값 : "+nums[stop-1]);

	}
}
