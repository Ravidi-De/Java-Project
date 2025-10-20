//servlet  for delete data
package UpdateAdmin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Del_admin_suv
 */
public class Del_admin_suv extends HttpServlet { //inheritance
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminIdParam = request.getParameter("adminId");
		
		if(adminIdParam == null || adminIdParam.trim().isEmpty()) {
			response.sendRedirect("Curent_sv?error=missing_id");
			return;
		}
		
		int adminId;
		try {
			adminId = Integer.parseInt(adminIdParam);
		} catch (NumberFormatException e) {
			response.sendRedirect("Curent_sv?error=invalid_id");
			return;
		}
		
		System.out.println("Admin Id for Delete: " + adminId);
		
		Del_Admin delete_data = new Del_Admin(adminId);
		int j = delete_data.deleteAdmin();
		
		if(j > 0) {
			System.out.println("Admin deleted successfully");
			response.sendRedirect("Curent_sv?success=admin_deleted");
		} else {
			System.out.println("Failed to delete admin");
			response.sendRedirect("Curent_sv?error=delete_failed");
		}
	}

	

}
