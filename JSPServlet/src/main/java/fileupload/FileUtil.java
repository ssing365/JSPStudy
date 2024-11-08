package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	
	//파일업로드 기능
	public static String uploadFile(HttpServletRequest req, String sDirectory)
				throws ServletException, IOException{
		//파일 저장을 위한 디렉토리와 request내장객체를 매개변수로 정의
		
		/* 파일첨부를 위한 <input>태그의 name 속성값을 이용해서 Part인스턴스를 생성한다.
		이를 통해 파일을 서버에 저장할 수 있다. */
		Part part = req.getPart("ofile");
		
		/*
		 * Part 인스턴스에서 헤더값을 통해 원본파일명을 얻어온다.
		 * 차후 업로드 테스트 시 콘솔에서 확인할 수 있다.*/
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader=" + partHeader);
		
		/*
		 * 헤더값을 통해 얻어온 문자열에서 "filename="을 구분자로 split한다.
		 * 그러면 String 타입의 배열로 반환됨
		 */
		String[] phArr = partHeader.split("filename=");
		/*
		 * 위에서 반환된 배열의 1번 인덱스가 파일명.
		 * 여기서 더블쿼테이션을 replace()로 제거해 원본파일명(originalFileName)에 저장
		 */
		String originalFileName = phArr[1].trim().replace("\"","");
		
		/*
		 * 전송된 파일이 있는 경우 서버의 디렉토리에 파일을 저장한다.
		 * File.separator : OS마다 경로를 표시하는 기호가 다른데, 
		 * 					해당 OS에 맞는 구분자를 자동 추가해준다.
		 */
		if(!originalFileName.isEmpty()) {
			part.write(sDirectory + File.separator + originalFileName);
		}
		
		//저장된 원본파일 반환. DB같이 다른데서 활용 가능
		return originalFileName;
	}
	
	//multiple 속성이 부여되어 2개 이상의 파일을 업로드 처리
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory)
			throws ServletException, IOException{
		
		//파일명 저장을 위한 List계열의 컬렉션 생성
		ArrayList<String> listFileName = new ArrayList<>();
		
		//getParts() 메서드로 Part인스턴스를 컬렉션의 형태로 생성
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			//전송된 파일이 ofile이 아니면 업로드대상이 아니므로 제외
			if(!part.getName().equals("ofile")) continue;
			
			//폼값 중 파일이 맞다면 헤더값을 얻어온다.
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader=" + partHeader);
			
			//헤더값에서 파일명을 잘라낸다.
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"","");
			
			//파일을 디렉토리에 저장
			if(!originalFileName.isEmpty()) {
				part.write(sDirectory + File.separator + originalFileName);
			}
			
			//List에 파일명을 추가
			listFileName.add(originalFileName);			
		}	
		
		//모든 파일의 업로드가 완료되면 파일명을 저장한 List를 반환한다.
		return listFileName;
	}
	
	//파일명 변경 기능
	/*
	 * 서버에 저장된 파일명이 한글인 경우 웹브라우저에서 깨짐 현상이 발생할 수 있으므로
	 * 영문 혹은 숫자의 조합으로 변경하는 것이 안전하다. 
	 */
	public static String renameFile(String sDirectory, String fileName) {
		
		// 파일명에서 확장자를 잘라내기 위해 lastIndexOf()로 맨뒤 .이 있는 위치를 찾는다.
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		/*
		 * 날짜와 시간을 이용해 파일명으로 사용할 문자열을 생성
		 * "년월일_시분초999"와 같은 형태가 된다. 
		 * 마지막 대문자 S는 밀리세컨즈 단위의 시간을 3자리로 반환한다.
		 */
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		//생성된 파일명과 확장자 결합
		String newFileName = now + ext;
		
		//원본파일명과 새로운파일명을 이용해 File인스턴스 생성
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		//파일명을 새이름으로 변경
		oldFile.renameTo(newFile);
		//변경된 파일명 반환
		return newFileName;
	}

}
