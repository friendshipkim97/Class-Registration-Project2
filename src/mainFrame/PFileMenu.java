package mainFrame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.InputEvent;

import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.KeyStroke;

import constants.Constants;

public class PFileMenu extends JMenu {
	private static final long serialVersionUID = 1L;
	private PMainFrame pMainFrame;
	private ActionHandler actionHandler;
	
	public PFileMenu(PMainFrame pMainFrame) {
		
	    this.pMainFrame = pMainFrame;
	    ActionHandler actionHandler = new ActionHandler();
		// set attributes
		this.setText(Constants.EMenuBar.FILE.getText());
		
		// create and register components
		for (Constants.EFileMenu eFileMenu: Constants.EFileMenu.values()) {
			JMenuItem menuItem = new JMenuItem(eFileMenu.getText());
			menuItem.setAccelerator(KeyStroke.getKeyStroke 
					(eFileMenu.getKey(),InputEvent.CTRL_DOWN_MASK));
			menuItem.setActionCommand(eFileMenu.getText());
			menuItem.addActionListener(actionHandler);
			this.add(menuItem);
		}
	}

	public void initialize() {
		
		
	}
	

	public class ActionHandler implements ActionListener {

		public void actionPerformed(ActionEvent event) {

			if (event.getActionCommand().equals(Constants.EFileMenu.EXIT.getText())) {
				
				pMainFrame.setVisible(false);
			}
		}
	}
}
