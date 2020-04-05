package psk.Codingtest;

import java.util.Random;
import java.util.Scanner;

/*유니와 거니는 간단한 게임을 하나 만들었다.
세로, 가로가 각각 N,M인 직사각형 놀이터에서  한 명은 보물을
숨기고 다른 한 명은 보물을 찾는 게임이다. 각 위치는 (세로 좌표, 가로 좌표)로
표현할 수 있다.

유니가 술래일 때, 시작 지점인 (0,0) 에서 눈을 감고 있는 사이 거니는 아무 칸에 가서
보물을 숨긴다. 거니는 보물을 한 번 숨기면 다시는 보물을 옮기지 않는다. 이 때 거니는
놀이터 밖에도 보물을 숨길 수 있는 데, 놀이터 밖에 보물을 숨긴다면 유니는 보물 찾기를
포기한다. 거니가(0,0)에 보물을 숨긴다면 게임을 시작할 수 없다.

유니는 눈을 뜨고 보물 찾기를 시작한다. 유니가 상,하,좌,우 한 칸을 움직이는 데 1초가 걸린다.
유니는 항상 놀이터의 맨 왼쪽 위(0,0)부터 출발한다.
유니가 보물을 찾을 수 있는 최단 시간과 최단 시간으로 찾을 수 있는 경우의 수를 구하는
프로그램을 만드시오

입력
첫 번째 줄에는 보물찾기 게임을 할 놀이터 공간이 세로 N과 가로 M으로 공백으로 구분하여
주어 진다.
두 번째 줄에는 거니가 물건을 숨긴 세로, 가로 좌표 (a,b)가 공백으로 구분하여 주어진다.
(1<=N,M<=25 ,0<=a,b<=30)

출력
유니가 보물을 찾을 수 있을 때, 첫 번째 줄에는 유니가 보물을 찾는 최단시간,
두 번째 줄에는 그 경우의 수를 정수로 출력한다.*/

public class Problem5 {
	public static void main(String[] args) {
			
		Scanner sc = new Scanner(System.in);
		System.out.println("N입력");
		int n = sc.nextInt();
		System.out.println("M입력");
		int m = sc.nextInt();
		
		System.out.println("거니가 숨긴 세로 좌표");
		int a =sc.nextInt();
		System.out.println("거니가 숨긴 가로 좌표");
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
		
		System.out.println("최단 시간 :" + answerTime);
		System.out.println("그 경우의 수 : "+answerCase);
		
		
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
