package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import valueObject.VGangjwa;

public class DBConnection 
{
	public static Connection dbConn;
	public static boolean campusOn = false;
	public static boolean collegeOn = false;
	public static boolean hackgwaOn = false;

	public static Connection getConnection()
	{
		Connection conn = null;
		try {
			String user = "system"; 
			String pw = "5980";
			String url = "jdbc:oracle:thin:@DESKTOP-RLH881B:1521:XE";

			Class.forName("oracle.jdbc.driver.OracleDriver");        
			conn = DriverManager.getConnection(url, user, pw);

			System.out.println("Database에 연결되었습니다.\n");

		} catch (ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 :"+cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속실패 : "+sqle.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
		return conn;     
	}

	public MLogin getLogin(String userId) {

		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		MLogin mLogin =null;
		try {
			// SQL 문장을 만들고 만약 문장이 질의어(SELECT문)라면
			// 그 결과를 담을 ResulSet 객체를 준비한 후 실행시킨다.
			String query = "SELECT USERID, PASSWORD FROM USERID";

			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();

			mLogin = new MLogin(conn, pstm, rs, userId);
			while(rs.next()){

				boolean found = mLogin.read();
				if (found) {
					rs.close();
					pstm.close();
					conn.close();
					return mLogin;
				}

			}

		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();

		}
		return null;
	}

	public MUser getUser(String userId) {

		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		MUser mUser = null;

		try {

			String query = "SELECT * FROM "+userId.toUpperCase();
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			mUser = new MUser(conn, pstm, rs, userId);

			while (rs.next()) {
				boolean found = mUser.read();
				if (found) {
					rs.close();
					pstm.close();
					conn.close();
					return mUser;
				}
			}

		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public MUser searchId(String name, String hackgwa, String number) {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		MUser mUser = null;

		try {

			String query = "SELECT * FROM USERID";
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			mUser = new MUser(conn, pstm, rs, name, hackgwa, number);
			System.out.println(rs.next());
			while (rs.next()) {
				boolean found = mUser.searchId();
				if (found) {
					rs.close();
					pstm.close();
					conn.close();
					return mUser;
				}
			}

		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public MUser searchPassword(String id, String name, String hackgwa, String number) {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		MUser mUser = null;

		try {

			String query = "SELECT * FROM USERID";
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			mUser = new MUser(conn, pstm, rs, id, name, hackgwa, number);

			while (rs.next()) {
				boolean found = mUser.searchPassword();
				if (found) {
					rs.close();
					pstm.close();
					conn.close();
					return mUser;
				}
			}

		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public void signUp(String id, String password, String name, String number, String hackgwa) {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		MUser mUser = null;
System.out.println("확인용");
		try {
			conn = DBConnection.getConnection();
			StringBuilder sb = new StringBuilder();
			String query = sb.append("create table "+id.toUpperCase()+" (")
					.append("USERID varchar2(15) not null,")
					.append("PASSWORD varchar2(10) not null,")
					.append("NAME varchar2(15) not null,")
					.append("UNUMBER varchar2(15) not null,")
					.append("HACKGWA varchar2(30) not null,")
					.append("primary key (USERID)")
					.append(")").toString();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();

			String queryA = "INSERT INTO "+ id + " values"+ "('"+id+"',"+"'"+password+"',"+"'"+name+"',"+"'"+number+"',"+"'"+hackgwa+"')";
			pstm= conn.prepareStatement(queryA);
			rs = pstm.executeQuery();

			String queryB = "INSERT INTO USERID values"+ "('"+id+"',"+"'"+password+"',"+"'"+name+"',"+"'"+number+"',"+"'"+hackgwa+"')";
			pstm= conn.prepareStatement(queryB);
			rs = pstm.executeQuery();

			StringBuilder sb2 = new StringBuilder();
			String query2 = sb2.append("create table "+id+"M"+"(")
					.append("ID varchar2(15) not null,")
					.append("NAME varchar2(40) not null,")
					.append("LECTURER varchar2(20) not null,")
					.append("CREDIT varchar2(15) not null,")
					.append("TIME varchar2(30) not null,")
					.append("primary key (ID)")
					.append(")").toString();
			pstm = conn.prepareStatement(query2);
			rs = pstm.executeQuery();

			StringBuilder sb3 = new StringBuilder();
			String query3 = sb3.append("create table "+id+"S"+"(")
					.append("ID varchar2(15) not null,")
					.append("NAME varchar2(40) not null,")
					.append("LECTURER varchar2(20) not null,")
					.append("CREDIT varchar2(15) not null,")
					.append("TIME varchar2(30) not null,")
					.append("primary key (ID)")
					.append(")").toString();
			pstm = conn.prepareStatement(query3);
			rs = pstm.executeQuery();

			rs.close();
			pstm.close();
			conn.close();


		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
	}

	public Vector<MDirectory> getDirectories(String fileName) {
		Vector<MDirectory> mDirectories = new Vector<MDirectory>();
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		String query = null;
		try {
			if(fileName.contentEquals("root")) {
				//collegeOn = false;
				query = "SELECT * FROM CAMPUS";
				conn = DBConnection.getConnection();
				pstm = conn.prepareStatement(query);
				rs = pstm.executeQuery();
				while (rs.next()) {
					MDirectory mDirectory = new MDirectory(conn, pstm, rs);
					mDirectory.read2();
					mDirectories.add(mDirectory);
				}
				rs.close();
				pstm.close();
				conn.close();
				return mDirectories;

			}
			else if(fileName.contentEquals("yongin")||fileName.contentEquals("seoul")) {
				query = "SELECT * FROM COLLEGE WHERE CAMPUS='"+fileName+"'";
				System.out.println(query);
				//collegeOn=true;
				conn = DBConnection.getConnection();
				pstm = conn.prepareStatement(query);
				rs = pstm.executeQuery();
				while (rs.next()) {
					MDirectory mDirectory = new MDirectory(conn, pstm, rs);
					mDirectory.read2();
					mDirectories.add(mDirectory);
				}
				rs.close();
				pstm.close();
				conn.close();
				return mDirectories;
			}
			else if(fileName.contentEquals("generalY")||fileName.contentEquals("engineering")||fileName.contentEquals("science")||fileName.contentEquals("art")
					||fileName.contentEquals("architecture")||fileName.contentEquals("generalS")||fileName.contentEquals("ict")
					||fileName.contentEquals("business")||fileName.contentEquals("social")||fileName.contentEquals("human")||fileName.contentEquals("law")
					){
				query = "SELECT * FROM HACKGWA WHERE COLLEGE='"+fileName+"'";
				System.out.println(query);
				collegeOn=true;
				conn = DBConnection.getConnection();
				pstm = conn.prepareStatement(query);
				rs = pstm.executeQuery();
				while (rs.next()) {
					MDirectory mDirectory = new MDirectory(conn, pstm, rs);
					mDirectory.read2();
					mDirectories.add(mDirectory);
				}
				rs.close();
				pstm.close();
				conn.close();
				return mDirectories;
			}



		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public Vector<MGangjwa> getGangjwas(String fileName) {
		Vector<MGangjwa> mGangjwas = new Vector<MGangjwa>();
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		String query = null;
		try {

			query = "SELECT * FROM GANGJWA WHERE HACKGWA='"+fileName+"'";
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			while (rs.next()) {
				MGangjwa mGangjwa = new MGangjwa(conn, pstm, rs);
				mGangjwa.read();
				mGangjwas.add(mGangjwa);
			}
			rs.close();
			pstm.close();
			conn.close();
			return mGangjwas;

		}catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public Vector<MGangjwa> getResults(String fileName) {
		Vector<MGangjwa> mGangjwas = new Vector<MGangjwa>();
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		String query = null;
		try {

			query = "SELECT * FROM "+fileName.toUpperCase();
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			while (rs.next()) {
				MGangjwa mGangjwa = new MGangjwa(conn, pstm, rs);
				mGangjwa.read();
				mGangjwas.add(mGangjwa);
			}
			rs.close();
			pstm.close();
			conn.close();
			return mGangjwas;

		}catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public void saveResults(String fileName, Vector<VGangjwa> vGangjwas) {
		Vector<MGangjwa> mGangjwas = new Vector<MGangjwa>();
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		String queryA = "DELETE FROM "+ fileName;
		try {
			conn = DBConnection.getConnection();
			pstm= conn.prepareStatement(queryA);
			rs = pstm.executeQuery();
			rs.close();
			pstm.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(VGangjwa vGangjwa : vGangjwas) {
			MGangjwa mGangjwa = new MGangjwa(conn, pstm, rs, fileName, vGangjwa);
			mGangjwa.save();
		}

	}

	
	public Vector<MGangjwa> searchGangjwa(String fileName) {
		Vector<MGangjwa> mGangjwas = new Vector<MGangjwa>();
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		String query = null;
		try {
		
			query = "SELECT * FROM GANGJWA WHERE NAME LIKE "+"'%"+fileName+"%'";
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			while (rs.next()) {
				MGangjwa mGangjwa = new MGangjwa(conn, pstm, rs);
				mGangjwa.search();
				mGangjwas.add(mGangjwa);
			}
			rs.close();
			pstm.close();
			conn.close();
			return mGangjwas;

		}catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public MDirectory searchCollege(String fileName) {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		String query = null;
		try {

			query = "SELECT * FROM HACKGWA";
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			while (rs.next()) {
				MDirectory mDirectory = new MDirectory(conn, pstm, rs);
				boolean found = mDirectory.searchCollege(fileName);
				if (found) {
					rs.close();
					pstm.close();
					conn.close();
					return mDirectory;
				}
			}
			
			rs.close();
			pstm.close();
			conn.close();

		}catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}
	
	public MDirectory searchCampus(String fileName) {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		String query = null;
		try {

			query = "SELECT * FROM COLLEGE";
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			while (rs.next()) {
				MDirectory mDirectory = new MDirectory(conn, pstm, rs);
				boolean found = mDirectory.searchCampus(fileName);
				if (found) {
					rs.close();
					pstm.close();
					conn.close();
					return mDirectory;
				}
			}
			
			rs.close();
			pstm.close();
			conn.close();

		}catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}
		return null;
	}

	public void changePassword(String id, String password) {
		
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
		ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
		try {
			String queryA = "UPDATE USERID SET PASSWORD = "+password +" WHERE USERID = '"+id+"'";
			String queryB = "UPDATE "+ id +" SET PASSWORD = "+password +" WHERE USERID = '"+id+"'";
			System.out.println(queryA);
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(queryA);
			rs = pstm.executeQuery();
			pstm = conn.prepareStatement(queryB);
			rs = pstm.executeQuery();
			rs.close();
			pstm.close();
			conn.close();


		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();
		}

	}


}


