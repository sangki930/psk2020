import java.util.regex.*;

public class PMTest {

	private static Pattern p = null;
	private static Matcher m = null;
	private static final String ONLY_NUM_PATTERN = "^[0-9]+$";//숫자만 나오는 정규식
    private static final String FILE_PATTERN = "^\\S+.(?i)(txt|pdf|hwp|xls)$";
    //파일 확장자 정규식
    
    public static boolean numCheck(String str) { //숫자만 이루져 있는지
    	
    	p = Pattern.compile(ONLY_NUM_PATTERN);//얻은 정규표현식(숫자만)으로부터 패턴을 만든다.
    	m = p.matcher(str);//만든 패턴에 맞춰 matcher 객체를 생성
    	
    	return m.find();//대입한 문자열에서 특정 패턴을 찾는다.
    }
	
    public static boolean fileCheck(String str) {
    	p = Pattern.compile(FILE_PATTERN);//얻은 정규표현식(파일)으로부터 패턴을 만든다.
    	m = p.matcher(str);//만든 패턴에 맞춰 matcher 객체를 생성
    	
    	return m.find();//대입한 문자열에서 특정 패턴을 찾는다.
    }
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(numCheck("123123123"));      //true
        System.out.println(numCheck("1231--23123"));    //false(--가 있으므로)     
        System.out.println(numCheck("a23123"));         //false(a가 있으므로)
        
        System.out.println(fileCheck("a23123"));        //false
        System.out.println(fileCheck("kopo09.txt"));      //true
        System.out.println(fileCheck("kopo09.pdf"));      //true
        System.out.println(fileCheck("kopo09.xls"));      //true
        System.out.println(fileCheck("kopo09.jpeg"));     //false


	    
	}

}
