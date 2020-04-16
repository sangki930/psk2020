package joa.Resv_Repo;

import java.io.*;
import java.sql.*;

public class CFTB {
	
	
	public static Blob convertFileToBlob(File f) throws Exception {//�޼ҵ� ����
		  
	    Blob blob = null;
	    FileInputStream inputStream = null;
	  
	    try {
	        byte[] byteArray = new byte[(int) f.length()];//������ �迭 ���� ��ŭ byte �迭�� ����
	        inputStream = new FileInputStream(f); //inputStream ����
	        inputStream.read(byteArray);//����Ʈ�迭�� ����
	   
	        blob = new javax.sql.rowset.serial.SerialBlob(byteArray);
	        //byte �迭�� BLOB���� ��ȯ
	   
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
