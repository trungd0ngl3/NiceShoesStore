package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	public static Connection connection;
	public static synchronized Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/shoes_store_db";
		if(connection != null) {
			return connection;
		}
		else {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, "root", "");
	
		} catch (Exception e) {
			e.printStackTrace();
		}}
		return connection;
	}
	
	public static synchronized void closeConnection() {
		if(connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				connection = null;
			}
		}
	}
}
