package mainFrame;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

import javax.swing.ImageIcon;
import javax.swing.JFrame;

import constants.Constants;
import sugangSincheong.PSugangSincheongPanel;
import valueObject.VUser;

public class PMainFrame extends JFrame {
	private static final long serialVersionUID = 1L;

	private WindowListener windowListener;
	private PMenuBar pMenuBar;
	private PToolBar pToolBar;
	private PSugangSincheongPanel pMainPanel;
	private ActionHandler actionHandler;

	private PLoginDialog pLoginDialog;
	
	// constructor
	public PMainFrame() {
		// set attributes
		this.setTitle("수강신청");
		this.setSize(
				Constants.EMainFrame.width.getInt(), 
				Constants.EMainFrame.height.getInt()
				);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		ImageIcon img = new ImageIcon("data/mju4.png");
		this.setIconImage(img.getImage());
		
		this.actionHandler = new ActionHandler();
		this.windowListener = new WindowHandler();
		this.addWindowListener(windowListener);
		this.setLayout(new BorderLayout());
		
		// create and register components
		this.pMenuBar = new PMenuBar(this);
		this.setJMenuBar(this.pMenuBar);
		
		this.pToolBar = new PToolBar();
		this.add(this.pToolBar, BorderLayout.NORTH);
		
		this.pMainPanel = new PSugangSincheongPanel(this.actionHandler);
		this.add(this.pMainPanel, BorderLayout.CENTER);	

	}
	
	public void initialize(VUser vUser, PLoginDialog pLoginDialog) {
		this.pMenuBar.initialize();
		this.pToolBar.initialize(vUser, this, this.pLoginDialog);
		this.pMainPanel.initialize(vUser);
		this.pLoginDialog = pLoginDialog;
	}
	
	private void save() {
		this.pMainPanel.save();
	}
	
	public class ActionHandler implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent event) {
		
			pMainPanel.getPContentPanel().moveGangjwas(event.getSource());
			pMainPanel.getPHeaderPanel().setWelcomeText(pMainPanel.getPContentPanel().getPMiridamgi().getGangjwas(), 
					pMainPanel.getPContentPanel().getPSincheong().getGangjwas());

		}
		
	}
	
	public PSugangSincheongPanel getPMainPanel() {
		return this.pMainPanel;
	}
	
	private class WindowHandler implements WindowListener{

		@Override
		public void windowOpened(WindowEvent e) {}
		@Override
		public void windowClosing(WindowEvent e) {
			save();
		}
		@Override
		public void windowClosed(WindowEvent e) {}
		@Override
		public void windowIconified(WindowEvent e) {}
		@Override
		public void windowDeiconified(WindowEvent e) {}
		@Override
		public void windowActivated(WindowEvent e) {}
		@Override
		public void windowDeactivated(WindowEvent e) {}
		
	}
}
