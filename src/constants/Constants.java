package constants;

import java.util.Vector;

public class Constants {
	
	public enum EConfiguration{
		rootFileName("root"),
		miridmagiFilePostfix("M"),
		sincheongFilePostfix("S");
		
		private String text;
		private EConfiguration(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
		public int getInt() {
			return Integer.parseInt(text);
		}
	}
	
	public enum ELoginDialog {
		width("350"),
		height("500"),
		nameLabel("���̵�"),
		sizeNameText("10"),
		passwordLabel("��й�ȣ"),
		sizePasswordText("10"),
		okButtonLabel("ok"),
		cancelButtonLabel("cancel"),
		noAccountInfo("ȸ�� ������ �������� �ʽ��ϴ�."),
		loginFailed("���̵� ��й�ȣ�� �ٸ��ϴ�."),
		singUpButtonLabel("ȸ������"),
		searchIdButtonLabel("���̵�ã��"),
		searchPasswordButtonLabel("��й�ȣã��");
		
		private String text;
		private ELoginDialog(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
		public int getInt() {
			return Integer.parseInt(text);
		}
	}
	
	public enum ESearchId {
		width("350"),
		height("500"),
		nameLabel("�̸�"),
		sizeNameText("10"),
		numberLabel("�й�"),
		sizeNumberText("10"),
		searchIdLabel("���̵�ã��"),
		cancelButtonLabel("���");
		
		private String text;
		private ESearchId(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
		public int getInt() {
			return Integer.parseInt(text);
		}
	}

	
	public enum EMainFrame {
		width("1000"),
		height("600");
		
		private String text;
		private EMainFrame(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
		public int getInt() {
			return Integer.parseInt(text);
		}
	}
	
	public enum EMenuBar {
		FILE("����"),
		EDIT("����");
		
		private String text;
		
		EMenuBar(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
	}
	
	public enum EFileMenu {
		NEW("����", 'N'),
		OPEN("����", 'O'),
		SAVE("����", 'S'),
		SAVEAS("�ٸ��̸�����", 'A'),
		PRINT("����Ʈ", 'P'),
		EXIT("����", 'E');
		
		private String text;
		private char key;
		
		EFileMenu(String text, char key) {
			this.text = text;
			this.key = key;
		}
		public String getText() {
			return this.text;
		}
		public char getKey() {
			return this.key;
		}
	}
	
	public enum EEditMenu {
		COPY("����", 'C'),
		CUT("�ڸ���", 'T'),
		PASTE("�ٿ��ֱ�", 'P'),
		DELETE("����", 'D');
		
		private String text;
		private char key;
		
		EEditMenu(String text, char key) {
			this.text = text;
			this.key = key;
		}
		public String getText() {
			return this.text;
		}
		
		public char getKey() {
			return this.key;
		}
	}
	
	public enum EToolBar{
		Miridamgi("�̸���� �ð�ǥ", "data/�̸����.png"),
		Sugangsincheong("������û �ð�ǥ", "data/������û.png"),
		PersonalInfo("��������", "data/��������.png"),
		ChangePassword("��й�ȣ ����", "data/����.png"),
		Search("���� �˻�", "data/mju4.png"),
		Creater("���� ��", "data/mari2.png"),
		Logout("�α� �ƿ�", "data/mju.png");
			
		private String text;
		private String path;

		EToolBar(String text, String path){
			this.text = text;
			this.path=path;
		}

		public String getText() {
			return this.text;
		}
		
		public String getPath() {
			return this.path;
		}

	}
	
	public enum EDirectory{
		campus("ķ�۽�"),
		college("����"),
		hackgwa("�а�");
		
		private String text;
		private EDirectory(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
		public int getInt() {
			return Integer.parseInt(text);
		}
	}

	public enum EPGangjwaSelection{
		gangjwaNo("���¹�ȣ", "getId"),
		gangjwaName("���¸�", "getName"),
		damdangGyosu("��米��", "getLecturer"),
		hakjeom("����", "getCredit"),
		time("�ð�", "getTime");
		
		private String text;
		private String methodName;
		private EPGangjwaSelection(String text, String methodName) {
			this.text = text;
			this.methodName=methodName;
		}
		public String getText() {
			return this.text;
		}
		public String getMethodName() {
			return this.methodName;
		}
		public int getInt() {
			return Integer.parseInt(text);
		}
	}

	public enum EPResult{
		gangjwaNo("���¹�ȣ"),
		gangjwaName("���¸�");
		
		private String text;
		private EPResult(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
		public int getInt() {
			return Integer.parseInt(text);
		}
	}
	
}
