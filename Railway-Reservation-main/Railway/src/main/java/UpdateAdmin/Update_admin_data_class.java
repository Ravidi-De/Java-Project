package UpdateAdmin;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Update_admin_data_class  extends DbConnection {
	int id;
	String name;
	String password;
	
	public Update_admin_data_class(int i , String name, String pass) {
		this.id = i;
		this.name = name;
		this.password = pass;
	}
	
	public int UpdateAdminData() {
		Update_admin_data_class uad = new Update_admin_data_class(id, name, password);
		
		String sql = "update admins set anme=?,apassword=? where adi = ?";
		
		PreparedStatement psd;
		int result = 0;
		
		try {
			psd = uad.getConnection().prepareStatement(sql);
			
			psd.setString(1, name);
			psd.setString(2, password);
			psd.setInt(3, id);
			
			result = psd.executeUpdate();
			
			if(result > 0) {
				System.out.println("Admin update successful");
			} else {
				System.out.println("No admin found with ID: " + id);
			}
			
			psd.close();
			uad.getConnection().close();
			
		} catch (SQLException e) {
			System.err.println("Error updating admin data: " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
}
