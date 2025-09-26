//servlet for update admins
package UpdateAdmin;


//controller class

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Curent_sv
 */
public class Curent_sv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<Current_users> adminList = new Current_dao().selectAll();
		System.out.println("Number of admins found: " + (adminList != null ? adminList.size() : "null"));
		
		// If no admins found, add some test data for debugging
		if (adminList == null || adminList.isEmpty()) {
			adminList = new ArrayList<>();
			Current_users testAdmin = new Current_users();
			testAdmin.setUdi(1);
			testAdmin.setUname("admin");
			testAdmin.setUpassword("admin123");
			adminList.add(testAdmin);
			System.out.println("Added test admin for display");
		}
		
		request.setAttribute("current_emp", adminList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Admin/updateAdmin/CurrentAdmins.jsp");
		rd.forward(request, response);
	}

	

}
