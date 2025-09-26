//servlet for dlete trains
package UpdateTrains;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Deleter_train_sev
 */
public class Deleter_train_sev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int trainId = Integer.parseInt(request.getParameter("trid"));
			System.out.print("Deleting train with ID: " + trainId);
			
			Delete_data delete_data = new Delete_data(trainId);
			int result = delete_data.deleteData();
			
			System.out.print("Delete result: " + result);
			
			if(result > 0) {
				System.out.print("Train deleted successfully");
				response.sendRedirect("/Railway/Cur_train_sev");
			} else {
				System.out.print("Train deletion failed");
				response.sendRedirect("/Railway/Cur_train_sev?error=delete_failed");
			}
		} catch (NumberFormatException e) {
			System.out.print("Invalid train ID parameter");
			e.printStackTrace();
			response.sendRedirect("/Railway/Cur_train_sev?error=invalid_id");
		} catch (Exception e) {
			System.out.print("Error during train deletion");
			e.printStackTrace();
			response.sendRedirect("/Railway/Cur_train_sev?error=system_error");
		}
	}

	

}
