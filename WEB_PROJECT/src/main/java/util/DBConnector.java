package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	public static Connection connection;

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/shoes_store_db";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASSWORD = "";

	public static Connection getConnection() {
		if (connection != null) {
			return connection;
		} else {

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;
	}

	public static void closeConnection() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				connection = null;
			}
		}
	}

}
