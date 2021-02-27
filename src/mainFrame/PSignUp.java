package mainFrame;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.KeyStroke;

import control.CLogin;
import control.CUser;
import valueObject.VLogin;
import valueObject.VUser;

public class PSignUp extends JDialog {

	 //attributes
		private static final long serialVersionUID = 1L;

		// components
		private JLabel signUplabel;
		private JLabel idLabel;
		private JTextField idTextField;
		private JLabel passwordLabel;
		private JTextField passwordTextField;
		private JLabel passwordLabel2;
		private JTextField passwordTextField2;
		private JLabel nameLabel;
		private JTextField nameTextField;
		private JLabel hackgwaLabel;
		private JTextField hackgwaTextLabel;
		private JLabel numberLabel;
		private JTextField numberTextField;
		private JButton singUpButton;
		private JCheckBox checkBox;
		private int checkBoxState;
		private JButton clearButton;
		
		private JButton outButton;
		private JPanel singUpPanel;
		JTextField agree;
		SingUpActionHandler singUpActionHandler;
		ItemHandler itemHandler;
		InitHandler initHandler;
	
	public PSignUp() {
		// attribute
		singUpPanel = new JPanel();
	    singUpActionHandler = new SingUpActionHandler();
	    itemHandler = new ItemHandler();
	    initHandler = new InitHandler();
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		this.setBackground(Color.white);
		ImageIcon img = new ImageIcon("data/mju.png");
		this.setIconImage(img.getImage());
		
		this.setTitle("ȸ�� ����");
		setBounds(100, 100, 500, 500);
		setFont(new Font("SansSerif", Font.BOLD, 14));
		setForeground(SystemColor.activeCaption);
		this.setLayout(new BorderLayout());
		

		signUplabel = new JLabel("ȸ������");
		signUplabel.setOpaque(true); 
		signUplabel.setBackground(Color.white);
		signUplabel.setBounds(202, 20, 70, 50);
		signUplabel.setFont(new Font("SansSerif", Font.BOLD, 14));
		idLabel = new JLabel("���̵�");
		idLabel.setBounds(98, 67, 74, 30);
		idLabel.setForeground(SystemColor.activeCaption);
		idLabel.setBackground(Color.white);
		idTextField = new JTextField();
		idTextField.setBounds(202, 72, 96, 21);
		idTextField.setToolTipText("���̵� �Է�");
		passwordLabel = new JLabel("��й�ȣ");
		passwordLabel.setBounds(98, 130, 63, 15);
		passwordLabel.setForeground(SystemColor.activeCaption);
		passwordLabel.setBackground(Color.white);
		passwordTextField = new JTextField();
		passwordTextField.setBounds(202, 127, 96, 21);
		passwordTextField.setToolTipText("��й�ȣ �Է�");
		passwordLabel2 = new JLabel("��й�ȣ Ȯ��");
		passwordLabel2.setBounds(98, 179, 92, 15);
		passwordLabel2.setForeground(SystemColor.activeCaption);
		passwordLabel2.setBackground(Color.white);
		passwordTextField2 = new JTextField();
		passwordTextField2.setBounds(202, 176, 96, 21);
		passwordTextField2.setToolTipText("��й�ȣ �Է� Ȯ��");
		nameLabel = new JLabel("�̸�");
		nameLabel.setBounds(98, 260, 74, 21);
		nameLabel.setForeground(SystemColor.activeCaption);
		nameLabel.setBackground(Color.white);
		nameTextField = new JTextField();
		nameTextField.setBounds(202, 260, 96, 21);
		nameTextField.setToolTipText("�̸��Է�");
		hackgwaLabel = new JLabel("�а�");
		hackgwaLabel.setBounds(98, 304, 50, 15);
		hackgwaLabel.setForeground(SystemColor.activeCaption);
		hackgwaTextLabel = new JTextField();
		hackgwaTextLabel.setBounds(202, 301, 96, 21);
		hackgwaTextLabel.setToolTipText("�а��Է�");
		hackgwaTextLabel.setColumns(10);
		numberLabel = new JLabel("�й�");
		numberLabel.setBounds(98, 223, 50, 15);
		numberLabel.setForeground(SystemColor.activeCaption);
		add(numberLabel);
		numberTextField = new JTextField();
		numberTextField.setBounds(202, 220, 96, 21);
		numberTextField.setToolTipText("�й��Է�");
		add(numberTextField);
		numberTextField.setColumns(10);
		
	    agree = new JTextField();
		agree.setText("����� �����Ͻʴϱ�?");
		agree.setToolTipText("�������");
		agree.setBounds(332, 222, 150, 30);
		agree.setFont(new Font("�ü�", Font.BOLD, 14));
		agree.setForeground(SystemColor.activeCaption);
		agree.setColumns(10);

		checkBox = new JCheckBox("�������");
		checkBox.setBounds(333, 259, 133, 23);
		checkBox.addItemListener(itemHandler);

	    clearButton = new JButton("���ΰ�ħ");
		clearButton.setBounds(332, 170, 134, 23);
		clearButton.setBackground(SystemColor.textHighlightText);
		clearButton.setToolTipText("���ΰ�ħ");
		clearButton.setBorderPainted(false);
		clearButton.addActionListener(initHandler);

		singUpButton = new JButton("ȸ������");
		singUpButton.setBounds(332, 300, 134, 23);
		singUpButton.setBackground(SystemColor.textHighlightText);
		singUpButton.setActionCommand("ȸ������"); 
		singUpButton.setToolTipText("ȸ������");
		singUpButton.setBorderPainted(false);
		singUpButton.addActionListener(singUpActionHandler);
		outButton = new JButton("������");
		outButton.setBackground(SystemColor.textHighlightText);
		outButton.setBounds(332, 350, 134, 23);
		outButton.setBorderPainted(false);
		outButton.setActionCommand("������");
		outButton.addActionListener(singUpActionHandler);
		
		idTextField.registerKeyboardAction(singUpActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		passwordTextField.registerKeyboardAction(singUpActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		passwordTextField2.registerKeyboardAction(singUpActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		nameTextField.registerKeyboardAction(singUpActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		hackgwaTextLabel.registerKeyboardAction(singUpActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		numberTextField.registerKeyboardAction(singUpActionHandler, "��й�ȣ ã��", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER,0), JComponent.WHEN_FOCUSED);
		
		
		singUpPanel.add(signUplabel);
		singUpPanel.add(idLabel);
		singUpPanel.add(idTextField);
		singUpPanel.add(passwordLabel);
		singUpPanel.add(passwordTextField);
		singUpPanel.add(passwordLabel2);
		singUpPanel.add(passwordTextField2);
		singUpPanel.add(nameLabel);
		singUpPanel.add(nameTextField);
		singUpPanel.add(hackgwaLabel);
		singUpPanel.add(hackgwaTextLabel);
		singUpPanel.add(numberLabel);
		singUpPanel.add(numberTextField);
		singUpPanel.add(singUpButton);
		singUpPanel.add(clearButton);
		singUpPanel.add(agree);
		singUpPanel.add(checkBox);
		singUpPanel.add(outButton);
		
		singUpPanel.setBackground(Color.white);
		singUpPanel.setLayout(null);
		this.add(singUpPanel, BorderLayout.CENTER);

	}
    

	public void initialize() {
		
	}
	
	private void singUp() {
		CUser cUser = new CUser();
		VUser vUser = cUser.searchPassword(idTextField.getText(), nameTextField.getText(), hackgwaTextLabel.getText(), numberTextField.getText());
		if(vUser==null) {
			JOptionPane.showMessageDialog(null, "���� �����Դϴ�.");
		}
		else {
			JOptionPane.showMessageDialog(null, vUser.getName()+ "���� " + "��й�ȣ�� " + vUser.getPassword() + " �Դϴ�.");
		}
		
	}
	
	private void closeSingUp() {
		this.dispose();
		
	}

	
	public class SingUpActionHandler implements ActionListener  {

		@Override
		public void actionPerformed(ActionEvent e) {
			if(e.getActionCommand().equals(singUpButton.getActionCommand())) {
			CLogin cLogin = new CLogin();
			VLogin vLogin = new VLogin(idTextField.getText(), passwordTextField.getText());	
			boolean bLoginSuccess = cLogin.validateSignUp(vLogin);

			if(passwordTextField.getText().equals("")&&bLoginSuccess==false) {
				JOptionPane.showMessageDialog(null, "��й�ȣ�� �Է��ϼ���.");
			}
			else if(bLoginSuccess==false){
				if(passwordTextField.getText().length()<10 || passwordTextField2.getText().length()<10) {
					JOptionPane.showMessageDialog(null, "��й�ȣ�� 10�ڸ� �̻����� �Է��ϼ���.");
				}
				else {
					if (passwordTextField.getText().equals(passwordTextField2.getText())) {
				
						if(nameTextField.getText().equals("")||hackgwaTextLabel.getText().equals("")||numberTextField.getText().equals("")) {
							JOptionPane.showMessageDialog(null, "��� ���� �Է��ϼ���.");
						}
						else if (checkBoxState == 0){
							JOptionPane.showMessageDialog(null, "üũ�ڽ��� ���õ��� �ʾҽ��ϴ�.");
						}
						
						else if (checkBoxState == 1) {

							CUser cUser = new CUser();
							cUser.signUp(idTextField.getText(), passwordTextField.getText(), nameTextField.getText(),
									numberTextField.getText(), hackgwaTextLabel.getText());
							VUser vUser = new VUser(idTextField.getText(), passwordTextField.getText(), nameTextField.getText(),
									numberTextField.getText(), hackgwaTextLabel.getText());

						} 
						
					}
					else if(!passwordTextField.getText().equals(passwordTextField2.getText())){
						JOptionPane.showMessageDialog(null, "��й�ȣ�� Ʋ���ϴ�.");
					}
					else {
						JOptionPane.showMessageDialog(null, "��簪�� �Է��ϼ���.");
					}
					
					
				}
			}
		}
		else if(e.getActionCommand().equals(outButton.getActionCommand())) {
			closeSingUp();
		}
	}
			}

	
	public class ItemHandler implements ItemListener{
		public void itemStateChanged(ItemEvent e) {
			checkBoxState = e.getStateChange();
		}
	}
	
	public class InitHandler implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			idTextField.setText("");
			passwordTextField.setText("");
			passwordTextField2.setText("");
			nameTextField.setText("");
			hackgwaTextLabel.setText("");
			numberTextField.setText("");
			checkBox.setSelected(false);
	}
	}
}
