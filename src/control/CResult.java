package control;

import java.util.Vector;

import model.DBConnection;
import model.MGangjwa;
import valueObject.VGangjwa;

public class CResult {

	public CResult() {
		
	}
	public void save(String fileName, Vector<VGangjwa> vGangjwas) {
		
		DBConnection dbConnection = new DBConnection();
 		dbConnection.saveResults(fileName, vGangjwas);
 		
	}
	public Vector<VGangjwa> get(String fileName) {
		
		DBConnection dbConnection = new DBConnection();
 		Vector<MGangjwa> mGangjwas = dbConnection.getResults(fileName);
		
		Vector<VGangjwa> vGangjwas = new Vector<VGangjwa>();
		for(MGangjwa mGangjwa : mGangjwas) {
			VGangjwa vGangjwa = new VGangjwa(
				mGangjwa.getId(),
				mGangjwa.getName(),
				mGangjwa.getLecturer(),
				mGangjwa.getCredit(),
				mGangjwa.getTime()
			);
			vGangjwas.add(vGangjwa);
		}
		return vGangjwas;
		
	}

}
