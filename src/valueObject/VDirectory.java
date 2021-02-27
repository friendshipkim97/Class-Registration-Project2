package valueObject;

public class VDirectory {
    private String name;
    private String fileName;
    
    private String id;
    private String college;
    private String campus;
    
    public VDirectory(String id, String name, String fileName, String college, String campus) {
    	this.id=id;
    	this.name=name;
    	this.fileName=fileName;
    	this.college=college;
    	this.campus=campus;

    }

    public VDirectory() {
		// TODO Auto-generated constructor stub
	}

	public void initialize(String name, String fileName) {
    	this.name = name;
    	this.fileName = fileName;
    }
    public String getName() {
    	return name;
    }
    public String getFileName() {
    	return fileName;
    }
    public String getCollege() {
    	return college;
    }
    public String getCampus() {
    	return campus;
    }

	
}
