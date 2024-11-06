package lectureEvaluation.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import lectureEvaluation.util.DatabaseUtil;


/*
 * 쿼리 명명 규칙 : 스네이크 케이스(_)
 * 자바 명명 규칙 : 캐멀 케이스(aaBb)
 */
public class UserRepository {
	
	public int login(String userId, String userPassword) throws SQLException {
		String sql = "SELECT user_password FROM USER WHERE user_id = ?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				} else {
					return 0; //비밀번호 틀림
				}
			}
			return -1; //아이디 없음
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return -2; //DB 에러
	}
	
	public int join(UserDto user) throws SQLException {
		String sql = "INSERT INTO user VALUES(?, ?, ?, ?, false);";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			
			return pstmt.executeUpdate(); //변경값 갯수 반환(1을 반환함)
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return -1; //DB 에러
	}
	
	public boolean getUserEmailChecked(String userId) throws SQLException {
		String sql = "SELECT user_email_checked FROM user WHERE user_id = ?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getBoolean(1); //이메일인증 성공
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return false;
	}
	
	public boolean setUserEmailChecked(String userId) throws SQLException {
		
		/*
		 * 여기까지
		 */
		
		return false;
		
	}
	
	private void close(Connection conn, Statement stmt, ResultSet rs) throws SQLException{
		if(rs != null) {
			try {
				rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(stmt != null) {
			try {
				stmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
