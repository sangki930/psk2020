package lecture07;

import java.sql.*;
import javax.sql.*;


public class createDB{

	public static void main(String[] args) throws ClassNotFoundException, SQLException {//���ڵ� ����
		// TODO Auto-generated method stub
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
		//DB�� ����
		Statement stmt = conn.createStatement();
		
		
		
		/*stmt.execute( "create table gongji("+//freewifi�̶�� table ����
				"id int not null primary key auto_increment,"+ //��ġ��Ҹ�
				"title varchar(70),"+//��ġ��һ�
				"date date,"+ //��ġ�õ���
				"content text"+ //��ġ�ñ�����
				") DEFAULT CHARSET=utf8;");//utf-8�μ��������� �� �ѱ� ��� 
		*/
		
		
		 stmt.execute("create table clobtest(CTEST1 VARCHAR(10),CTEST2 VARCHAR(10),C BLOB,REG_DT DATE,B BLOB);");
		 
		/*
		 stmt.execute("create table stock("+
		 "itemid int not null primary key auto_increment,"//��ǰ��ȣ
		 +"itemname varchar(50),"//�����۸�
		 +"stocknum int,"//����
		 +"stockdate date," //��� �ľ���
		 +"enrolldate date,"
		 +"descitem varchar(100),"+"img MEDIUMBLOB) DEFAULT CHARSET=utf8;");//��� �����
		  */
		//MEDIUMBLOB : �̹����� 16mb���� ������ �� ����
		System.out.println("���̺� ���� ����");
	
		
		stmt.close();
		conn.close();
	}

}