package joa.Repo;

import java.io.*;
import java.sql.*;

public class CFTB {
	
	
	public static Blob convertFileToBlob(File f) throws Exception {//메소드 선언
		  
	    Blob blob = null;
	    FileInputStream inputStream = null;
	  
	    try {
	        byte[] byteArray = new byte[(int) f.length()];//파일의 배열 길이 만큼 byte 배열을 선언
	        inputStream = new FileInputStream(f); //inputStream 선언
	        inputStream.read(byteArray);//바이트배열을 읽음
	   
	        blob = new javax.sql.rowset.serial.SerialBlob(byteArray);
	        //byte 배열은 BLOB으로 변환
	   
	    } catch (Exception e) {
	        throw e;
	   
	    } finally {
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
