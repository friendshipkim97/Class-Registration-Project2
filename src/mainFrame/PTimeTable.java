package mainFrame;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.DefaultListCellRenderer;
import javax.swing.ImageIcon;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

import valueObject.VGangjwa;

public class PTimeTable extends JDialog {
	
	private static final long serialVersionUID = 1L;
	private JPanel jPanel1;
	private JPanel jPanel2;
	private ColorBlueTable jTabel;
	DefaultTableModel tableModel;
	Vector<String> rows;
	
	public int[][] matrix;
	public Vector<String> colorVector;
	int colorCountCheck = 0;
	
	public class GangjwaInfo {
		int column;
		int startRow; // 하나의 정점에 몇개의 정점이 연결되어 있는지 
		int endRow;
		String gangjwaName;
		Boolean booleanText = false;

		
		public GangjwaInfo(int column, int startRow, int endRow, String gangjwaName) {
			this.column = column;
			this.startRow =startRow;
			this.endRow = endRow;
			this.gangjwaName=gangjwaName;
			this.booleanText=false; 
		}
		
		public void setBooleanText() {
			this.booleanText=true;
		}
	}
	
	Vector<GangjwaInfo> gangjwaInfo;
	
	private ListCellRenderer<? super String> getRenderer() {
        return new DefaultListCellRenderer(){
            @Override
            public Component getListCellRendererComponent(JList<?> list,
                    Object value, int index, boolean isSelected,
                    boolean cellHasFocus) {
            	 JLabel listCellRendererComponent = (JLabel) super.getListCellRendererComponent(list, value, index, isSelected,cellHasFocus);
            	if(index%2==0) {
                listCellRendererComponent.setBorder(BorderFactory.createMatteBorder(0, 0 ,4 , 0,Color.BLACK));
                
            	}
                return listCellRendererComponent;
            }
        };
    }
	
	public PTimeTable(Vector<VGangjwa> vGangjwas, String title) {
		colorVector = new Vector<String>();
		matrix = new int[40][7];
	    matrixInitialize();
	    gangjwaInfo = new Vector<GangjwaInfo>();
		setTimeTable(vGangjwas);
		colorSelected(vGangjwas);
		Vector<String> header = new Vector<String>();
		
		this.setBackground(Color.WHITE);
		this.setSize(1000, 
				700);
		this.setLocationRelativeTo(null);
		ImageIcon img = new ImageIcon("data/mju4.png");
		this.setIconImage(img.getImage());
		this.setTitle(title);
		this.setLayout(new BorderLayout());
		jPanel1 = new JPanel();
		jPanel2 = new JPanel();
		jPanel1.setLayout(new BorderLayout());
		jPanel2.setLayout(new BorderLayout());
		
		
		//////////////////////////////// Set Up JTable ////////////////////////////////
		
		header.addElement("일");
		header.addElement("월");
		header.addElement("화");
		header.addElement("수");
		header.addElement("목");
		header.addElement("금");
		header.addElement("토");
		this.tableModel = new DefaultTableModel(header, 0);
		
		rows = new Vector<String>();
		rows.add("확인용");
		rows.add("확인용");
		rows.add("확인용");
		rows.add("확인용");
		rows.add("확인용");

		this.tableModel.addRow(rows);
		this.tableModel.setRowCount(60);
		jTabel = new ColorBlueTable(this.tableModel);
		jTabel.setRowHeight(10);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setViewportView(this.jTabel);
		
		jPanel1.add(scrollPane, BorderLayout.CENTER);
		
		
		////////////////////////////// Set Up JList //////////////////////////////////////////////
		
		
		JList<String> jList = new JList<String>(new String[] {"  ", "     9   ", "    ","    10  ", "    ",
				"    11   ", "    ", "    12  ", "    ", "    13   ", "    ", "    14  ", "    ",
				"    15   ", "    ", "    16  ", "    ", "    17   ", "    ", "    18  ", "    ",
				"    19   ", "    ", "    20  ", "    ", "    21   ", "    ", "    22  ", "    ", "    23  ", "    "
		});

	    jList.setCellRenderer(getRenderer());
//	    jList.setSize(10, 10);
//	    jList.setSize(20, 20);
		JScrollPane scrollPane3 = new JScrollPane();
		scrollPane3.setViewportView(jList);
		jPanel2.add(scrollPane3);
		this.add(jPanel1, BorderLayout.CENTER);
		this.add(jPanel2, BorderLayout.WEST);
		
		//this.tableModel.addRow(rows);
	}
	

	

