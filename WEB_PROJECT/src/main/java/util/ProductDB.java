package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ProductDB {
	public static List<Product> getAllProduct() {
		String sql = "select * from product";
		List<Product> products = new ArrayList<>();

		try {
			Connection con = DBConnector.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(rs.getInt("product_id"));
				p.setDescription(rs.getString("description"));
				p.setManufacturer(rs.getString("manufacturer"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getDouble("price"));
				p.setImageURL(rs.getString("image_url"));
				products.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnector.closeConnection();
		return products;
	}
}
