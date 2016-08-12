package com.dietplanner.dao;
import java.sql.*;
import com.dietplanner.valueobjects.UserVO;

public class LoginDAO {
	static DbCon mysql = new DbCon(); 
	static Connection con = null;
	static boolean status = false;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static int success;
	static UserVO user = new UserVO();
	
    public static UserVO validateUser(String emailId, String password) {
    		
	    try {  
	    	con = mysql.createConnection();
			String select = "select * from users where email_id = ? and password = ?";
			pst = con.prepareStatement(select);
			pst.setString(1, emailId);
			pst.setString(2, password);
			rs = pst.executeQuery();
	
			if (rs.next()) {
				user.setUserId(Integer.parseInt(rs.getString(1)));
				user.setEmailId(rs.getString(2));
				user.setPassword(rs.getString(3));
			} 
	    } catch (Exception e) {  
	        System.out.println(e);  
	    } finally {  
	    	try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
		return user;
	}

	public static boolean RegisterUser(String emailId, String password) {
		
	    try {
	    	con = mysql.createConnection();
			String insert = "insert into users (email_id, password) values(?,?)";
			pst = con.prepareStatement(insert);
			pst.setString(1, emailId);
			pst.setString(2, password);
			success = pst.executeUpdate();
	
			if (success > 0 ) {
				status = true;
			} else {
				status = false;
			}
	    } catch (Exception e) {  
	        System.out.println(e);  
	    } finally {
	    	try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
		return status;
	}
}
