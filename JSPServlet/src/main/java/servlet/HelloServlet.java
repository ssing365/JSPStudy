package servlet;

import java.io.IOException;

/*
 * 서블릿 클래스를 만들기 위한 절차
 * 1. HttpServlet 클래스 상속
 * 2. 클라의 요청을 받아 처리하기 위한 doGet() / doPost() 메서드를 오버라이딩
 * 3. 서블릿에 필수적인 패키지 임포트와 예외처리는 자동완성됨
 * 4. request내장객체와 response내장객체는 매개변수를 통해 서블릿 클래스에 
 * 이미 포함되어 있으므로 즉시 사용할 수 있다.
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	//서블릿 작성 시 발생되는 경고를 위해 추가.
	private static final long serialVersionUID = 1L; 

	/*
	 * get방식의 요청을 처리하기 위한 doGet()메서드 오버라이딩
	 * 만약 요청을 처리할 수 있는 메서드가 없으면 405 에러 발생
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//request영역에 속성을 저장한다.
		req.setAttribute("message", "Hello Servlet..!! ");
		//View에 해당하는 JSP로 포워드한다.
		req.getRequestDispatcher("/12Servlet/HelloServlet.jsp").forward(req, resp);
		/* request 영역은 포워드 된 페이지까지 공유되므로
		 * 서블릿에서 저장한 속성은 JSP에서 사용할 수 있다.
		 * 그래서 바로가기 링크 누르면 여기서 저장한 message가 뜰수있구나 ~ */
	}
}
