package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	
	public Connection con;
	public Statement stmt; //정적쿼리 ex)select * from table명;
	public PreparedStatement psmt;//동적쿼리 ex)select * from table명 where id=?(?에는 사용자 입력값이 들어감)
	public ResultSet rs;
	
	public JDBConnect(String driver, String url, String id, String pwd){
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자1)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if(rs != null)rs.close();
			if(stmt != null)stmt.close();
			if(psmt != null)psmt.close();
			if(con != null)con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
