package mainFrame;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URISyntaxException;

import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import com.thehowtotutorial.splashscreen.JSplash;

import constants.Constants;
import valueObject.VUser;

public class Main {
	
  private PLoginDialog pLoginDialog;
  private PMainFrame pMainFrame;
  private PSignUp pSignUp;
  private PSearchId pSearchId;
  private PSearchPassword pSearchPassword;
  private ActionHandler actionHandler;
  
  public Main() throws URISyntaxException {  // 먼저 만들고나서 initialize하는것 
	  try {
			UIManager.setLookAndFeel("net.infonode.gui.laf.InfoNodeLookAndFeel");
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException
				| UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
	 
	   actionHandler = new ActionHandler();	
		pLoginDialog = new PLoginDialog(actionHandler);
		pLoginDialog.setVisible(true);	
  }
	
  private void initialize() {
	  pLoginDialog.initialize();
  }
	
	private void validateUser(String actioncommand) {
		VUser vUser = pLoginDialog.validateUser(actioncommand);
		if(vUser!=null) {
			pMainFrame = new PMainFrame(); //new 에서 데이터보내지말것
			pMainFrame.setVisible(true);
			pMainFrame.initialize(vUser, pLoginDialog); //initialize에서 데이터보냄
		}	
	}
	
	private void clickCancelButton() {
		JOptionPane.showMessageDialog(null, "나가기 누르셨습니다.");
		this.pLoginDialog.dispose();	
	}
	
	private void openSignUp() {
		pSignUp = new PSignUp(); 
		pSignUp.setVisible(true);
		pSignUp.initialize(); 
	}
	
	private void openSearchId() {
		pSearchId = new PSearchId(); 
		pSearchId.setVisible(true);
		pSearchId.initialize(); 
	}
	
	private void openSearchPassword() {
		pSearchPassword = new PSearchPassword(); 
		pSearchPassword.setVisible(true);
		pSearchPassword.initialize(); 
	}
	
	public class ActionHandler implements ActionListener {

		public void actionPerformed(ActionEvent event) {

			if (event.getActionCommand().equals(Constants.ELoginDialog.okButtonLabel.getText())) {
				validateUser(event.getActionCommand());
			}
			else if (event.getActionCommand().equals(Constants.ELoginDialog.cancelButtonLabel.getText())) {
				clickCancelButton();
			}
			else if (event.getActionCommand().equals(Constants.ELoginDialog.singUpButtonLabel.getText())) {
				openSignUp();
			}
			else if (event.getActionCommand().equals(Constants.ELoginDialog.searchIdButtonLabel.getText())) {
				openSearchId();
			}
			else if (event.getActionCommand().equals(Constants.ELoginDialog.searchPasswordButtonLabel.getText())) {
				openSearchPassword();
			}
		}

	}
	  public static void main(String[] args) throws URISyntaxException {

	       // Create Swing GUI and so forth
			Main main = new Main();
			main.initialize();
			
		}
	  }

	 


