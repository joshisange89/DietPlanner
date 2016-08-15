package com.dietplanner.valueobjects;

public class DietVO {
	private int dietId;
	private String breakfast;
	private String lunch;
	private String snack;
	private String dinner;
	
	public int getDietId() {
		return dietId;
	}
	public void setDietId(int dietId) {
		this.dietId = dietId;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getLunch() {
		return lunch;
	}
	public void setLunch(String lunch) {
		this.lunch = lunch;
	}
	public String getSnack() {
		return snack;
	}
	public void setSnack(String snack) {
		this.snack = snack;
	}
	public String getDinner() {
		return dinner;
	}
	public void setDinner(String dinner) {
		this.dinner = dinner;
	}
}
