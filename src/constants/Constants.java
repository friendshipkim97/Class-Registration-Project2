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
		nameLabel("아이디"),
		sizeNameText("10"),
		passwordLabel("비밀번호"),
		sizePasswordText("10"),
		okButtonLabel("ok"),
		cancelButtonLabel("cancel"),
		noAccountInfo("회원 정보가 존재하지 않습니다."),
		loginFailed("아이디나 비밀번호가 다릅니다."),
		singUpButtonLabel("회원가입"),
		searchIdButtonLabel("아이디찾기"),
		searchPasswordButtonLabel("비밀번호찾기");
		
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
		nameLabel("이름"),
		sizeNameText("10"),
		numberLabel("학번"),
		sizeNumberText("10"),
		searchIdLabel("아이디찾기"),
		cancelButtonLabel("취소");
		
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
		FILE("파일"),
		EDIT("편집");
		
		private String text;
		
		EMenuBar(String text) {
			this.text = text;
		}
		public String getText() {
			return this.text;
		}
	}
	
	public enum EFileMenu {
		NEW("생성", 'N'),
		OPEN("열기", 'O'),
		SAVE("저장", 'S'),
		SAVEAS("다른이름으로", 'A'),
		PRINT("프린트", 'P'),
		EXIT("종료", 'E');
		
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
		COPY("복사", 'C'),
		CUT("자르기", 'T'),
		PASTE("붙여넣기", 'P'),
		DELETE("삭제", 'D');
		
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
		Miridamgi("미리담기 시간표", "data/미리담기.png"),
		Sugangsincheong("수강신청 시간표", "data/수강신청.png"),
		PersonalInfo("개인정보", "data/개인정보.png"),
		ChangePassword("비밀번호 변경", "data/성적.png"),
		Search("강좌 검색", "data/mju4.png"),
		Creater("만든 이", "data/mari2.png"),
		Logout("로그 아웃", "data/mju.png");
			
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
		campus("캠퍼스"),
		college("대학"),
		hackgwa("학과");
		
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
		gangjwaNo("강좌번호", "getId"),
		gangjwaName("강좌명", "getName"),
		damdangGyosu("담당교수", "getLecturer"),
		hakjeom("학점", "getCredit"),
		time("시간", "getTime");
		
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
		gangjwaNo("강좌번호"),
		gangjwaName("강좌명");
		
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
