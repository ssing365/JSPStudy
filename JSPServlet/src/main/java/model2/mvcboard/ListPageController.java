package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

//목록 처리를 위한 서블릿(페이징 기능 추가)
public class ListPageController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//DAO 생성
		MVCBoardDAO dao= new MVCBoardDAO();
		
		//뷰에 전달할 매개변수 저장용 맵 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검색어가 있는 경우 파라미터를 받아서 Map에 추가
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
			
		}
		//게시물 개수 카운트. 검색어가 있는 경우 like절 동적 추가됨
		int totalCount = dao.selectCount(map);
		
		/*페이지 처리 start*/
		//application 내장 객체를 얻어옴
		ServletContext application = getServletContext();
		//web.xml에서 컨텍스트 초기화 파라미터를 읽어옴
		//읽어온 값은 String이므로 연산을 위해 int형으로 변환
		int pageSize = Integer.parseInt(
				application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(
				application.getInitParameter("PAGES_PER_BLOCK"));
		/*
		 * 현재 페이지 확인 : 목록에 처음 진입했을 때는 파라미터가 없는 상태이므로 1페이지로 지정
		 * 그 외 페이지 번호가 있다면 받아와서 사용한다.
		 */
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		//목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		//DAO로 전달하기 위해 Map에 저장
		map.put("start", start);
		map.put("end", end);
		/*페이지 처리 end*/
		
		//DAO의 메서드를 호출하여 목록에 출력할 게시물을 얻어온다.
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		dao.close();
		
		//뷰에 전달할 매개변수 추가
		//목록 하단에 출력할 페이지 바로가기 링크를 얻어온 후 Map에 추가
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/listPage.do");
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/14MVCBoard/ListPage.jsp").forward(req, resp);
	}

}
