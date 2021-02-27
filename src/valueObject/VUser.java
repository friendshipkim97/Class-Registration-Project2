package valueObject;

public class VUser {
	private String userId;
	private String password;
	private String name;
	private String number;
	private String hackgwa;
	
	public VUser(String userId, String password, String name, String number, String hackgwa) {
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.number = number;
		this.hackgwa = hackgwa;
	}
	
	

	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public String getName() {
		return name;
	}
	public String getNumber() {
		return number;
	}
	public String getHackjwa() {
		return hackgwa;
	}

}
