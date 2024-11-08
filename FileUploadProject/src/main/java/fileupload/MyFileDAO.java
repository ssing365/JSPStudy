package fileupload;

import java.util.Date;
import common.JDBConnect;
import jakarta.servlet.ServletContext;
import fileupload.MyFileDTO;

public class MyFileDAO extends JDBConnect{
	public MyFileDAO(String drv, String url, String id, String pw) {
		super(drv, url, id , pw); 
	}
	public MyFileDAO() {
		super();
	}
	
	public int insertFile(MyFileDTO mydto) {
		int applyResult = 0;
		
		try {
			String query = "INSERT INTO myfile "
					+ "(idx, title, cate, ofile, sfile, postdate) "
					+ "VALUES "
					+ "(myfile_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			
			//쿼리문 실행을 위한 prepared 인스턴스 생성
			psmt = con.prepareStatement(query);
			psmt.setString(1, mydto.getTitle());
			psmt.setString(2, mydto.getCate());
			psmt.setString(3, mydto.getOfile());
			psmt.setString(4, mydto.getSfile());
			//쿼리문 실행 및 결과는 ResultSet으로 반환받는다.
			applyResult = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return applyResult;
	}
}
