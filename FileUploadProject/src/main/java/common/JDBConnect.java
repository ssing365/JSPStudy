package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	
	//멤버변수 : DB연결, 정적쿼리실행, 동적쿼리실행, select 결과반환
	//interface.
	public Connection con;
	public Statement stmt; //정적쿼리 ex)select * from table명;
	public PreparedStatement psmt;//동적쿼리 ex)select * from table명 where id=?(?에는 사용자 입력값이 들어감)
	public ResultSet rs;
	
	//1. 기본 생성자 : 매개변수가 없는 생성자
	public JDBConnect() {
		try {
			//오라클 드라이버 메모리에 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//커넥션 URL 생성
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			//계정의 아이디와 비번 
			String id = "education";
			String pwd = "1234";
			//데이터베이스 연결 시도
			con = DriverManager.getConnection(url, id, pwd);
			//Connection 인스턴스가 반환되면 연결 성공
			System.out.println("DB 연결 성공(기본 생성자)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//2. 매개변수가 4개인 생성자. (생성자 오버로딩.) 
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자1)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//3. application 내장객체의 원본타입을 매개변수로 선언
	public JDBConnect(ServletContext application) {
		try {
			/*
			내장객체를 매개변수를 통해 전달받았으므로 Java클래스 내에서 web.xml을 접근할 수 있다.
			그러면 JSP에서 DB연결을 위해 반복적으로 사용했던 코드를 줄일 수 있다.
			(JSP, Java양쪽 모두 코드가 간결해지는 합리적인 방식)
			 * */
			String driver = application.getInitParameter("OracleDriver");
			
			//얻어온 값들을 통해 드라이버 로드와 DB연결을 진행한다.
			Class.forName(driver);
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");

			//디버깅을 위한 값 출력
			System.out.println(driver+"="+ url+"="+id+"="+pwd);
			con = DriverManager.getConnection(url,id,pwd);
			
			System.out.println("DB 연결 성공(인수 생성자2)");
		}
		catch(Exception e) {
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
