package control;

import java.util.Vector;

import model.DBConnection;
import model.MDirectory;
import model.MGangjwa;
import valueObject.VGangjwa;

public class CGangjwa {
	 
     public CGangjwa() {
 		
 	}
 	
 	public Vector<VGangjwa> getData(String fileName){
 		
 		DBConnection dbConnection = new DBConnection();
 		Vector<MGangjwa> mGangjwas = dbConnection.getGangjwas(fileName);
 		
 		Vector<VGangjwa> vGangjwas = new Vector<VGangjwa>();
 		for(MGangjwa mGangjwa : mGangjwas) {
 			VGangjwa vGangjwa = new VGangjwa();
 			vGangjwa.initialize(mGangjwa.getId(),mGangjwa.getName(),mGangjwa.getLecturer(),
 					mGangjwa.getCredit(), mGangjwa.getTime());
 			vGangjwas.add(vGangjwa);
 		}
 		return vGangjwas;
 	}

	public Vector<VGangjwa> searchGangjwa(String fileName) {
		DBConnection dbConnection = new DBConnection();
 		Vector<MGangjwa> mGangjwas = dbConnection.searchGangjwa(fileName);
		
		Vector<VGangjwa> vGangjwas = new Vector<VGangjwa>();
		for(MGangjwa mGangjwa : mGangjwas) {
			VGangjwa vGangjwa = new VGangjwa(
				mGangjwa.getId(),
				mGangjwa.getName(),
				mGangjwa.getLecturer(),
				mGangjwa.getCredit(),
				mGangjwa.getTime(),
				mGangjwa.getHackgwa()
			);
			vGangjwas.add(vGangjwa);
		}
		return vGangjwas;
	}
	

 	


}
