package mainFrame;
import java.awt.Image;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JToolBar;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import constants.Constants;
import constants.Constants.EToolBar;
import control.CDirectory;
import control.CGangjwa;
import control.CUser;
import valueObject.VGangjwa;
import valueObject.VUser;

public class PToolBar extends JToolBar {
	private static final long serialVersionUID = 1L;
	private VUser vUser;
	private ActionHandler actionHandler;
	private Vector<VGangjwa> vSearchGangjwas;
	private boolean search;
	private String searchHackgwa;
	private String searchCollege;
	private String searchCampus;
	private PMainFrame pMainFrame;
	private PSearchGangjwaDialog pSearchGangjwaDialog;
	private JPanel searchGangjwaPanel;
	private ListGangjwaSelectionHandler searchGangjwaHandler;
	private boolean gangjwaClick;
	private PLoginDialog pLoginDialog;
	
	public PToolBar() {
		this.pMainFrame=pMainFrame;
		actionHandler = new ActionHandler();
		for (EToolBar eTool: EToolBar.values()) {
			ImageIcon originIcon = new ImageIcon(eTool.getPath());  
			Image originImg = originIcon.getImage(); 
			Image changedImg= originImg.getScaledInstance(25, 25, Image.SCALE_SMOOTH );
			ImageIcon Icon = new ImageIcon(changedImg);
			JButton button = new JButton(Icon);
			button.setToolTipText(eTool.getText());
			button.setBorderPainted(false);
			button.addActionListener(actionHandler);
			button.setActionCommand(eTool.getText());
			button.setBackground(SystemColor.textHighlightText);
		    this.add(button);
	}
		
		
	}

	public void initialize(VUser vUser, PMainFrame pMainFrame, PLoginDialog pLoginDialog) {
		this.vUser = vUser;
		this.pMainFrame=pMainFrame;
		this.pLoginDialog=pLoginDialog;
	}
	
	public class ActionHandler implements ActionListener {

		public void actionPerformed(ActionEvent event) {

			if (event.getActionCommand().equals(Constants.EToolBar.PersonalInfo.getText())) {
				
				JOptionPane.showMessageDialog(null, "ȸ�� ���̵�:"+vUser.getUserId()+"\n"+
						"ȸ�� ��й�ȣ:"+vUser.getPassword()+"\n"+
						"ȸ�� �̸�:"+vUser.getName()+"\n"+
						"ȸ�� �й�:"+vUser.getNumber()+"\n"+
						"ȸ�� �а�:"+vUser.getHackjwa()+"\n", "����������ȸ", JOptionPane.INFORMATION_MESSAGE
						);
			}
			
			else if(event.getActionCommand().equals(Constants.EToolBar.Search.getText())) {
				pMainFrame.setVisible(true);
				String input = JOptionPane.showInputDialog(null, "���� ���� �Է��ϼ���", "���¸� �˻�", JOptionPane.INFORMATION_MESSAGE);
				if((input==null)) {
					JOptionPane.showMessageDialog(null, "�Է��� ���ϼ̽��ϴ�.");
				}
				else if((input.length()<2)){
					JOptionPane.showMessageDialog(null, "2���� �̻����� �Է����ּ���.");
				}
				else {
					CGangjwa cGangjwa = new CGangjwa();
					vSearchGangjwas = cGangjwa.searchGangjwa(input);
					
					searchGangjwaHandler = new ListGangjwaSelectionHandler();
					pSearchGangjwaDialog = new PSearchGangjwaDialog(searchGangjwaHandler, vSearchGangjwas);
					pSearchGangjwaDialog.setVisible(true);
				
				}
			}
			
			
			else if(event.getActionCommand().equals(Constants.EToolBar.ChangePassword.getText())) {
				pMainFrame.setVisible(true);
				String input = JOptionPane.showInputDialog(null, "���� ��й�ȣ �Է�", "��й�ȣ ����", JOptionPane.INFORMATION_MESSAGE);
				System.out.println("��й�ȣȮ��");
				if(vUser.getPassword().equals(input)) {
					String input2 = JOptionPane.showInputDialog(null, "�ٲ� ��й�ȣ �Է�");
					CUser cUser = new CUser();
					cUser.changePassword(vUser.getUserId(), input2);
					vUser.setPassword(input2);
				}
				else {
					JOptionPane.showMessageDialog(null, "���� ��й�ȣ�� Ʋ���ų� ����ϼ̽��ϴ�. \n ");
				}
				
			}
			else if(event.getActionCommand().equals(Constants.EToolBar.Logout.getText())) {
				pMainFrame.setVisible(false);

		     }
			else if(event.getActionCommand().equals(Constants.EToolBar.Miridamgi.getText())) {
				PTimeTable pTimeTable = new PTimeTable(pMainFrame.getPMainPanel().getPContentPanel().getPMiridamgi().getGangjwas(), 
						Constants.EToolBar.Miridamgi.getText());
				pMainFrame.setVisible(true);
				pTimeTable.setVisible(true);
		     }
			else if(event.getActionCommand().equals(Constants.EToolBar.Sugangsincheong.getText())) {
				PTimeTable pTimeTable = new PTimeTable(pMainFrame.getPMainPanel().getPContentPanel().getPSincheong().getGangjwas(), 
						Constants.EToolBar.Sugangsincheong.getText());
				pMainFrame.setVisible(true);
				pTimeTable.setVisible(true);
		     }
			
			else if(event.getActionCommand().equals(Constants.EToolBar.Creater.getText())) {
				JOptionPane.showMessageDialog(null, "������û ���α׷� ���� ��\n " +
						"�̸� : ������ \n" +
						"�а�: �������Ʈ�����а� \n" +
						"�й�: 60191902 \n", "������", JOptionPane.INFORMATION_MESSAGE
						);
		     }

	}
	}
	
	public class ListGangjwaSelectionHandler implements ListSelectionListener{
		@Override
		public void valueChanged(ListSelectionEvent event) {
			
			
			if(!(pSearchGangjwaDialog.getIndex()==-1)) {
			
			searchHackgwa=pSearchGangjwaDialog.getGangjwa().getHackgwa();
			CDirectory cDirectory = new CDirectory();
			searchCollege = cDirectory.searchCollege(searchHackgwa).getCollege();
			searchCampus = cDirectory.searchCampus(searchCollege).getCampus();
			search=true;
			JOptionPane.showMessageDialog(null, "ã�ҽ��ϴ�. \n "+
					"ķ�۽� : " + searchCampus+"\n"+
					"���� : " + searchCollege+"\n"+
			        "�а� : " + searchHackgwa+"\n"+
					"���� ��ȣ: "+pSearchGangjwaDialog.getGangjwa().getId()+"\n"+
					"���� ��: "+pSearchGangjwaDialog.getGangjwa().getName()+"\n"+
					"���� ����: "+pSearchGangjwaDialog.getGangjwa().getLecturer()+"\n"+
					"���� ����: "+pSearchGangjwaDialog.getGangjwa().getCredit()+"\n"+
					"���� �ð�: "+pSearchGangjwaDialog.getGangjwa().getTime()+"\n"
					);
			
		}
		}
	}
	
	
}
		



