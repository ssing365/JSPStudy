package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.one")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		/*
		 * request 내장객체를 통해 현재 요청된 url을 얻어온다. 
		 * 전체 경로명에서 host를 제외한 나머지 경로를 얻어올 수 있다.
		 * => /JSPServlet/12Servlet/regist.one
		 */
		String uri = req.getRequestURI();
		//URL에서 마지막 /의 인덱스를 얻어온다.
		int lastSlash = uri.lastIndexOf("/");
		//앞에서 얻은 인덱스를 통해 URL을 잘라낸다. 즉 마지막의 요청명만 남는다.
		String commandStr = uri.substring(lastSlash);

		/*
	     * 마지막 요청명을 통해 요청을 판단한 후 해당 요청을 처리할 메서드를 호출한다.
	     * 이때 사용자의 요청정보를 담고있는 request내장객체를 인수로 전달한다.
	     * 즉 사용자의 모든 요청을 메서드로 전달하는것이다.
	     */
		if (commandStr.equals("/regist.one"))
			registFunc(req);
		else if (commandStr.equals("/login.one"))
			loginFunc(req);
		else if (commandStr.equals("/freeboard.one"))
			freeboardFunc(req);
		//요청명에 관련된 값들을 request영역에 저장한다.
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		//View로 포워드한다.
		req.getRequestDispatcher("/12Servlet/FrontController.jsp").forward(req, resp);
	}

	// 페이지별 처리 메서드
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}

	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}

	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}
}
