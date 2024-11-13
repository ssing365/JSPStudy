package fileupload;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//서블릿 매핑
@WebServlet("/13FileUpload/MultipleProcess.do")
//업로드 제한 용량
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 300
)
public class MultipleProcess extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	//파일업로드는 POST방식 -> doPost()오버라이딩
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		try {
			//파일이 저장될 디렉토리의 물리적 경로를 얻어온다.
			String saveDirectory = getServletContext().getRealPath("/Uploads");
			
			//멀티 파일 업로드를 위한 함수 호출
			ArrayList<String> listFileName = FileUtil.multipleFile(req, saveDirectory);
			
			//업로드한 파일 개수만큼 반복해 파일명 변경
			for(String originalFileName : listFileName) {
				String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			}
			
			//파일목록으로 이동
			resp.sendRedirect("FileList.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
			//업로드 실패시 request영역에 에러메시지 저장 후 포워드
			req.setAttribute("errorMessage", "파일 업로드 오류");
			req.getRequestDispatcher("FileUploadMain.jsp").forward(req, resp);
		}
	}

}
