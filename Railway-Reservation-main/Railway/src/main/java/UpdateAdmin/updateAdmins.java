/*insert admin data */

package UpdateAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateAdmins
 */
public class updateAdmins extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String admin_name = request.getParameter("name");
		String admin_password = request.getParameter("password");
		String admin_re_password = request.getParameter("repassword");
		
		System.out.println("Admin name ;"+admin_name);
		System.out.println("Admin Password :" + admin_password);
		System.out.println("Admin Password Re Entered :" + admin_re_password);
		
		// Basic validation
		if(admin_name == null || admin_name.trim().isEmpty() ||
		   admin_password == null || admin_password.trim().isEmpty()) {
			response.sendRedirect("Admin/updateAdmin/UpdateAdmin.jsp?error=missing_fields");
			return;
		}
		
		if(!admin_password.equals(admin_re_password)) {
			response.sendRedirect("Admin/updateAdmin/UpdateAdmin.jsp?error=password_mismatch");
			return;
		}
		
		InsertAdminData iadata = new InsertAdminData(admin_name, admin_password, admin_re_password);
		
		int j = iadata.insertData();
		
		if(j > 0) {
			System.out.println("Admin inserted successfully");
			response.sendRedirect("Curent_sv?success=admin_added");
		} else {
			System.out.println("Failed to insert admin");
			response.sendRedirect("Admin/updateAdmin/UpdateAdmin.jsp?error=insert_failed");
		}
		
	}

}
