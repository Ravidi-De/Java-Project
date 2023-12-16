package Admin.Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LOGINADMIN
 */
@WebServlet("/LOGINADMIN")
public class LOGINADMIN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.sendRedirect("Admin/admin.jsp");
		
		try {
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			//connect the database
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Railway","root","Sachin-123");
			
			//getting data from the login.jsp
			String uname = request.getParameter("adminname");
			String pwd = request.getParameter("adminpassword");
			
			System.out.print("ddd"+uname+pwd);
			
				PreparedStatement psd = con.prepareStatement("select anme from admin where anme = ? and apassword = ?");
				psd.setString(1, uname);
				psd.setString(2, pwd);
				
				ResultSet rs = psd.executeQuery();
				
				if(rs.next()) {
					response.sendRedirect("Admin/admin.jsp");
					
					//starting a session
					HttpSession session = request.getSession();
					session.setAttribute("user_name", uname);
			
				}else {
					out.println("<font color=red size =18 >LOGIN FAILD !! <br>");
					out.println("<a href=login.jsp ></a>");
					response.sendRedirect("SignUp/login.jsp");
				}
			
	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}

}
