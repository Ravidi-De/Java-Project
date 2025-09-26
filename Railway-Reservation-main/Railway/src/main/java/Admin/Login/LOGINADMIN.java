package Admin.Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LOGINADMIN
 */
public class LOGINADMIN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//connect the database
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Railway","root","1234");
			
			//getting data from the login.jsp
			String uname = request.getParameter("adminname");
			String pwd = request.getParameter("adminpassword");
			
			System.out.println("Admin login attempt: " + uname);
			
			PreparedStatement psd = con.prepareStatement("select anme from admin where anme = ? and apassword = ?");
			psd.setString(1, uname);
			psd.setString(2, pwd);
			
			ResultSet rs = psd.executeQuery();
			
			if(rs.next()) {
				// Authentication successful
				//starting a session
				HttpSession session = request.getSession();
				session.setAttribute("user_name", uname);
				
				// Redirect to admin page
				response.sendRedirect("Admin/admin.jsp");
				
			} else {
				// Authentication failed
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<!DOCTYPE html>");
				out.println("<html><head><title>Login Failed</title></head><body>");
				out.println("<h2 style='color:red;'>LOGIN FAILED!</h2>");
				out.println("<p>Invalid username or password.</p>");
				out.println("<a href='Admin/AdminLogin.jsp'>Try Again</a>");
				out.println("</body></html>");
			}
			
			// Close database resources
			rs.close();
			psd.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database driver error");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error");
		}}

}
