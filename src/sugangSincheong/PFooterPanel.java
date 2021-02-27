package sugangSincheong;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.swing.JLabel;
import javax.swing.JPanel;

public class PFooterPanel extends JPanel {
	private static final long serialVersionUID = 1L;
	private JLabel timeLabel;

	public PFooterPanel() {
		Calendar cal = Calendar.getInstance();
		this.timeLabel = new JLabel(cal.get(Calendar.YEAR)+"년 " + (cal.get(Calendar.MONTH)+1)+"월 "+cal.get(Calendar.DAY_OF_MONTH)+"일 "+
				cal.get(Calendar.HOUR_OF_DAY)+" 시"+cal.get(Calendar.MINUTE)+" 분"+cal.get(Calendar.SECOND)+" 초 입니다."
				);
		this.add(this.timeLabel);
		
		Timer timer = new Timer();
		TimerTask task = new TimerTask() {
			public void run() {
				Calendar cal = Calendar.getInstance();
				timeLabel.setText(cal.get(Calendar.YEAR)+"년 " + (cal.get(Calendar.MONTH)+1)+"월 "+cal.get(Calendar.DAY_OF_MONTH)+"일 "+
				cal.get(Calendar.HOUR_OF_DAY)+"시 "+cal.get(Calendar.MINUTE)+"분 "+cal.get(Calendar.SECOND)+"초 입니다.");
			}
		};
		
		timer.schedule(task, 0, 1000);
	}

	public void initialize() {
		// TODO Auto-generated method stub
		
	}

}
