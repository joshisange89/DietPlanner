package com.dietplanner.dao;
import java.sql.*;

public class DbCon {
	
	Connection con = null;
	
	public Connection createConnection() throws Exception{
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost/dietplanner?user=root&password=root");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return con;
	}
	public void closeConnection(Connection con) throws SQLException{
		con.close();
	}
}