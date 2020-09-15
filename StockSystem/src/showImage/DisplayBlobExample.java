package showImage;

import java.io.*;
import java.sql.*;
import javax.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayBlobExample
 */
@WebServlet("/DisplayBlobExample")
public class DisplayBlobExample extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayBlobExample() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Blob image=null;
		Connection con= null;
		Statement stmt = null;
		ResultSet rs = null;
		System.out.println("photo");
		ServletOutputStream out = response.getOutputStream();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.226.129:3306/kopo09?serverTimezone=UTC","root","tkdrl123");
			
			rs=stmt.executeQuery("select img from users where "+"itemid=1;");
			if(rs.next()) {
				image = rs.getBlob(1);
			}else {
				response.setContentType("TEXT/HTML");
				out.println("<title>Display out the blob image</title>");
				out.println("<h4><font color=\"red\">Image is not founded "+"for the given id</font></h4>");
				return;
			}
			response.setContentType("images/jpg");
			InputStream in = image.getBinaryStream();
			int length = (int) image.length();
			int bufferSize = 1024;
			byte[] buffer = new byte[bufferSize];
			while((length = in.read(buffer))!=-1) {
				out.write(buffer,0,length);
			}
			in.close();
			out.flush();
			
		}catch(Exception e) {
			response.setContentType("TEXT/HTML");
			out.println("<title>Unable To Display</title>");
			out.println("<h4><font color=\"red\">Image Display Error="+ e.getMessage() + "</font></h4>");
			return ;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
				
			}catch(SQLException se) {
				se.printStackTrace();
			}
			
			
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
