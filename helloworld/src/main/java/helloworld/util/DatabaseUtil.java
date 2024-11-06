package helloworld.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/lecture";
			String dbId = "root";
			String dbPassword = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, dbId, dbPassword);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
