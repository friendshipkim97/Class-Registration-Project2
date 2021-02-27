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
				
				JOptionPane.showMessageDialog(null, "회원 아이디:"+vUser.getUserId()+"\n"+
						"회원 비밀번호:"+vUser.getPassword()+"\n"+
						"회원 이름:"+vUser.getName()+"\n"+
						"회원 학번:"+vUser.getNumber()+"\n"+
						"회원 학과:"+vUser.getHackjwa()+"\n", "개인정보조회", JOptionPane.INFORMATION_MESSAGE
						);
			}
			
			else if(event.getActionCommand().equals(Constants.EToolBar.Search.getText())) {
				pMainFrame.setVisible(true);
				String input = JOptionPane.showInputDialog(null, "강좌 명을 입력하세요", "강좌명 검색", JOptionPane.INFORMATION_MESSAGE);
				if((input==null)) {
					JOptionPane.showMessageDialog(null, "입력을 안하셨습니다.");
				}
				else if((input.length()<2)){
					JOptionPane.showMessageDialog(null, "2글자 이상으로 입력해주세요.");
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
				String input = JOptionPane.showInputDialog(null, "현재 비밀번호 입력", "비밀번호 변경", JOptionPane.INFORMATION_MESSAGE);
				System.out.println("비밀번호확인");
				if(vUser.getPassword().equals(input)) {
					String input2 = JOptionPane.showInputDialog(null, "바꿀 비밀번호 입력");
					CUser cUser = new CUser();
					cUser.changePassword(vUser.getUserId(), input2);
					vUser.setPassword(input2);
				}
				else {
					JOptionPane.showMessageDialog(null, "현재 비밀번호가 틀리거나 취소하셨습니다. \n ");
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
				JOptionPane.showMessageDialog(null, "수강신청 프로그램 만든 이\n " +
						"이름 : 김정우 \n" +
						"학과: 응용소프트웨어학과 \n" +
						"학번: 60191902 \n", "만든이", JOptionPane.INFORMATION_MESSAGE
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
			JOptionPane.showMessageDialog(null, "찾았습니다. \n "+
					"캠퍼스 : " + searchCampus+"\n"+
					"대학 : " + searchCollege+"\n"+
			        "학과 : " + searchHackgwa+"\n"+
					"강좌 번호: "+pSearchGangjwaDialog.getGangjwa().getId()+"\n"+
					"강좌 명: "+pSearchGangjwaDialog.getGangjwa().getName()+"\n"+
					"강좌 교수: "+pSearchGangjwaDialog.getGangjwa().getLecturer()+"\n"+
					"강좌 학점: "+pSearchGangjwaDialog.getGangjwa().getCredit()+"\n"+
					"강좌 시간: "+pSearchGangjwaDialog.getGangjwa().getTime()+"\n"
					);
			
		}
		}
	}
	
	
}
		



