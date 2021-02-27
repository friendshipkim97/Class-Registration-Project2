package mainFrame;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;

import mainFrame.PSearchPassword.SearchPWActionHandler;
import mainFrame.PToolBar.ListGangjwaSelectionHandler;
import valueObject.VGangjwa;

public class PSearchGangjwaDialog extends JDialog{
	
	private JPanel searchGangjwaPanel;
	private JButton jButton1;
	private JButton jButton2;
	private JButton jButton3;
	private JButton jButton4;
	private Vector<String> vGangjwas;
	private Vector<VGangjwa> vSaveGangjwas;
	
	private JList jList;

	public PSearchGangjwaDialog(ListGangjwaSelectionHandler SearchGangjwaHandler, Vector<VGangjwa> vSearchGangjwas) {
		searchGangjwaPanel = new JPanel();
		vSaveGangjwas = new Vector<VGangjwa>();
		vSaveGangjwas=vSearchGangjwas;
		this.setTitle("°Ë»öÃ¢");
		this.setResizable(false);
		this.setBackground(Color.white);
		this.setLocationRelativeTo(null);
		this.setSize(300, 400);		
	    this.setLayout(new BorderLayout()); 
	    vGangjwas = new Vector<String>();
	    
	    for(VGangjwa vGangjwa : vSearchGangjwas) {
	    	vGangjwas.addElement(vGangjwa.getName());
	    }
	    
	    jList = new JList();
	    jList.setListData(vGangjwas);
	    jList.setSize(10, 10);
	    jList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
	    jList.addListSelectionListener(SearchGangjwaHandler);
		JScrollPane scrollPane3 = new JScrollPane();
		scrollPane3.setViewportView(jList);
		searchGangjwaPanel.add(scrollPane3);
	    
		searchGangjwaPanel.setBackground(Color.white);
		searchGangjwaPanel.setLayout(new FlowLayout());
		this.add(searchGangjwaPanel, BorderLayout.CENTER);
		
		
	}

	public int getIndex() {
		
		return jList.getSelectedIndex();
	}
	
	public VGangjwa getGangjwa() {
		return vSaveGangjwas.get(jList.getSelectedIndex());
	}
}