	private void matrixInitialize() {
		for(int i=0; i<40; i++) {
			for(int j=0; j<7; j++) {
				matrix[i][j]=0;
			}
		}
		
	}
	
	public boolean matrixDuplicatedCheck() {
		for(int i=0; i<40; i++) {
			for(int j=0; j<7; j++) {
				if(matrix[i][j]>=2) {
					return false;
				}
			}
		}
		return true;
	}

	public Vector<GangjwaInfo> setTimeTable(Vector<VGangjwa> gangjwas) {
		for(VGangjwa vGangjwa : gangjwas) {
			System.out.println("강좌확인"+vGangjwa.getName());
			String total = vGangjwa.getTime();
			if(total.indexOf(",") == -1) {
				  if(total.length()==11) {
				    	String firstDay = total.substring(0, 1);
				    	String secondDay = total.substring(1, 2);
				    	String firstDayStartTime = total.substring(2, 6);
				    	String firstDayEndTime = total.substring(7, 11);
				    	
				    	int FirstDaycolorRow = Integer.parseInt(firstDayEndTime)-Integer.parseInt(firstDayStartTime);
				    	String firstDayTimeHour=null;
				    	String firstDayTimeminute=null;
				    	if(FirstDaycolorRow<100) {
				    		 firstDayTimeHour = "0";
				    		 firstDayTimeminute=Integer.toString(FirstDaycolorRow);
				    	}
				    	else {
				    		firstDayTimeHour = Integer.toString(FirstDaycolorRow).substring(0, 1);
				    		firstDayTimeminute = Integer.toString(FirstDaycolorRow).substring(1, Integer.toString(FirstDaycolorRow).length());
				    	}
						int FirstColorRows=0;
						if((Integer.parseInt(firstDayTimeminute)%15==0)) {
							FirstColorRows = Integer.parseInt(firstDayTimeHour)*4+(Integer.parseInt(firstDayTimeminute)/15);
						}
						else {
							FirstColorRows = Integer.parseInt(firstDayTimeHour)*4+(Integer.parseInt(firstDayTimeminute)/15)+1;
						}
					
						
						int temp =0;
						if(((Integer.parseInt(firstDayStartTime)-900)%25==0)) {
							temp=((Integer.parseInt(firstDayStartTime)-900)/25);
						}
						else {
							temp=((Integer.parseInt(firstDayStartTime)-900)/25)+1;
						}
				    	 
				    	 gangjwaInfo.add(new GangjwaInfo(calStartColumn(firstDay), temp, 
									(temp+FirstColorRows-1), vGangjwa.getName()));
							
				    	 gangjwaInfo.add(new GangjwaInfo(calStartColumn(secondDay), temp, 
									(temp+FirstColorRows-1), vGangjwa.getName()));
				    	 
				
				    	 
				    }
				    else if(total.length()==10) {
				    	String firstDay = total.substring(0, 1);
				    	String firstDayStartTime = total.substring(1, 5);
				    	String firstDayEndTime = total.substring(6, 10);
				    	
				    	int FirstDaycolorRow = Integer.parseInt(firstDayEndTime)-Integer.parseInt(firstDayStartTime);
				    	
				    	String firstDayTimeHour=null;
				    	String firstDayTimeminute=null;
				    	if(FirstDaycolorRow<100) {
				    		 firstDayTimeHour = "0";
				    		 firstDayTimeminute=Integer.toString(FirstDaycolorRow);
				    	}
				    	else {
				    		firstDayTimeHour = Integer.toString(FirstDaycolorRow).substring(0, 1);
				    		firstDayTimeminute = Integer.toString(FirstDaycolorRow).substring(1, Integer.toString(FirstDaycolorRow).length());
				    	}

						
						int FirstColorRows=0;
						if((Integer.parseInt(firstDayTimeminute)%15==0)) {
							FirstColorRows = Integer.parseInt(firstDayTimeHour)*4+(Integer.parseInt(firstDayTimeminute)/15);
						}
						else {
							FirstColorRows = Integer.parseInt(firstDayTimeHour)*4+(Integer.parseInt(firstDayTimeminute)/15)+1;
						}
						
						int temp =0;
						if(((Integer.parseInt(firstDayStartTime)-900)%25==0)) {
							temp=((Integer.parseInt(firstDayStartTime)-900)/25);
						}
						else {
							temp=((Integer.parseInt(firstDayStartTime)-900)/25)+1;
						}
						gangjwaInfo.add(new GangjwaInfo(calStartColumn(firstDay), temp, 
								(temp+FirstColorRows-1), vGangjwa.getName()));

				
				    }
			}
			else {
				int second = total.indexOf(",");
			     
				String firstLine = total.substring(0, second);
				String SecondLine = total.substring(second+1, total.length());
				String firstDay = total.substring(0, 1);
				String secondDay = total.substring(second+1, second+2);
				
				 int firstcenter = firstLine.indexOf("-");
					String firstDayStartTime = total.substring(1, firstcenter);
					String firstDayEndTime = total.substring(firstcenter+1, second);
					
					 int secondcenter = SecondLine.indexOf("-");
					 String SecondDayStartTime = SecondLine.substring(1, secondcenter);
						String SecondDayEndTime = SecondLine.substring(secondcenter+1, second);
											
						int FirstDaycolorRow = Integer.parseInt(firstDayEndTime)-Integer.parseInt(firstDayStartTime);
						
						String firstDayTimeHour=null;
				    	String firstDayTimeminute=null;
				    	if(FirstDaycolorRow<100) {
				    		 firstDayTimeHour = "0";
				    		 firstDayTimeminute=Integer.toString(FirstDaycolorRow);
				    	}
				    	else {
				    		firstDayTimeHour = Integer.toString(FirstDaycolorRow).substring(0, 1);
				    		firstDayTimeminute = Integer.toString(FirstDaycolorRow).substring(1, Integer.toString(FirstDaycolorRow).length());
				    	}
				    	
						int FirstColorRows=0;
						if((Integer.parseInt(firstDayTimeminute)%15==0)) {
							FirstColorRows = Integer.parseInt(firstDayTimeHour)*4+(Integer.parseInt(firstDayTimeminute)/15);
						}
						else {
							FirstColorRows = Integer.parseInt(firstDayTimeHour)*4+(Integer.parseInt(firstDayTimeminute)/15)+1;
						}
						
						int temp =0;
						if(((Integer.parseInt(firstDayStartTime)-900)%25==0)) {
							temp=((Integer.parseInt(firstDayStartTime)-900)/25);
						}
						else {
							temp=((Integer.parseInt(firstDayStartTime)-900)/25)+1;
						}
						gangjwaInfo.add(new GangjwaInfo(calStartColumn(firstDay), temp, 
								(temp+FirstColorRows-1), vGangjwa.getName()));
						
						int SecondDaycolorRow = Integer.parseInt(SecondDayEndTime)-Integer.parseInt(SecondDayStartTime);

						String SecondDayTimeHour=null;
				    	String SecondDayTimeminute=null;
				    	if(SecondDaycolorRow<100) {
				    		SecondDayTimeHour = "0";
				    		SecondDayTimeminute=Integer.toString(SecondDaycolorRow);
				    	}
				    	else {
				    		SecondDayTimeHour = Integer.toString(SecondDaycolorRow).substring(0, 1);
				    		SecondDayTimeminute = Integer.toString(SecondDaycolorRow).substring(1, Integer.toString(SecondDaycolorRow).length());
				    	}
				    	
				    	
						int SecondColorRows=0;
						if((Integer.parseInt(SecondDayTimeminute)%15==0)) {
							SecondColorRows = Integer.parseInt(SecondDayTimeHour)*4+(Integer.parseInt(SecondDayTimeminute)/15);
						}
						else {
							SecondColorRows = Integer.parseInt(SecondDayTimeHour)*4+(Integer.parseInt(SecondDayTimeminute)/15)+1;
						}
						
						int temp2 =0;
						if(((Integer.parseInt(SecondDayStartTime)-900)%25==0)) {
							temp2=((Integer.parseInt(SecondDayStartTime)-900)/25);
						}
						else {
							temp2=((Integer.parseInt(SecondDayStartTime)-900)/25)+1;
						}
						gangjwaInfo.add(new GangjwaInfo(calStartColumn(secondDay), temp2, 
								(temp2+SecondColorRows-1), vGangjwa.getName()));

						
			}

		}
		
		return gangjwaInfo;
	}
	
