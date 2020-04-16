import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class TimeTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		LocalDateTime start = LocalDateTime.now();
		
		for(int i=0;i<50000000;i++) {
			System.out.println(i);
		}
		
		LocalDateTime end = LocalDateTime.now();
		
//		System.out.println(ChronoUnit.YEARS.between(today, targetDate1);
		Duration d = Duration.between(start,end);
		//System.out.println(LocalDateTime.until(start,end));
		System.out.println(d);
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("hh시간 mm분 ss초");
		long minutes = ChronoUnit.MINUTES.between(start, end);
		long seconds = ChronoUnit.SECONDS.between(start, end);
		long mseconds = ChronoUnit.MILLIS.between(start, end);
		System.out.println("분" + minutes);
		System.out.println("초" + seconds);
		System.out.println(mseconds);
		System.out.println("분" + d.toMinutes());
		System.out.println("초" + d.toSeconds());
		
		
		
	}

}
