package UpdateAdmin;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Del_Admin extends DbConnection {
	
	int adminId;
	
	public Del_Admin(int adminId2) {
		this.adminId = adminId2;
	}

	
	public int deleteAdmin() {
		
		System.out.println("Deleting admin with ID: " + adminId);
		
		Del_Admin d_data = new Del_Admin(adminId);
		
		String query = "delete from admins where adi = ?";
		
		PreparedStatement psd;
		int result = 0;
		
		try {
			psd = d_data.getConnection().prepareStatement(query);
			psd.setInt(1, adminId);
			result = psd.executeUpdate();
			
			System.out.println("Delete result: " + result);
			
			psd.close();
			d_data.getConnection().close();
			
		} catch (SQLException e) {
			System.err.println("Error deleting admin: " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
	
	
}
