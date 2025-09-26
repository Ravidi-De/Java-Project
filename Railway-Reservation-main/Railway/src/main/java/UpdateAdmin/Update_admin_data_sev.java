package UpdateAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update_admin_data_sev
 */
public class Update_admin_data_sev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idParam = request.getParameter("Id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		// Basic validation
		if(idParam == null || name == null || password == null || 
		   name.trim().isEmpty() || password.trim().isEmpty()) {
			response.sendRedirect("Curent_sv?error=missing_fields");
			return;
		}
		
		int id;
		try {
			id = Integer.parseInt(idParam);
		} catch (NumberFormatException e) {
			response.sendRedirect("Curent_sv?error=invalid_id");
			return;
		}
		
		System.out.println("Admin Update data : ID=" + id + ", Name=" + name + ", Password=" + password);
		
		Update_admin_data_class ups = new Update_admin_data_class(id, name, password);
		
		int j = ups.UpdateAdminData();
		
		if(j > 0) {
			System.out.println("Admin updated successfully");
			response.sendRedirect("Curent_sv?success=admin_updated");
		} else {
			System.out.println("Failed to update admin");
			response.sendRedirect("Curent_sv?error=update_failed");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	

}
