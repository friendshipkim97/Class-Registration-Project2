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
				JOptionPane.showMessageDialog(null, "���̵� �ִ��� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
				// password mismatch
			}
		} else {
			JOptionPane.showMessageDialog(null, "ȸ�� ������ �ȵǾ��ų� ���̵� �� �� �Է��ϼ̽��ϴ�.");
			// no userId - ȸ�� ���� �ȵ� Ȥ�� ���̵� �� �� �Է�
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
				JOptionPane.showMessageDialog(null, "�̹� �����ϴ� ���̵� �Դϴ�.");
				// password mismatch
			}
		} else {
			//JOptionPane.showMessageDialog(null, "������ �� �ִ� ���̵� �Դϴ�.");
			// no userId - ȸ�� ���� �ȵ� Ȥ�� ���̵� �� �� �Է�
		}
		return bLoginSuccess;
	}
}
