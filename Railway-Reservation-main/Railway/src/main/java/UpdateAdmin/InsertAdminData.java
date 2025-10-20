//class for inser data
package UpdateAdmin;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertAdminData extends DbConnection {
	
	
	String Admin_name;
	String Admin_password;
	String Re_password;
	
	
	public InsertAdminData(String admin_name , String Admin_password ,String Re_password) { //constructions
		this.Admin_name = admin_name;
		this.Admin_password = Admin_password;
		this.Re_password = Re_password;
	}
	
	public int insertData() {
		
		System.out.println("Admin name.... ;"+Admin_name);
		System.out.println("Admin Password........ :" + Admin_password);
		System.out.println("Admin Password Re Entered ........:" + Re_password);
		
	//create a object 
	InsertAdminData iad = new InsertAdminData(Admin_name, Admin_password, Re_password);
	
	// Generate default email from admin name (remove spaces and make lowercase)
	String defaultEmail = Admin_name.toLowerCase().replaceAll("\\s+", "") + "@railway.com";
	
	String query = "INSERT INTO admins(aname,apassword,aemail) VALUES (?,?,?)";
	
	PreparedStatement psd;
	int result = 0;		try {
			psd = iad.getConnection().prepareStatement(query);
			
			psd.setString(1, Admin_name);
			psd.setString(2, Admin_password);
			psd.setString(3, defaultEmail);
			
			result = psd.executeUpdate();
			System.out.println("Insert result: " + result);
			
			psd.close();
			iad.getConnection().close();
			
		} catch (SQLException e) {
			System.err.println("Error inserting admin data: " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

}
