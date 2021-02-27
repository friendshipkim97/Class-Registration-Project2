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

import control.CUser;
import valueObject.VUser;

public class PSearchId extends JDialog {
	
	   //attributes
		private static final long serialVersionUID = 1L;

		// components
		private JLabel searchIdlabel;
		private JLabel nameLabel;
		private JTextField nameTextField;
		private JLabel hackgwaLabel;
		private JTextField hackgwaTextLabel;
		private JLabel numberLabel;
		private JTextField numberTextField;
		private JButton searchIdButton;
		private JButton outButton;
		private JPanel searchIdPanel;
        SearchIdActionHandler searchIdActionHandler;

	public PSearchId() {
	
		// attribute
	    searchIdPanel = new JPanel();
		searchIdActionHandler = new SearchIdActionHandler();
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
		

		searchIdlabel = new JLabel("아이디 찾기");
		searchIdlabel.setOpaque(true); 
		searchIdlabel.setBackground(Color.white);
		searchIdlabel.setBounds(147, 49, 130, 50);
		searchIdlabel.setFont(new Font("SansSerif", Font.BOLD, 14));
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
		searchIdButton = new JButton("아이디 찾기");
		searchIdButton.setBounds(354, 287, 100, 40);
		searchIdButton.setBackground(SystemColor.textHighlightText);
		searchIdButton.setActionCommand("아이디 찾기"); 
		searchIdButton.setToolTipText("아이디 찾기");
		searchIdButton.setBorderPainted(false);
		searchIdButton.addActionListener(searchIdActionHandler);
		outButton = new JButton("나가기");
		outButton.setBackground(SystemColor.textHighlightText);
		outButton.setBounds(354, 350, 100, 40);
		outButton.setBorderPainted(false);
		outButton.setActionCommand("나가기");
		outButton.addActionListener(searchIdActionHandler);
		nameTextField.registerKeyboardAction(searchIdActionHandler, "아이디 찾기", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		hackgwaTextLabel.registerKeyboardAction(searchIdActionHandler, "아이디 찾기", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		searchIdButton.registerKeyboardAction(searchIdActionHandler, "아이디 찾기", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		
		
		searchIdPanel.add(searchIdlabel);
		searchIdPanel.add(nameLabel);
		searchIdPanel.add(nameTextField);
		searchIdPanel.add(hackgwaLabel);
		searchIdPanel.add(hackgwaTextLabel);
		searchIdPanel.add(numberLabel);
		searchIdPanel.add(numberTextField);
		searchIdPanel.add(searchIdButton);
		searchIdPanel.add(searchIdButton);
		searchIdPanel.add(outButton);
		
		searchIdPanel.setBackground(Color.white);
		searchIdPanel.setLayout(null);
		this.add(searchIdPanel, BorderLayout.CENTER);

	}
    

	public void initialize() {
		
	}
	
	private void searchId() {
		CUser cUser = new CUser();
		VUser vUser = cUser.searchId(nameTextField.getText(), hackgwaTextLabel.getText(), numberTextField.getText());
		if(vUser==null) {
			JOptionPane.showMessageDialog(null, "해당하는 아이디가 없습니다.");
		}
		else {
			JOptionPane.showMessageDialog(null, vUser.getName()+ "님의" + "아이디는 " + vUser.getUserId() + " 입니다.");
		}
		
	}
	
	private void closeSearchId() {
		this.dispose();
		
	}

	
	public class SearchIdActionHandler implements ActionListener  {
		public void actionPerformed(ActionEvent event) {
			if (event.getActionCommand().equals(searchIdButton.getActionCommand())) {
				searchId();
			}
			else if (event.getActionCommand().equals(outButton.getActionCommand())) {
				closeSearchId();
			}
		}

	
	};
}
