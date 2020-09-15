package lecture07;

import java.awt.image.BufferedImage;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.imageio.*;
/** �� ���� Ŭ������ �ݵ�� JSP�� �Բ� �׽�Ʈ�ؾ� �Ѵ�.
 *  ���⼭�� �����ͺ��̽��� ����� BLOB�÷��� �̹����� �����ͼ� �������� ����ϰ� �ִ�.
 * �� Ŭ������  JSP������ ����� ��, <img src="�� ������ ���">�� ���� �� �ָ� �ȴ�*/
public class DB_Image_Servlet extends HttpServlet {
      
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  response.setContentType("image/png");
  Connection conn = null;
   PreparedStatement pstmt = null;
  
   try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
    /*create table mytable (bfile BLOB, cfile CLOB) ���� ���̺��� ������ �Ŀ�....
    * ���̳ʸ� ������ �÷��� ���̳ʸ� �����͸� �����Ѵ�.
    */
    pstmt = conn.prepareStatement("insert into mytable (bfile) values(?)");
    // ������ �̹��� ��θ� ���� ���Ͻý��ۻ��� ��η� ��ȯ�Ѵ�.
    String path = getServletContext().getRealPath("/images/google_logo.png");
    // byte�迭�� ��ȯ�ؾ߸� blob���� �÷��� ������ �� �ִ�.
    ByteArrayOutputStream bout = new ByteArrayOutputStream();
    FileInputStream fin = new FileInputStream(path);

    byte[] buf = new byte[1024];
    int read = 0;
    while((read=fin.read(buf,0,buf.length))!=-1){
     bout.write(buf,0,read);
    }
    fin.close();
    // byte�迭�� �ϼ��Ǿ���
    byte[] imageData = bout.toByteArray();

    // byte�迭�� DB�� �����Ѵ�
    pstmt.setBytes(1, imageData);
    pstmt.executeUpdate();
    pstmt.close();
    // �̹����� DB�� �����ϴ� �� ��.......................................................//

    // DB�� ����� �̹����� �����ͼ� ���������� ����ϴ� ��
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM mytable");
   if (rs.next()) {
     // ���̳ʸ� �����͸� �����ϰ� �ִ� �÷����κ��� �����͸� �����´�
   InputStream in = rs.getBinaryStream("bfile");
   // BufferedImage�� �����ϸ� ImageIO�� ���� �������� ����ϱⰡ ����.
   BufferedImage bimg = ImageIO.read(in);
   in.close();

   ServletOutputStream sos = response.getOutputStream();

   ImageIO.write(bimg, "png", sos);
   }
    rs.close();
    stmt.close();
    conn.close();

   }
   catch(Exception e) {
    System.err.println(e);
   }
 }
}