//getting database connection
package UpdateAdmin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	String url = "jdbc:mysql://localhost:3306/Railway";
	String db_uname = "root";
	String db_password = "12345678";
	
	public Connection getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver loaded : // UpdateAdmin //");
			
			Connection con = DriverManager.getConnection(url,db_uname,db_password);
			System.out.println("Connection Sucessfull:// UpdateAdmin //");
			
			return con;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
}
