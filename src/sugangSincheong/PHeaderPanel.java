package sugangSincheong;
import java.util.Vector;

import javax.swing.JLabel;
import javax.swing.JPanel;

import control.CResult;
import valueObject.VGangjwa;
import valueObject.VUser;

public class PHeaderPanel extends JPanel {
	private static final long serialVersionUID = 1L;
	private int miriCredit;
	private int sincheongCredit;
	private Vector<VGangjwa> vMiriGangjwas;
	private Vector<VGangjwa> vSincheongGangjwas;
	private JLabel welcomeLabel;
	private CResult cResult;
	private VUser vUser;
	
	public PHeaderPanel() {
		
		this.welcomeLabel = new JLabel();
		this.add(this.welcomeLabel);
	}
	
	public void initialize(VUser vUser) {
		this.vUser=vUser;
		cResult = new CResult();
		vMiriGangjwas = cResult.get(vUser.getUserId()+"M");
		for(VGangjwa vGangjwa : vMiriGangjwas) {
			miriCredit += Integer.parseInt(vGangjwa.getCredit());
		}
		vSincheongGangjwas = cResult.get(vUser.getUserId()+"S");
		for(VGangjwa vGangjwa : vSincheongGangjwas) {
			sincheongCredit += Integer.parseInt(vGangjwa.getCredit());
		}
		this.welcomeLabel.setText("<html>"+vUser.getHackjwa()+ " "+ vUser.getName()+"님 안녕하세요." + "<br>"+
		"미리담기 최대 22학점 신청 가능합니다. 현재 미리담기 학점 :"+ miriCredit +"학점 입니다."+ "<br>"
		+"수강신청 최대 18학점 신청 가능합니다. 현재 수강신청 학점 :"+ sincheongCredit +"입니다."+"<html>"
				);
		
		
	}

	public void setWelcomeText(Vector<VGangjwa> mirivGangjwas, Vector<VGangjwa> sincheongvGangjwas) {
		miriCredit=0;
		sincheongCredit=0;
		for(VGangjwa vGangjwa : mirivGangjwas) {
			miriCredit += Integer.parseInt(vGangjwa.getCredit());
		}
		for(VGangjwa vGangjwa : sincheongvGangjwas) {
			sincheongCredit += Integer.parseInt(vGangjwa.getCredit());
		}
		this.welcomeLabel.setText("<html>"+vUser.getHackjwa()+ " "+ vUser.getName()+"님 안녕하세요." + "<br>"+
		"미리담기 최대 22학점 신청 가능합니다. 현재 미리담기 학점 :"+ miriCredit +"학점 입니다."+ "<br>"
		+"수강신청 최대 18학점 신청 가능합니다. 현재 수강신청 학점 :"+ sincheongCredit +"입니다."+"<html>"
				);
		
	}
}
