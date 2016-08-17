package com.dietplanner.valueobjects;

import java.util.Date;

public class DietTrackVO {
	private int userId;
	private String eachDate;
	private boolean flag;
	private String weekDay;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getEachDate() {
		return eachDate;
	}
	public void setEachDate(String eachDate) {
		this.eachDate = eachDate;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String getWeekDay() {
		return weekDay;
	}
	public void setWeekDay(String weekDay) {
		this.weekDay = weekDay;
	}
}
