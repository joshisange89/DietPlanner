package com.dietplanner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

import com.dietplanner.valueobjects.DietTrackVO;
import com.dietplanner.valueobjects.UserVO;

public class DietTrackDAO {

	static DbCon mysql = new DbCon(); 
	static Connection con = null;
	static boolean status = false;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static int success;
	static String[] months = { "None", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
	static ArrayList<DietTrackVO> dietTracks = new ArrayList<DietTrackVO>();

	public static boolean UpdateTracking(int userId, String dayOfWeek, String day) {
		
		String month, dayDate, year;
		month = day.split(" ", 3)[0];
		dayDate = day.split(" ", 3)[1];
		year = day.split(" ", 3)[2];
	         
		String dateStr = year+"-"+Arrays.asList(months).indexOf(month)+"-"+dayDate.split(",", 2)[0];
		
	    try {
	    	con = mysql.createConnection();
			String insert = "insert into diet_track values(?,?,?,?)";
			pst = con.prepareStatement(insert);
			pst.setInt(1, userId);
			pst.setString(2, dayOfWeek);
			pst.setString(3, dateStr);
			pst.setBoolean(4, true);
			success = pst.executeUpdate();
	
			if (success > 0) {
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

	public static int getTracking(int userId) {
		
		int trakdDays = 0;
		
	    try {
	    	con = mysql.createConnection();
			String select = "select count(user_id) from diet_track where user_id = ?";
			pst = con.prepareStatement(select);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
	
			if (rs.next()) {
				trakdDays = rs.getInt(1);
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
		return trakdDays;		
	}

	public static ArrayList<DietTrackVO> getTrackingDays(int userId) {
		
	    try {
	    	con = mysql.createConnection();
			String select = "select week_day, daily_date from diet_track where user_id = ?";
			pst = con.prepareStatement(select);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
	
			while (rs.next()) {
				DietTrackVO dietTrack = new DietTrackVO();
				dietTrack.setWeekDay(rs.getString(1));
				dietTrack.setEachDate(rs.getString(rs.getString(2)));
				dietTracks.add(dietTrack);
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
		return dietTracks;
	}
}
