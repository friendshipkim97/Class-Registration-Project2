package sugangSincheong;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import constants.Constants;
import constants.Constants.EConfiguration;
import mainFrame.PFileMenu;
import mainFrame.PTimeTable;
import mainFrame.PMainFrame.ActionHandler;
import valueObject.VGangjwa;
import valueObject.VUser;

public class PContentPanel extends JPanel {
	private static final long serialVersionUID = 1L;

	private PSelection pSelection;
	private PMove pMove1;
	private PResult pMiridamgi;
	private PMove pMove2;
	private PResult pSincheong;
	
	private ListSelectionHandler listSelectionHandler;
	
	int miriOverCheck;
	int sincheongOverCheck;
	
	private VUser vUser;

	public PContentPanel(ActionHandler actionHandler) {
		
		this.listSelectionHandler = new ListSelectionHandler();
		this.setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
		
		
         this.pSelection = new PSelection(listSelectionHandler);
         this.pSelection.setBackground(Color.white);
         this.add(this.pSelection);
         
 
         this.pMove1 = new PMove(actionHandler);
         this.pMove1.setBackground(Color.white);
         this.add(this.pMove1);
         
         this.pMiridamgi = new PResult("미리담기");
         this.pMiridamgi.setBackground(Color.white);
         this.add(pMiridamgi);
         
         this.pMove2 = new PMove(actionHandler);
         this.pMove2.setBackground(Color.white);
         this.add(this.pMove2);
         
         this.pSincheong = new PResult("수강신청");
         this.pSincheong.setBackground(Color.white);
         this.add(pSincheong);
         
	}

	public void initialize(VUser vUser) {	
		this.vUser = vUser;
		
		this.pMove1.initialize();
		this.pMove2.initialize();
		
		this.pMiridamgi.initialize(vUser.getUserId()+EConfiguration.miridmagiFilePostfix.getText());
		this.pSincheong.initialize(vUser.getUserId()+EConfiguration.sincheongFilePostfix.getText());
		
		this.pSelection.initialize(this.pMiridamgi, this.pSincheong);
		
	}
	

	public void save() {
		this.pMiridamgi.save(vUser.getUserId()+EConfiguration.miridmagiFilePostfix.getText());
		this.pSincheong.save(vUser.getUserId()+EConfiguration.sincheongFilePostfix.getText());
	}

	/////////////////////////////////////////////////////////////////
	// Table event handling 
	/////////////////////////////////////////////////////////////////
	
	private void updateGangjwas(Object source) { //직접들어가서비교
		this.pSelection.updateGangjwas(source);
	}


	public class ListSelectionHandler implements ListSelectionListener{
		@Override
		public void valueChanged(ListSelectionEvent event) {
			updateGangjwas(event.getSource());

		}
	}
	
	/////////////////////////////////////////////////////////////////
	// button event handling 
    /////////////////////////////////////////////////////////////////
	private void moveGangjwas(PGangjwaContainer source, PGangjwaContainer target) {
		
		if(timeOverCheck(source, target)!=false && creditOverCheck(source, target)!=false) {
		Vector<VGangjwa> vSelectedGangjwas = source.removeSelectedGangjwas();			
		target.addGangjwas(vSelectedGangjwas);
		}
	}
	
	
	private boolean timeOverCheck(PGangjwaContainer source, PGangjwaContainer target) {
		if(target==this.pMiridamgi) {
			Vector<VGangjwa> tempVGangjwas = new Vector<VGangjwa>();
			for(VGangjwa vGangjwa : target.getGangjwas()) {
				tempVGangjwas.add(vGangjwa);
			}
			for(VGangjwa vGangjwa : source.selectedGangjwas()) {
				tempVGangjwas.add(vGangjwa);
			}
			for(VGangjwa vGangjwa : tempVGangjwas) {
				System.out.println(vGangjwa.getName());
			}
			
			PTimeTable pTimeTable = new PTimeTable(tempVGangjwas, 
					Constants.EToolBar.Miridamgi.getText());
			pTimeTable.checkDupicated();
			if(pTimeTable.matrixDuplicatedCheck()==false) {
				JOptionPane.showMessageDialog(null, "시간이 중복입니다. \n ");
				return false;
			}
			
		}
		else if(target==this.pSincheong) {
			Vector<VGangjwa> tempVGangjwas = new Vector<VGangjwa>();
			for(VGangjwa vGangjwa : target.getGangjwas()) {
				tempVGangjwas.add(vGangjwa);
			}
			for(VGangjwa vGangjwa : source.selectedGangjwas()) {
				tempVGangjwas.add(vGangjwa);
			}
			for(VGangjwa vGangjwa : tempVGangjwas) {
				System.out.println(vGangjwa.getName());
			}
			
			PTimeTable pTimeTable = new PTimeTable(tempVGangjwas, 
					Constants.EToolBar.Sugangsincheong.getText());
			pTimeTable.checkDupicated();
			if(pTimeTable.matrixDuplicatedCheck()==false) {
				JOptionPane.showMessageDialog(null, "시간이 중복입니다. \n ");
				return false;
			}
			
		}
		return true;
	}

	private boolean creditOverCheck(PGangjwaContainer source, PGangjwaContainer target) {

		if(target==this.pSincheong) {
			sincheongOverCheck = 0;
			for(VGangjwa vGangjwa : target.getGangjwas()) {
				sincheongOverCheck += Integer.parseInt(vGangjwa.getCredit());
			}
			for(VGangjwa vGangjwa : source.selectedGangjwas()) {
				Integer.parseInt(vGangjwa.getCredit());
				if((sincheongOverCheck += Integer.parseInt(vGangjwa.getCredit()))>18) {
					sincheongOverCheck -= Integer.parseInt(vGangjwa.getCredit());
					JOptionPane.showMessageDialog(null, "수강신청 18학점 초과입니다. \n ");
					return false;
				}
			}
			return true;
			
		}
		else if(target==this.pMiridamgi) {
			miriOverCheck = 0;
			for(VGangjwa vGangjwa : target.getGangjwas()) {
				miriOverCheck += Integer.parseInt(vGangjwa.getCredit());
			}
			for(VGangjwa vGangjwa : source.selectedGangjwas()) {
				Integer.parseInt(vGangjwa.getCredit());
				if((miriOverCheck += Integer.parseInt(vGangjwa.getCredit()))>22) {
					miriOverCheck -= Integer.parseInt(vGangjwa.getCredit());
					JOptionPane.showMessageDialog(null, "미리담기 22학점 초과입니다. \n ");
					return false;
				}
			}
			return true;
			
		}
		else
			return true;
		
	}

	public void moveGangjwas(Object source) {
		if(source.equals(this.pMove1.getMoveRightButton())) {
			
			this.moveGangjwas(this.pSelection, this.pMiridamgi);
			
		} else if(source.equals(this.pMove1.getMoveLeftButton())) {
			this.moveGangjwas(this.pMiridamgi, this.pSelection);			
		}
		else if(source.equals(this.pMove2.getMoveRightButton())) {
			this.moveGangjwas(this.pMiridamgi, this.pSincheong);
			
		}
		else if(source.equals(this.pMove2.getMoveLeftButton())) {
			this.moveGangjwas(this.pSincheong, this.pMiridamgi);
			
		}
	
			
		}
//	public class ActionHandler implements ActionListener{
//
//		@Override
//		public void actionPerformed(ActionEvent event) {
//			moveGangjwas(event.getSource());
//			
//		}
//		
//	}
	
	public PResult getPMiridamgi() {
		return this.pMiridamgi;
	}
	
	public PResult getPSincheong() {
		return this.pSincheong;
	}

	
		
  }



