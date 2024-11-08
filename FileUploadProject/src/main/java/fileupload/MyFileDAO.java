package fileupload;

import java.util.Date;
import java.util.List;
import java.util.Vector;

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
	
	public List<MyFileDTO> myFileList(){
		List<MyFileDTO> fileList = new Vector<MyFileDTO>();
		
		String query = "select * from myfile order by idx desc";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				
				dto.setTitle(rs.getString(1));
				dto.setCate(rs.getString(2));
				dto.setCate(rs.getString(3));
				dto.setOfile(rs.getString(4));
				
			}
		}
		catch (Exception e) {
			System.out.println("SELECT 시 예외 발생");
			e.printStackTrace();
		}
		
		return fileList;
	}
}
