package lecture07;

import java.io.*;
import java.sql.*;

public class CFTB {
	
	
	public static Blob convertFileToBlob(File f) throws Exception {//예외처리
		  
	    Blob blob = null;
	    FileInputStream inputStream = null;
	  
	    try {
	        byte[] byteArray = new byte[(int) f.length()];//바이트 배열로 선언
	        inputStream = new FileInputStream(f); //inputStream 객체로 파일을 읽어들임
	        inputStream.read(byteArray);//바이트 배열로 읽음
	   
	        blob = new javax.sql.rowset.serial.SerialBlob(byteArray);
	        //byte 배열을 blob으로 변환함
	   
	    } catch (Exception e) {
	        throw e;
	   
	    } finally {//각종 예외처리
	        try {
	            if (inputStream != null) {
	                inputStream.close();
	            }


	        } catch (Exception e) {

	            inputStream = null;


	        } finally {
	            inputStream = null;
	        }
	    }
	  
	    return blob;
	}
}
