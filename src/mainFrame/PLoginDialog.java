package mainFrame;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Desktop;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.SwingConstants;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import com.thehowtotutorial.splashscreen.JSplash;

import constants.Constants.ELoginDialog;
import constants.Constants.EToolBar;
import control.CLogin;
import control.CUser;
import mainFrame.Main.ActionHandler;
import valueObject.VLogin;
import valueObject.VUser;

public class PLoginDialog extends JDialog {
	// attributes
	private static final long serialVersionUID = 1L;

	// components
	private JLabel userIdLabel;
	private JTextField UserIdTextField;
	private JLabel passwordLabel;
	private JTextField passwordTextField;
	private JButton okButton;
	private JButton cancelButton;
	
	private JButton tempButton;
	final URI uri;
	
	private CLogin cLogin;
	private CUser cUser;
		
	public PLoginDialog(ActionHandler actionHandler) throws URISyntaxException{
		  JSplash jSplash = new JSplash(PLoginDialog.class.getResource("mju4.png"),
					true, true, false, "V1", null, Color.RED, Color.black);
			jSplash.splashOn();
			jSplash.setProgress(20, "Init");
			try {
				Thread.sleep(300);		
				jSplash.setProgress(20, "Init");
				Thread.sleep(300);
				jSplash.setProgress(40, "Loading");
				Thread.sleep(300);
				jSplash.setProgress(60, "Applying Configs");
				Thread.sleep(300);
				jSplash.setProgress(80, "Starting Program");
				Thread.sleep(300);
				jSplash.splashOff();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		this.uri =new URI("https://www.mju.ac.kr/sites/mjukr/intro/intro.html");
		// attributes
		this.setBackground(Color.WHITE);
		this.setSize(ELoginDialog.width.getInt(), 
				ELoginDialog.height.getInt());
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		ImageIcon img = new ImageIcon("data/mju4.png");
		this.setIconImage(img.getImage());
		this.setTitle("로그인");
		this.setLayout(new BorderLayout());
		

		// components
		// login Panel
		JPanel LoginPanel = new JPanel();
		JPanel line1 = new JPanel();
			this.userIdLabel = new JLabel(ELoginDialog.nameLabel.getText());
			line1.add(this.userIdLabel);		
			this.UserIdTextField = new JTextField(ELoginDialog.sizeNameText.getInt());
			line1.add(this.UserIdTextField);
		JPanel line2 = new JPanel();
			this.passwordLabel = new JLabel(ELoginDialog.passwordLabel.getText());
			line2.add(this.passwordLabel);		
			this.passwordTextField = new JTextField(ELoginDialog.sizePasswordText.getInt());
			line2.add(this.passwordTextField);
		JPanel line3 = new JPanel();
			this.okButton = new JButton(ELoginDialog.okButtonLabel.getText());
			this.okButton.addActionListener(actionHandler);
			this.okButton.setActionCommand(this.okButton.getText());
			this.okButton.setBackground(SystemColor.textHighlightText);
			this.getRootPane().setDefaultButton(this.okButton);
			line3.add(this.okButton);		
			this.cancelButton = new JButton(ELoginDialog.cancelButtonLabel.getText());
			this.cancelButton.addActionListener(actionHandler);
			this.cancelButton.setActionCommand(this.cancelButton.getText());
			this.cancelButton.setBackground(SystemColor.textHighlightText);
			line3.add(this.cancelButton);
			LoginPanel.add(line1);
			LoginPanel.add(line2);
			LoginPanel.add(line3);
			line1.setBackground(Color.white);
			line2.setBackground(Color.white);
			line3.setBackground(Color.white);
			LoginPanel.setLayout(new GridLayout(3, 2));
			LoginPanel.setBackground(Color.white);
		
	    // line 4, Sing Up	
			JPanel line4 = new JPanel();
			for (ELoginDialog eLoginDialog: ELoginDialog.values()) {
				if(eLoginDialog.ordinal()>=10&&eLoginDialog.ordinal()<=12) {
				this.tempButton = new JButton(eLoginDialog.getText());
				this.tempButton.addActionListener(actionHandler);
				this.tempButton.setActionCommand(eLoginDialog.getText());
				this.tempButton.setToolTipText(eLoginDialog.getText());
				//this.tempButton.setBorderPainted(false);
				this.tempButton.setBackground(SystemColor.textHighlightText);
				line4.add(tempButton);
				}
			}
			line4.setBackground(Color.white);
		
		// line 5, Link , icon
		JPanel line5 = new JPanel();
		line5.setLayout(new BorderLayout());
		ImageIcon img2 = new ImageIcon("data/mari2.png");
		JLabel mjLabel = new JLabel(img2);
		line5.add(mjLabel, BorderLayout.NORTH);
		JButton linkButton = new JButton();
		linkButton.setText("<HTML>명지대학교 링크 <FONT color=\"#000099\"><U>link</U></FONT>"
				+ "</HTML>");
		linkButton.setHorizontalAlignment(SwingConstants.CENTER);
		linkButton.setBorderPainted(false);
		linkButton.setOpaque(false);
		linkButton.setBackground(Color.WHITE);
		linkButton.setToolTipText(uri.toString());
		linkButton.addActionListener(new OpenUrlAction());
		line5.add(linkButton, BorderLayout.CENTER);
		line5.setBackground(Color.white);
		
		this.add(line5, BorderLayout.NORTH);
		this.add(LoginPanel, BorderLayout.CENTER);
		this.add(line4, BorderLayout.SOUTH);
		
	
		
		
		this.cLogin = new CLogin();
		this.cUser = new CUser();
	}
	
	public void initialize() {
	}
	
	public VUser validateUser(String actioncommand) {
		VUser vUser = null;
		if(actioncommand.contentEquals(this.okButton.getText())){
		VLogin vLogin = new VLogin(this.UserIdTextField.getText(), this.passwordTextField.getText());	
		boolean bLoginSuccess = cLogin.validate(vLogin);
		
		if (bLoginSuccess) {
		    vUser = this.cUser.getUser(vLogin.getUserId());			
			if(vUser ==null) {
				// 시스템 에러 - 회원 정보가 존재 하지 않음
				//JOptionPane.showMessageDialog(this, ELoginDialog.noAccountInfo.getText());
				//return null;
			}
			this.UserIdTextField.setText("");
			this.passwordTextField.setText("");
			
		} else {
			//return null;
			//틀렸을때 계속 입력갈 수 있게 하기
			//JOptionPane.showMessageDialog(this, ELoginDialog.loginFailed.getText());
			// CLogin에서 다이얼로그띄움 아이디는 있으나 비밀번호가 틀렸거나, 회원 가입 안됨 혹은 아이디 잘 못 입력
		}
		}
		return vUser;
	
}
	class OpenUrlAction implements ActionListener {
		@Override public void actionPerformed(ActionEvent e) {
			open(uri);
		}
	}
	
	private static void open(URI uri) {
		if (Desktop.isDesktopSupported()) {
			try {
				Desktop.getDesktop().browse(uri);
			} catch (IOException e) { /* TODO: error handling */ }
		} else { /* TODO: error handling */ }
	}
	
	
}
