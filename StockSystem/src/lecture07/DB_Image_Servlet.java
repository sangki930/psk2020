package lecture07;

import java.awt.image.BufferedImage;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.imageio.*;
/** 이 서블릿 클래스는 반드시 JSP와 함께 테스트해야 한다.
 *  여기서는 데이터베이스에 저장된 BLOB컬럼의 이미지를 가져와서 브라우저에 출력하고 있다.
 * 이 클래스를  JSP측에서 사용할 때, <img src="이 서블릿의 경로">와 같이 해 주면 된다*/
public class DB_Image_Servlet extends HttpServlet {
      
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  response.setContentType("image/png");
  Connection conn = null;
   PreparedStatement pstmt = null;
  
   try{
	   Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
    /*create table mytable (bfile BLOB, cfile CLOB) 으로 테이블을 생성한 후에....
    * 바이너리 데이터 컬럼에 바이너리 데이터를 저장한다.
    */
    pstmt = conn.prepareStatement("insert into mytable (bfile) values(?)");
    // 웹상의 이미지 경로를 실제 파일시스템상의 경로로 변환한다.
    String path = getServletContext().getRealPath("/images/google_logo.png");
    // byte배열로 변환해야만 blob형의 컬럼에 저장할 수 있다.
    ByteArrayOutputStream bout = new ByteArrayOutputStream();
    FileInputStream fin = new FileInputStream(path);

    byte[] buf = new byte[1024];
    int read = 0;
    while((read=fin.read(buf,0,buf.length))!=-1){
     bout.write(buf,0,read);
    }
    fin.close();
    // byte배열이 완성되었다
    byte[] imageData = bout.toByteArray();

    // byte배열을 DB에 저장한다
    pstmt.setBytes(1, imageData);
    pstmt.executeUpdate();
    pstmt.close();
    // 이미지를 DB에 저장하는 예 끝.......................................................//

    // DB에 저장된 이미지를 가져와서 웹브라우저에 출력하는 예
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM mytable");
   if (rs.next()) {
     // 바이너리 데이터를 저장하고 있는 컬럼으로부터 데이터를 가져온다
   InputStream in = rs.getBinaryStream("bfile");
   // BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
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