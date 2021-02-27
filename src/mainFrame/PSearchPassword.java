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
		
		this.setTitle("���̵� ã��");
		setBounds(100, 100, 500, 500);
		setFont(new Font("SansSerif", Font.BOLD, 14));
		setForeground(SystemColor.activeCaption);
		this.setLayout(new BorderLayout());
		

		searchPwlabel = new JLabel("��й�ȣ ã��");
		searchPwlabel.setOpaque(true); 
		searchPwlabel.setBackground(Color.white);
		searchPwlabel.setBounds(147, 49, 130, 50);
		searchPwlabel.setFont(new Font("SansSerif", Font.BOLD, 14));
		
		idLabel = new JLabel("���̵�");
		idLabel.setBounds(98, 155, 74, 21);
		idLabel.setForeground(SystemColor.activeCaption);
		idLabel.setBackground(Color.white);
		idTextField = new JTextField();
		idTextField.setBounds(202, 155, 96, 21);
		idTextField.setToolTipText("���̵� �Է�");
		
		nameLabel = new JLabel("�̸�");
		nameLabel.setBounds(98, 200, 74, 21);
		nameLabel.setForeground(SystemColor.activeCaption);
		nameLabel.setBackground(Color.white);
		nameTextField = new JTextField();
		nameTextField.setBounds(202, 200, 96, 21);
		nameTextField.setToolTipText("�̸��Է�");
		hackgwaLabel = new JLabel("�а�");
		hackgwaLabel.setBounds(98, 249, 50, 15);
		hackgwaLabel.setForeground(SystemColor.activeCaption);
		hackgwaTextLabel = new JTextField();
		hackgwaTextLabel.setBounds(202, 246, 96, 21);
		hackgwaTextLabel.setToolTipText("�а��Է�");
		hackgwaTextLabel.setColumns(10);
		numberLabel = new JLabel("�й�");
		numberLabel.setBounds(98, 300, 50, 15);
		numberLabel.setForeground(SystemColor.activeCaption);
		add(numberLabel);
		numberTextField = new JTextField();
		numberTextField.setBounds(202, 300, 96, 21);
		numberTextField.setToolTipText("�й��Է�");
		add(numberTextField);
		numberTextField.setColumns(10);
		searchIdButton = new JButton("��й�ȣ ã��");
		searchIdButton.setBounds(354, 287, 120, 40);
		searchIdButton.setBackground(SystemColor.textHighlightText);
		searchIdButton.setActionCommand("��й�ȣ ã��"); 
		searchIdButton.setToolTipText("��й�ȣ ã��");
		searchIdButton.setBorderPainted(false);
		searchIdButton.addActionListener(searchPwActionHandler);
		outButton = new JButton("������");
		outButton.setBackground(SystemColor.textHighlightText);
		outButton.setBounds(354, 350, 120, 40);
		outButton.setBorderPainted(false);
		outButton.setActionCommand("������");
		outButton.addActionListener(searchPwActionHandler);
		idTextField.registerKeyboardAction(searchPwActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		nameTextField.registerKeyboardAction(searchPwActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		hackgwaTextLabel.registerKeyboardAction(searchPwActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		searchIdButton.registerKeyboardAction(searchPwActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		
		
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
			JOptionPane.showMessageDialog(null, "���� �����Դϴ�.");
		}
		else {
			JOptionPane.showMessageDialog(null, vUser.getName()+ "���� " + "��й�ȣ�� " + vUser.getPassword() + " �Դϴ�.");
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
