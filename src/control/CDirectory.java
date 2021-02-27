package control;

import java.util.Vector;

import model.DBConnection;
import model.MDirectory;
import model.MGangjwa;
import valueObject.VDirectory;
import valueObject.VGangjwa;

public class CDirectory {
	
	public CDirectory() {
		
	}
	
	public Vector<VDirectory> getData(String fileName){
		
		DBConnection dbConnection = new DBConnection();
		Vector<MDirectory> mDirectories = dbConnection.getDirectories(fileName);
		
		Vector<VDirectory> vDirectories = new Vector<VDirectory>();
		for(MDirectory mDirectory : mDirectories) {
			VDirectory vDirectory = new VDirectory();
			vDirectory.initialize(mDirectory.getName(),
					mDirectory.getFileName());
			vDirectories.add(vDirectory);
		}
		return vDirectories;
	}
	
	public VDirectory searchCollege(String fileName) {
		DBConnection dbConnection = new DBConnection();
		MDirectory mDirectory = dbConnection.searchCollege(fileName);
		

		VDirectory vDirectory = new VDirectory(
				mDirectory.getId(),
				mDirectory.getName(),
				mDirectory.getFileName(),
				mDirectory.getCollege(),
				""
			);
		return vDirectory;
	}

	public VDirectory searchCampus(String fileName) {
		DBConnection dbConnection = new DBConnection();
		MDirectory mDirectory = dbConnection.searchCampus(fileName);
		
		VDirectory vDirectory = new VDirectory(
				mDirectory.getId(),
				mDirectory.getName(),
				mDirectory.getFileName(),
				"",
				mDirectory.getCampus()
			);
		return vDirectory;
	}

}
