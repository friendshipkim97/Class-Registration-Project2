package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MUser {
	
	private String userId;
	private String password;
	private String name;
	private String number;
	private String hackgwa;
	
	private String searchId;
	private String searchName;
	private String searchHackgwa;
	private String searchNumber;
	
	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	private String changePassword;

	public MUser(Connection conn, PreparedStatement pstm, ResultSet rs, String userId) {
		this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
		this.userId=userId;
	}

	public MUser(Connection conn, PreparedStatement pstm, ResultSet rs, String name, String hackgwa,
			String number) {
		this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
		this.searchName = name;
		this.searchHackgwa = hackgwa;
		this.searchNumber = number;
	}

	public MUser(Connection conn, PreparedStatement pstm, ResultSet rs, String id, String name, String hackgwa,
			String number) {
		this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
		this.searchId=id;
		this.searchName = name;
		this.searchHackgwa = hackgwa;
		this.searchNumber = number;
	}

	public MUser(Connection conn, PreparedStatement pstm, ResultSet rs, String id, String password) {
		this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
		this.searchId=id;
		this.changePassword = password;
	}

	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getNumber() {
		return number;
	}
	public String getHackjwa() {
		return hackgwa;
	}


	public boolean read() {
		String userId;
		try {
			userId = rs.getString("USERID");
			this.password = rs.getString("PASSWORD");
			this.name = rs.getString("NAME");
			this.number = rs.getString("UNUMBER");
			this.hackgwa = rs.getString("HACKGWA");
			
			if (this.userId.contentEquals(userId)) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

	
	public boolean searchId() {
		
		try {
			this.userId = rs.getString("USERID");
			this.password = rs.getString("PASSWORD");
			this.name = rs.getString("NAME");
			this.number = rs.getString("UNUMBER");
			this.hackgwa = rs.getString("HACKGWA");
			
			if(searchName.equals(this.name) && searchHackgwa.equals(this.hackgwa) && searchNumber.equals(this.number)) {
				return true;
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean searchPassword() {

		try {
			this.userId = rs.getString("USERID");
			this.password = rs.getString("PASSWORD");
			this.name = rs.getString("NAME");
			this.number = rs.getString("UNUMBER");
			this.hackgwa = rs.getString("HACKGWA");

			if(searchId.equals(this.userId) && searchName.equals(this.name) && searchHackgwa.equals(this.hackgwa) && searchNumber.equals(this.number)) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	public boolean changePassword() {
		try {
			this.userId = rs.getString("USERID");
			this.password = rs.getString("PASSWORD");
			this.name = rs.getString("NAME");
			this.number = rs.getString("UNUMBER");
			this.hackgwa = rs.getString("HACKGWA");

			if(searchId.equals(this.userId)) {
				
				
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}
}
