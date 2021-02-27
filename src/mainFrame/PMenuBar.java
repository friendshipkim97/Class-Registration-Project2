package mainFrame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JMenuBar;
import javax.swing.JOptionPane;

import constants.Constants;

public class PMenuBar extends JMenuBar {
	private static final long serialVersionUID = 1L;

	private PFileMenu pFileMenu;
	private PEditMenu pEditMenu;
	
	public PMenuBar(PMainFrame pMainFrame) {
		// create and register components
		this.pFileMenu = new PFileMenu(pMainFrame);
		this.pFileMenu.setMnemonic('F');
		this.pFileMenu.addSeparator();
		this.add(pFileMenu);
		
		this.pEditMenu = new PEditMenu();
		this.pEditMenu.setMnemonic('E');
		this.pEditMenu.addSeparator();
		this.add(pEditMenu);
	}

	public void initialize() {
		this.pFileMenu.initialize();
		this.pEditMenu.initialize();
		
	}


}