	public void checkDupicated() {
		for(int i=0; i<gangjwaInfo.size(); i++){
			for(int j=gangjwaInfo.get(i).startRow; j<=gangjwaInfo.get(i).endRow; j++) {
				matrix[j][gangjwaInfo.get(i).column] +=1;
	}
		}
	}
	
	public int calStartColumn(String firstDay) {
		int startColumn=0;
		switch (firstDay) {
        case "일":  startColumn = 0; 
        break;
        case "월":  startColumn = 1;
        break;
        case "화":  startColumn = 2; 
        break;
        case "수":  startColumn = 3; 
        break;
        case "목":  startColumn = 4; 
        break;
        case "금":  startColumn = 5;
        break;
        case "토":  startColumn = 6;
        break;
		}
        return startColumn;
		}
	
	public Color colorChoice(int colorInteger) {
        Color colorChoice = null;
        String a = Integer.toString(colorInteger);
		switch (a) {
        case "0": colorChoice = Color.LIGHT_GRAY;
        break;
        case "1": colorChoice = Color.CYAN;
        break;
        case "2": colorChoice = Color.green;
        break;
        case "3": colorChoice = Color.YELLOW;
        break;
        case "4": colorChoice = Color.PINK;
        break;
        case "5": colorChoice = Color.ORANGE;
        break;
        case "6": colorChoice = Color.magenta;
        break;
		}
        return colorChoice;
		}
	
