package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MLogin {
	private String userId;
	private String password;
	
	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	

	public MLogin(Connection conn, PreparedStatement pstm, ResultSet rs, String userId) {
		this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
		this.userId=userId;
	}

	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}


	public boolean read() {
		String userId;
		try {
			userId = rs.getString("USERID");
			this.password = rs.getString("PASSWORD");
			if (this.userId.contentEquals(userId)) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

}
