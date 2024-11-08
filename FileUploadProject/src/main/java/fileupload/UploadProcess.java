package fileupload;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import fileupload.MyFileDAO;

@WebServlet("/13FileUpload/UploadProcess.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
)
public class UploadProcess extends HttpServlet{
	private static final long serialVersionUID = 1L;
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
			try {
				//파일이 저장될 디렉토리의 물리적경로를 얻어온다.
				String saveDirectory = getServletContext().getRealPath("/Uploads");
				//파일 업로드 처리
				String originalFileName = FileUtil.uploadFile(req, saveDirectory);
				//서버에 저장된 파일명을 변경
				String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
				
				insertMyFile(req, originalFileName, savedFileName);
				
				//업로드가 완료되면 파일 목록 페이지로 이동
				resp.sendRedirect("FileList.jsp");
			}
			catch (Exception e) {
				e.printStackTrace();
				//업로드 실패시 request영역에 에러메시지 저장 후 포워드
				req.setAttribute("errorMessage", "파일 업로드 오류");
				req.getRequestDispatcher("FileUploadMain.jsp").forward(req, resp);
			}
		}
		
		private void insertMyFile(HttpServletRequest req, String oFileName, 
				String sFileName) {
			//파일 외 폼값 받기
			String title = req.getParameter("title");
			String[] cateArray = req.getParameterValues("cate");
			StringBuffer cateBuf = new StringBuffer();
			if(cateArray ==null) {
				cateBuf.append("선택한 항목 없음");
			}
			else {
				for (String s : cateArray) {
					cateBuf.append(s + ", ");
				}
			}
			System.out.println(title + cateBuf);
			
			//DB에 입력하기
			MyFileDTO dto = new MyFileDTO();
			dto.setTitle(title);
			dto.setCate(cateBuf.toString());
			dto.setOfile(oFileName);
			dto.setSfile(sFileName);
			
			//DAO를 통해 DB에 반영
			MyFileDAO dao = new MyFileDAO();
			dao.insertFile(dto);
			dao.close();
		}
}
