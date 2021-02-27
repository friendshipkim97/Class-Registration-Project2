package model;

import java.io.FileWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import valueObject.VGangjwa;

public class MGangjwa {

	private String id;
	private String name;
	private String lecturer;
	private String credit;
	private String time;
	private String fileName;
	private String hackgwa;

	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;

	public MGangjwa(Connection conn, PreparedStatement pstm, ResultSet rs) {
		this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
	}

	public MGangjwa(Connection conn, PreparedStatement pstm, ResultSet rs, String fileName, VGangjwa vGangjwa) {
		this.conn=conn;
		this.pstm=pstm;
		this.rs=rs;
		this.fileName=fileName;
		this.id = vGangjwa.getId();
		this.name = vGangjwa.getName();
		this.lecturer = vGangjwa.getLecturer();
		this.credit = vGangjwa.getCredit();
		this.time = vGangjwa.getTime();
	}

	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getLecturer() {
		return lecturer;
	}
	public String getCredit() {
		return credit;
	}
	public String getTime() {
		return time;
	}
	public String getHackgwa() {
		return hackgwa;
	}

	public void read() {	
		try {
			this.id = rs.getString("ID");
			this.name = rs.getString("NAME");
			this.lecturer = rs.getString("LECTURER");
			this.credit = rs.getString("CREDIT");
			this.time = rs.getString("TIME");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public void save() {
		String queryB = "INSERT INTO "+ this.fileName +" values "+ "('"+this.id+"',"+"'"+this.name+"',"+"'"+this.lecturer+"',"+"'"+this.credit+"',"+"'"+this.time+"')";
		try {
			conn = DBConnection.getConnection();
			pstm= conn.prepareStatement(queryB);
			rs = pstm.executeQuery();
			rs.close();
			pstm.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void search() {
		try {
			this.id = rs.getString("ID");
			this.name = rs.getString("NAME");
			this.lecturer = rs.getString("LECTURER");
			this.credit = rs.getString("CREDIT");
			this.time = rs.getString("TIME");
			this.hackgwa = rs.getString("HACKGWA");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}