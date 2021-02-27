package mainFrame;
import java.awt.event.InputEvent;

import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.KeyStroke;

import constants.Constants;

public class PEditMenu extends JMenu {
	private static final long serialVersionUID = 1L;
	
	public PEditMenu() {
		// set attributes
		this.setText(Constants.EMenuBar.EDIT.getText());
		
		// create and register components	
		for (Constants.EEditMenu eEditMenu: Constants.EEditMenu.values()) {
			JMenuItem menuItem = new JMenuItem(eEditMenu.getText());
			menuItem.setAccelerator(KeyStroke.getKeyStroke 
					(eEditMenu.getKey() ,InputEvent.CTRL_DOWN_MASK));
			this.add(menuItem);
		} 
	}

	public void initialize() {
		// TODO Auto-generated method stub
		
	}
}
