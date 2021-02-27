package sugangSincheong;
import java.awt.BorderLayout;

import javax.swing.JPanel;

import mainFrame.PMainFrame.ActionHandler;
import valueObject.VUser;

public class PSugangSincheongPanel extends JPanel {
	private static final long serialVersionUID = 1L;

	private PHeaderPanel pHeaderPanel;
	private PContentPanel pContentPanel;
	private PFooterPanel pFooterPanel;
	
	
	public PSugangSincheongPanel(ActionHandler actionHandler) {
		
		this.setLayout(new BorderLayout());
		
		this.pHeaderPanel = new PHeaderPanel();
		this.add(this.pHeaderPanel, BorderLayout.NORTH);
		
		this.pContentPanel = new PContentPanel(actionHandler);
		this.add(this.pContentPanel, BorderLayout.CENTER);
		
		this.pFooterPanel = new PFooterPanel();
		this.add(this.pFooterPanel, BorderLayout.SOUTH);
	}

	public void initialize(VUser vUser) {
		this.pContentPanel.initialize(vUser);
		this.pHeaderPanel.initialize(vUser);
		this.pFooterPanel.initialize();
	}

	public void save() {
		this.pContentPanel.save();
		
	}
	
	public PContentPanel getPContentPanel() {
		return this.pContentPanel;
	}
	
	public PHeaderPanel getPHeaderPanel() {
		return this.pHeaderPanel;
	}
	
}