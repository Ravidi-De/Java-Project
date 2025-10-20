package Reservation;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Update_res_class extends DbConnection{
	int id;
	String name;
	String from ;
	String to;
	String phone;
	String mail;
	
	public Update_res_class(int i, String name,String from,String to, String phone ,String mail) {
		this.id = i;
		this.name= name;
		this.from = from;
		this.to = to;
		this.phone = phone;
		this.mail = mail;
		
	}
	
	public int UpdateData() {
		Update_res_class urs = new Update_res_class(id, name, from, to, phone, mail);
		
		/*sql query for update user reservation*/
		String sql = "UPDATE reservation SET name=?,f_rom=?,t_o=?,phone=?,email=? WHERE res_id=?";
		/*create a object from the prepared statement*/
		PreparedStatement psd;
		int result = 0;
		
		try {
			/*passing value tio the sql query*/
			psd = urs.getConnection().prepareStatement(sql);
			psd.setString(1, name);
			psd.setString(2, from);
			psd.setString(3, to);
			psd.setString(4, phone);
			psd.setString(5, mail);
			psd.setInt(6, id);
			
			result = psd.executeUpdate();
			
			if(result > 0) {
				System.out.println("Reservation updated successfully. Rows affected: " + result);
			}
			
			psd.close();
			urs.getConnection().close();
			
		} catch (SQLException e) {
			System.err.println("Error updating reservation: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
}
