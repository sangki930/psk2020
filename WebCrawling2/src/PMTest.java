import java.util.regex.*;

public class PMTest {

	private static Pattern p = null;
	private static Matcher m = null;
	private static final String ONLY_NUM_PATTERN = "^[0-9]+$";//���ڸ� ������ ���Խ�
    private static final String FILE_PATTERN = "^\\S+.(?i)(txt|pdf|hwp|xls)$";
    //���� Ȯ���� ���Խ�
    
    public static boolean numCheck(String str) { //���ڸ� �̷��� �ִ���
    	
    	p = Pattern.compile(ONLY_NUM_PATTERN);//���� ����ǥ����(���ڸ�)���κ��� ������ �����.
    	m = p.matcher(str);//���� ���Ͽ� ���� matcher ��ü�� ����
    	
    	return m.find();//������ ���ڿ����� Ư�� ������ ã�´�.
    }
	
    public static boolean fileCheck(String str) {
    	p = Pattern.compile(FILE_PATTERN);//���� ����ǥ����(����)���κ��� ������ �����.
    	m = p.matcher(str);//���� ���Ͽ� ���� matcher ��ü�� ����
    	
    	return m.find();//������ ���ڿ����� Ư�� ������ ã�´�.
    }
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(numCheck("123123123"));      //true
        System.out.println(numCheck("1231--23123"));    //false(--�� �����Ƿ�)     
        System.out.println(numCheck("a23123"));         //false(a�� �����Ƿ�)
        
        System.out.println(fileCheck("a23123"));        //false
        System.out.println(fileCheck("kopo09.txt"));      //true
        System.out.println(fileCheck("kopo09.pdf"));      //true
        System.out.println(fileCheck("kopo09.xls"));      //true
        System.out.println(fileCheck("kopo09.jpeg"));     //false


	    
	}

}
