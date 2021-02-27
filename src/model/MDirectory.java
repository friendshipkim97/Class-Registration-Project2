package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class MDirectory {
	private Scanner scanner;
	
	private String id;
	private String name;
    private String fileName;
    
    private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	private String college;
	private String campus;
    
    
    public MDirectory(Connection conn, PreparedStatement pstm, ResultSet rs) {
    	this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
	}
	
	public void read2() {		
		try {
			this.id = rs.getString("ID");
			this.name = rs.getString("NAME");
			this.fileName = rs.getString("FILENAME");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
    
    public String getId() {
    	return id;
    }
    public String getName() {
    	return name;
    }
    public String getFileName() {
    	return fileName;
    }
    public String getCollege() {
    	return college;
    }
    public String getCampus() {
    	return campus;
    }

	public boolean searchCollege(String fileName) {
		try {
			this.id = rs.getString("ID");
			this.name = rs.getString("NAME");
			this.fileName = rs.getString("FILENAME");
			this.college = rs.getString("COLLEGE");
			if(fileName.equals(this.fileName)) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean searchCampus(String fileName) {
		try {
			this.id = rs.getString("ID");
			this.name = rs.getString("NAME");
			this.fileName = rs.getString("FILENAME");
			this.campus = rs.getString("CAMPUS");
			if(fileName.equals(this.fileName)) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
