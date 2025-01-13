package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Customer;

public class CustomerDB {
	public static Customer getCustomer(String userID) {
		String query = "select * from customer where user_id = ?";
		Customer c = null;

		try {
			Connection con = DBConnector.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, userID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				c = new Customer();

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnector.closeConnection();
		return c;
	}
}
