package com.dietplanner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.dietplanner.valueobjects.ProfileVO;

public class ProfileDAO {
	static ProfileVO userProfile = new ProfileVO();
	static DbCon mysql = new DbCon(); 
	static Connection con = null;
	static boolean status = false;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	private static int success;

	public static boolean validateProfile(int userId) {
		
		status = false;
		
	    try {  
	    	con = mysql.createConnection();
			String select = "select * from user_profile where user_id = ?";
			pst = con.prepareStatement(select);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				status = true;
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

	public static ProfileVO getProfile(int userId) {
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
				userProfile.setStartDate(rs.getString(12));
				userProfile.setEndDate(rs.getString(13));
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
	    	String startDate = userProfile.getStartDate();
	    	String endDate = startDate;
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	Calendar c = Calendar.getInstance();
	    	c.setTime(sdf.parse(endDate));

	    	int duration = Integer.parseInt(userProfile.getTimeFrame().replaceAll("[^\\d]", ""));
	    	c.add(Calendar.MONTH, duration);
	    	
	    	endDate = sdf.format(c.getTime());
	    	int dietId = DietPlanDAO.getDietPlanId(userProfile.getFood(), userProfile.getGoal(), userProfile.getTimeFrame());
	    	
	    	con = mysql.createConnection();
			String insert = "insert into user_profile values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pst.setString(12, startDate);
			pst.setString(13, endDate);
			pst.setInt(14, dietId);
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

	public static boolean updateProfile(int userId, int dietId) {
	    try {  
	    	con = mysql.createConnection();
			String update = "alter table user_profile set diet_id = ? where user_id = ?";
			pst = con.prepareStatement(update);
			pst.setInt(1, userId);
			pst.setInt(2, dietId);
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

	public static boolean updateProfile(ProfileVO userProfile) {
	    try {	 
	    	String startDate = userProfile.getStartDate();
	    	String endDate = startDate;
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	Calendar c = Calendar.getInstance();
	    	c.setTime(sdf.parse(endDate));

	    	int duration = Integer.parseInt(userProfile.getTimeFrame().replaceAll("[^\\d]", ""));
	    	c.add(Calendar.MONTH, duration);
	    	
	    	endDate = sdf.format(c.getTime()).split(" ", 2)[0];
	    	int dietId = DietPlanDAO.getDietPlanId(userProfile.getFood(), userProfile.getGoal(), userProfile.getTimeFrame());
	    	
	    	con = mysql.createConnection();
			String update = "update user_profile set"
					+ " firstname = ?"
					+ " lastname = ?"
					+ " height = ?"
					+ " weight = ?"
					+ " age = ?"
					+ " gender = ?"
					+ " bodyshape = ?"
					+ " food = ?"
					+ " goal = ?"
					+ " time_frame = ?"
					+ " start_date = ?"
					+ " end_date = ?"
					+ " where user_id = ?";
			pst = con.prepareStatement(update);	
			pst.setString(1, userProfile.getFirstname());
			pst.setString(2, userProfile.getLastname());
			pst.setInt(3, userProfile.getHeight());
			pst.setInt(4, userProfile.getWeight());
			pst.setInt(5, userProfile.getAge());
			pst.setString(6, userProfile.getGender());
			pst.setString(7, userProfile.getBodyshape());
			pst.setString(8, userProfile.getFood());
			pst.setString(9, userProfile.getGoal());
			pst.setString(10, userProfile.getTimeFrame());
			pst.setString(11, startDate);
			pst.setString(12, endDate);
			pst.setInt(13, userProfile.getUserId());
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