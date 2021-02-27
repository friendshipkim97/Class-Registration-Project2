package control;

import javax.swing.JOptionPane;

import model.DBConnection;
import model.MLogin;
import valueObject.VLogin;

public class CLogin {

	public boolean validate(VLogin vLogin) {
		boolean bLoginSuccess = false;
		
		DBConnection dbConnection = new DBConnection();
		MLogin mLogin = dbConnection.getLogin(vLogin.getUserId());
		
		if (mLogin != null) {
			System.out.println(vLogin.getPassword());
			System.out.println(mLogin.getPassword());
			if (vLogin.getPassword().contentEquals(mLogin.getPassword())) {
				bLoginSuccess = true;
			} else {
				JOptionPane.showMessageDialog(null, "아이디가 있느나 비밀번호가 틀렸습니다.");
				// password mismatch
			}
		} else {
			JOptionPane.showMessageDialog(null, "회원 가입이 안되었거나 아이디를 잘 못 입력하셨습니다.");
			// no userId - 회원 가입 안됨 혹은 아이디 잘 못 입력
		}
		return bLoginSuccess;
	}
	
	public boolean validateSignUp(VLogin vLogin) {
		boolean bLoginSuccess = false;
		
		DBConnection dbConnection = new DBConnection();
		MLogin mLogin = dbConnection.getLogin(vLogin.getUserId());
		
		if (mLogin != null) {
			if (vLogin.getPassword().contentEquals(mLogin.getPassword())) {
				bLoginSuccess = true;
			} else {
				JOptionPane.showMessageDialog(null, "이미 존재하는 아이디 입니다.");
				// password mismatch
			}
		} else {
			//JOptionPane.showMessageDialog(null, "가입할 수 있는 아이디 입니다.");
			// no userId - 회원 가입 안됨 혹은 아이디 잘 못 입력
		}
		return bLoginSuccess;
	}
}
