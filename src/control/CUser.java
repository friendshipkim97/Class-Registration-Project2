package control;

import model.DBConnection;
import model.MUser;
import valueObject.VUser;

public class CUser {

	public VUser getUser(String userId) {
		VUser vUser = null;

		DBConnection dbConnection = new DBConnection();
		MUser mUser = dbConnection.getUser(userId);

		if (mUser != null) {
			vUser = new VUser(mUser.getUserId(), mUser.getPassword(), mUser.getName(), mUser.getNumber(), mUser.getHackjwa());
		}
		return vUser;
	}

	public VUser searchId(String name, String hackgwa, String number) {
		VUser vUser = null;
		
		DBConnection dbConnection = new DBConnection();
		MUser mUser = dbConnection.searchId(name, hackgwa, number);

		if (mUser != null) {
			vUser = new VUser(mUser.getUserId(), mUser.getPassword(), mUser.getName(), mUser.getNumber(), mUser.getHackjwa());
		}
		return vUser;
	}

	public VUser searchPassword(String id, String name, String hackgwa, String number) {
		VUser vUser = null;
		
		DBConnection dbConnection = new DBConnection();
		MUser mUser = dbConnection.searchPassword(id, name, hackgwa, number);
		
		if (mUser != null) {
			vUser = new VUser(mUser.getUserId(), mUser.getPassword(), mUser.getName(), mUser.getNumber(), mUser.getHackjwa());
		}
		return vUser;
	}
	
	public void signUp(String id, String password, String name, String hackgwa, String number) {

		DBConnection dbConnection = new DBConnection();
		dbConnection.signUp(id, password, name, hackgwa, number);
	
	}
	
	public void changePassword(String id, String password) {
		
		DBConnection dbConnection = new DBConnection();
		dbConnection.changePassword(id, password);
	
	}
	

}
