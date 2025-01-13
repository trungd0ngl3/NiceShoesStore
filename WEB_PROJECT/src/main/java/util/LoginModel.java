package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class LoginModel {
	
	public static User checkLogin(String email, String password) {
		
		String query = "select * from user where email= ? and password= ?";
		User user = null;
		try {
			Connection con = DBConnector.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUserId(rs.getInt("user_id"));
				user.setEmail(email);
				user.setPassword(password);
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnector.closeConnection();
		return user;
	}
}
