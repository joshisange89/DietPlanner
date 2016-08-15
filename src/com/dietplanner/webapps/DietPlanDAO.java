package com.dietplanner.webapps;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dietplanner.dao.DbCon;
import com.dietplanner.valueobjects.DietVO;


public class DietPlanDAO {
	
	static DbCon mysql = new DbCon(); 
	static Connection con = null;
	static boolean status = false;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	private static int success;

	public static DietVO getDietPlan(int userId, String food, String goal, String timeFrame) {

		DietVO diet = new DietVO();
		
		try {  
	    	con = mysql.createConnection();
			String select = "select diet_id, breakfast, lunch, snack, dinner from diet_plan where food = ? and goal = ? and time_frame = ?";
			pst = con.prepareStatement(select);
			pst.setString(1, food);
			pst.setString(1, goal);
			pst.setString(1, timeFrame);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				diet.setDietId(rs.getInt(1));
				diet.setBreakfast(rs.getString(2));
				diet.setLunch(rs.getString(3));
				diet.setSnack(rs.getString(4));
				diet.setDinner(rs.getString(5));
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
		return diet;
	}

	public static DietVO getDietPlan(int userId) {
		
		DietVO diet = new DietVO();
		try {  
	    	con = mysql.createConnection();
			String select = "select diet_id, breakfast, lunch, snack, dinner from diet_plan where user_id = ?";
			pst = con.prepareStatement(select);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				diet.setDietId(rs.getInt(1));
				diet.setBreakfast(rs.getString(2));
				diet.setLunch(rs.getString(3));
				diet.setSnack(rs.getString(4));
				diet.setDinner(rs.getString(5));
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
		return diet;
	}
}
