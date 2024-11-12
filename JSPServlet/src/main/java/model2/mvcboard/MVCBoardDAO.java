package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

//DBCP(커넥션풀)을 통해 Oracle에 연결하기 위해, DBConnPool 상속받아 정의
public class MVCBoardDAO extends DBConnPool {
	//기본생성자를 통해 부모클래스 생성자 호출(생략 가능)
	public MVCBoardDAO() {
		super();
	}
	
	//게시물의 개수를 카운트하기 위한 메서드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		//오라클의 그룹함수는 count()를 사용해서 쿼리문 작성
		//select count(*) from mvcboard; 
		String query = "SELECT COUNT(*) FROM mvcboard";
		//매개변수로 전달된 검색어가 있는 경우에만 where절을 동적으로 추가
		/*
		 *  게시물의 일련번호를 내림차순으로 정렬하여 인출하기
		--검색어가 있는 경우 like 조건을 추가한 후 개수 파악
		select count(*) from mvcboard where title like '%자료%'; --5개
		select count(*) from mvcboard where title like '%겨울%'; --0개
		*/
		if(map.get("searchWord")!=null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '% " + map.get("searchWord") + "% '";
		}
		try {
			//Statement 인스턴스 생성(정적 쿼리문 실행)
			stmt = con.createStatement();
			//쿼리문을 실행한 후 결과를 ResultSet으로 반환받는다.
			rs = stmt.executeQuery(query);
			/*
			 * count()함수는 조건에 상관없이 항상 결과가 인출되므로
			 * if문같은 조건절없이 바로 next함수를 실행할 수 있다.
			 * 결과가 인출되지 않는(select)함수 즉 null이 반환되는 함수에서 
			 * next를 바로 실행하면 nullpointerexception이 떨어지므로
			 * while(rs.next())이나 if(rs.next())처럼 조건절을 함께 써야한다. 
			 */
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//게시판 목록에 출력할 레코드를 인출하기 위한 메서드 정의
	public List<MVCBoardDTO> selectList(Map<String, Object>map){
		//오라클에서 인출한 레코드를 저장하기 위한 List생성
		//게시판은 순서를 지켜야하므로 set안되고 list로
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		
		//레코드 인출을 위한 쿼리문 작성
		String query = "SELECT * FROM mvcboard ";
		//검색어 입력 여부에 따라 where절은 조건부로 추가됨
		if(map.get("searchWord")!=null) {
			query += " WHERE " + map.get("searchField")
			+" LIKE '%" + map.get("searchWord") + "%' ";
		}
		//일련번호의 내림차순으로 정렬한 후 인출한다.
		query += " ORDER BY idx DESC";
		//게시판은 항상 최근에 작성한 게시물이 상단에 노출되어야한다.
		
		try {
			//PrepareStatement 인스턴스 생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행 및 결과 반환(ResultSet)
			rs = psmt.executeQuery();
			//ResultSet의 크기만큼(인출된 레코드 개수만큼) 반복하여 setter로 DTO에 저장
			while(rs.next()) {
				//하나의 레코드를 저장하기 위해 DTO인스턴스 생성
				MVCBoardDTO dto = new MVCBoardDTO();
				
				/*
				 * ResultSet 인스턴스에서 데이터를 추출할 때 멤버변수의 타입에 따라
				 * getString(), getInt(), getDate()로 구분하여 호출한다.
				 * 이 데이터를 DTO의 setter를 이용해 저장한다.
				 */
				dto.setIdx(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				
				//레코드가 저장된 DTO를 List에 개수만큼 추가한다.
				board.add(dto);
			}
		}
		catch (Exception e){
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		//마지막으로 인출한 레코드를 저장한 List를 반환한다.
		return board;
	}
	
	//글쓰기 처리를 위한 쿼리문 실행
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		try {
			/*
			 * default값이 있는 3개의 컬럼을 제외한 나머지 컬럼에 대해서만 insert 쿼리문 작성.
			 * 일련번호 idx의 경우에는 시퀀스 사용
			 */
			String query = 
					"INSERT INTO mvcboard ( "
					+ " idx, id, title, content, ofile, sfile ) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL,?,?,?,?,?)";
			//쿼리문을 인수로 preparedStatement 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인스턴스를 통해 인파라미터 설정
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			//쿼리문 실행. insert쿼리의 경우 입력된 행의 개수가 반환됨.
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(" 게시물 입력 중 예외 발생 ");
			e.printStackTrace();
		}
		return result;
	}
	
	//게시물 열람
	public MVCBoardDTO selectView(String idx) {
		//인출한 레코드를 저장하기 위해 DTO 생성
		MVCBoardDTO dto = new MVCBoardDTO();
		//내부조인을 이용해 쿼리문 작성. member테이블의 name컬럼까지 포함.
		String query = " SELECT Bo.*, Me.name FROM mvcboard Bo "
				+ " INNER JOIN member Me ON Bo.id=Me.id "
				+ " WHERE idx=? "; //쿼리문 템플릿 준비
		try {
			psmt = con.prepareStatement(query);//쿼리문 준비
			psmt.setString(1, idx); //인파라미터 설정
			rs = psmt.executeQuery(); //쿼리문 실행
			
			//하나의 게시물을 인출하므로 if문으로 조건에 맞는 게시물이 있는지 확인
			if(rs.next()) {
				//결과를 DTO객체에 저장
				dto.setIdx(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				dto.setName(rs.getString(10));
			}
		}
		catch(Exception e){
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	//지정한 일련번호에 해당하는 게시물의 조회수를 1 증가시킵니다.
	public void updateVisitCount(String idx) {
		//visitcount 컬럼은 number타입이므로 산술연산 가능. 
		//1을 더해 컬럼에 재반영하도록 UPDATE 쿼리문 작성
		String query = "UPDATE mvcboard SET "
				+ " visitcount=visitcount+1 "
				+ " WHERE idx = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			/*
			 * 쿼리 실행 시 메소드
			 * 1. executeQuery() 
			 * 	: select계열의 쿼리문 실행. 반환 타입은 resultSet객체
			 * 2. executeUpdate() 
			 * 	: insert, update, delete계열의 쿼리문 실행. 반환 타입은 int
			 * 만약 쿼리 실행 후 반환값이 필요하지 않다면 둘 중 아무거나 써도 무방하다.
			 */
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	//해당 게시물에 첨부된 파일의 다운로드 횟수를 증가시킨다.
	public void downCountPlus(String idx) {
		String sql = "UPDATE mvcboard SET "
				+ " downcount = downcount+1 "
				+ " where idx = ?" ;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}catch (Exception e) {e.printStackTrace();}
	}

	//지정한 일련번호의 게시물을 삭제한다.
	public int deletePost(String idx) {
		int result = 0;
		try {
			String query = "delete from mvcboard where idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		try {
			//쿼리문 템플릿 준비
			String query = "update mvcboard "
					+ " set title=?, content=?, ofile=?, sfile=?"
					+ " where idx=? and id=?";
				
			//쿼리문 준비
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getIdx());
			psmt.setString(6, dto.getId());
			
			//쿼리문 실행
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
