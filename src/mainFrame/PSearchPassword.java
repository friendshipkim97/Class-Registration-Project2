package mainFrame;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.KeyStroke;

import constants.Constants.ELoginDialog;
import control.CUser;
import mainFrame.PSearchId.SearchIdActionHandler;
import valueObject.VUser;

public class PSearchPassword extends JDialog {
	
	 //attributes
	private static final long serialVersionUID = 1L;

	// components
	private JLabel searchPwlabel;
	private JLabel idLabel;
	private JTextField idTextField;
	private JLabel nameLabel;
	private JTextField nameTextField;
	private JLabel hackgwaLabel;
	private JTextField hackgwaTextLabel;
	private JLabel numberLabel;
	private JTextField numberTextField;
	private JButton searchIdButton;
	private JButton outButton;
	private JPanel searchPasswordPanel;
	SearchPWActionHandler searchPwActionHandler;
    
	public PSearchPassword() {

		// attribute
		searchPasswordPanel = new JPanel();
		searchPwActionHandler = new SearchPWActionHandler();
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		this.setBackground(Color.white);
		ImageIcon img = new ImageIcon("data/mju.png");
		this.setIconImage(img.getImage());
		
		this.setTitle("아이디 찾기");
		setBounds(100, 100, 500, 500);
		setFont(new Font("SansSerif", Font.BOLD, 14));
		setForeground(SystemColor.activeCaption);
		this.setLayout(new BorderLayout());
		

		searchPwlabel = new JLabel("비밀번호 찾기");
		searchPwlabel.setOpaque(true); 
		searchPwlabel.setBackground(Color.white);
		searchPwlabel.setBounds(147, 49, 130, 50);
		searchPwlabel.setFont(new Font("SansSerif", Font.BOLD, 14));
		
		idLabel = new JLabel("아이디");
		idLabel.setBounds(98, 155, 74, 21);
		idLabel.setForeground(SystemColor.activeCaption);
		idLabel.setBackground(Color.white);
		idTextField = new JTextField();
		idTextField.setBounds(202, 155, 96, 21);
		idTextField.setToolTipText("아이디 입력");
		
		nameLabel = new JLabel("이름");
		nameLabel.setBounds(98, 200, 74, 21);
		nameLabel.setForeground(SystemColor.activeCaption);
		nameLabel.setBackground(Color.white);
		nameTextField = new JTextField();
		nameTextField.setBounds(202, 200, 96, 21);
		nameTextField.setToolTipText("이름입력");
		hackgwaLabel = new JLabel("학과");
		hackgwaLabel.setBounds(98, 249, 50, 15);
		hackgwaLabel.setForeground(SystemColor.activeCaption);
		hackgwaTextLabel = new JTextField();
		hackgwaTextLabel.setBounds(202, 246, 96, 21);
		hackgwaTextLabel.setToolTipText("학과입력");
		hackgwaTextLabel.setColumns(10);
		numberLabel = new JLabel("학번");
		numberLabel.setBounds(98, 300, 50, 15);
		numberLabel.setForeground(SystemColor.activeCaption);
		add(numberLabel);
		numberTextField = new JTextField();
		numberTextField.setBounds(202, 300, 96, 21);
		numberTextField.setToolTipText("학번입력");
		add(numberTextField);
		numberTextField.setColumns(10);
		searchIdButton = new JButton("비밀번호 찾기");
		searchIdButton.setBounds(354, 287, 120, 40);
		searchIdButton.setBackground(SystemColor.textHighlightText);
		searchIdButton.setActionCommand("비밀번호 찾기"); 
		searchIdButton.setToolTipText("비밀번호 찾기");
		searchIdButton.setBorderPainted(false);
		searchIdButton.addActionListener(searchPwActionHandler);
		outButton = new JButton("나가기");
		outButton.setBackground(SystemColor.textHighlightText);
		outButton.setBounds(354, 350, 120, 40);
		outButton.setBorderPainted(false);
		outButton.setActionCommand("나가기");
		outButton.addActionListener(searchPwActionHandler);
		idTextField.registerKeyboardAction(searchPwActionHandler, "비밀번호 찾기", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		nameTextField.registerKeyboardAction(searchPwActionHandler, "비밀번호 찾기", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		hackgwaTextLabel.registerKeyboardAction(searchPwActionHandler, "비밀번호 찾기", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		searchIdButton.registerKeyboardAction(searchPwActionHandler, "비밀번호 찾기", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		
		
		searchPasswordPanel.add(searchPwlabel);
		searchPasswordPanel.add(idLabel);
		searchPasswordPanel.add(idTextField);
		searchPasswordPanel.add(nameLabel);
		searchPasswordPanel.add(nameTextField);
		searchPasswordPanel.add(hackgwaLabel);
		searchPasswordPanel.add(hackgwaTextLabel);
		searchPasswordPanel.add(numberLabel);
		searchPasswordPanel.add(numberTextField);
		searchPasswordPanel.add(searchIdButton);
		searchPasswordPanel.add(searchIdButton);
		searchPasswordPanel.add(outButton);
		
		searchPasswordPanel.setBackground(Color.white);
		searchPasswordPanel.setLayout(null);
		this.add(searchPasswordPanel, BorderLayout.CENTER);

	}
    

	public void initialize() {
		
	}
	
	private void searchPassword() {
		CUser cUser = new CUser();
		VUser vUser = cUser.searchPassword(idTextField.getText(), nameTextField.getText(), hackgwaTextLabel.getText(), numberTextField.getText());
		if(vUser==null) {
			JOptionPane.showMessageDialog(null, "없는 정보입니다.");
		}
		else {
			JOptionPane.showMessageDialog(null, vUser.getName()+ "님의 " + "비밀번호는 " + vUser.getPassword() + " 입니다.");
		}
		
	}
	
	private void closeSearchPassword() {
		this.dispose();
		
	}

	
	public class SearchPWActionHandler implements ActionListener  {
		public void actionPerformed(ActionEvent event) {
			if (event.getActionCommand().equals(searchIdButton.getActionCommand())) {
				searchPassword();
			}
			else if (event.getActionCommand().equals(outButton.getActionCommand())) {
				closeSearchPassword();
			}
		}

	
	}
	
}
