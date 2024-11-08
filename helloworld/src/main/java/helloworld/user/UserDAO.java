package helloworld.user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import helloworld.util.DatabaseUtil;

public class UserDAO {

	
	public int join(String userId, String userPassword) {
		
		String sql = "INSERT INTO USER VALUES(?, ?);";
		
		try {
			Connection conn = DatabaseUtil.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPassword);
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	
}