	private void colorSelected(Vector<VGangjwa> vGangjwas) {
		
		for(VGangjwa vGangjwa : vGangjwas) {
			colorChoiceGangjwa(vGangjwa.getName());
		}
		
	}
	
	public Color colorChoiceGangjwa(String gangjwaName) {
		
		
		boolean duplicatedCheck = false;
		Color colorChoice = null;
		
		for(int i=0; i<colorVector.size(); i++) {
			if(colorVector.get(i).contentEquals(gangjwaName)) {
				colorChoice = colorChoice(i);
				duplicatedCheck=true;
			}
		}
		
		if(duplicatedCheck==false) {
			colorVector.add(gangjwaName);
			colorChoice = colorChoice(colorVector.size()-1);
		}
		
		return colorChoice;
		
		}
	
	public class ColorBlueTable extends JTable {

		private static final long serialVersionUID = 1L;
		DefaultTableModel dtm;
		public ColorBlueTable(DefaultTableModel dtm) {
			super(dtm); 
		} 
		@Override 
		public Component prepareRenderer(TableCellRenderer renderer, int row, int column) 
		{ 
			JComponent component = null;
			JPanel jPanel;
			JLabel jLabel;
			
			JLabel jLabel2;
			
			for(int i=0; i<gangjwaInfo.size(); i++){
				for(int j=gangjwaInfo.get(i).startRow; j<=gangjwaInfo.get(i).endRow; j++) {
					if(column==gangjwaInfo.get(i).column && row==j) {
						jLabel = (JLabel) super.prepareRenderer(renderer, j, gangjwaInfo.get(i).column); 
						
						jLabel.setBackground(colorChoiceGangjwa(gangjwaInfo.get(i).gangjwaName));
						jLabel.setFont(jLabel.getFont().deriveFont(9.0f));
						jLabel.setText(gangjwaInfo.get(i).gangjwaName);
						jPanel = new JPanel();
						jPanel.setLayout(new BorderLayout());
						jPanel.add(jLabel, BorderLayout.CENTER);
						return jPanel; 
					}

				}
			}
			return component; 

		} 
	}
}

	
	




