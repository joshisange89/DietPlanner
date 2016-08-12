package com.dietplanner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dietplanner.valueobjects.ProfileVO;

public class ProfileDAO {
	static ProfileVO userProfile = new ProfileVO();
	static DbCon mysql = new DbCon(); 
	static Connection con = null;
	static boolean status = false;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	private static int success;

	public static ProfileVO validateProfile(int userId) {
	    try {  
	    	con = mysql.createConnection();
			String select = "select * from user_profile where user_id = ?";
			pst = con.prepareStatement(select);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				userProfile.setUserId(Integer.parseInt(rs.getString(1)));
				userProfile.setFirstname(rs.getString(2));
				userProfile.setLastname(rs.getString(3));
				userProfile.setHeight(rs.getInt(4));
				userProfile.setWeight(rs.getInt(5));
				userProfile.setAge(rs.getInt(6));
				userProfile.setGender(rs.getString(7));
				userProfile.setBodyshape(rs.getString(8));
				userProfile.setFood(rs.getString(9));
				userProfile.setGoal(rs.getString(10));
				userProfile.setTimeFrame(rs.getString(11));
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
		return userProfile;
	}

	public static boolean createProfile(ProfileVO userProfile) {
	    try {  
	    	con = mysql.createConnection();
			String insert = "insert into user_profile values(?,?,?,?,?,?,?,?,?,?,?)";
			pst = con.prepareStatement(insert);
			pst.setInt(1, userProfile.getUserId());
			pst.setString(2, userProfile.getFirstname());
			pst.setString(3, userProfile.getLastname());
			pst.setInt(4, userProfile.getHeight());
			pst.setInt(5, userProfile.getWeight());
			pst.setInt(6, userProfile.getAge());
			pst.setString(7, userProfile.getGender());
			pst.setString(8, userProfile.getBodyshape());
			pst.setString(9, userProfile.getFood());
			pst.setString(10, userProfile.getGoal());
			pst.setString(11, userProfile.getTimeFrame());
			success = pst.executeUpdate();
			
			if (success > 0) {
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
