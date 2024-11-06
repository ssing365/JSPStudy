<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<%
	/*
	GET 혹은 POST 방식의 전송에 따라 한글이 깨지는 경우, 아래와 같이 인코딩 처리를 해야한다.
	Tomcat9.x 부터는 별도의 설정이 없어도 깨짐현상은 해결되었지만 문제가 생기는 경우 코드를 추가한다.
	*/
	request.setCharacterEncoding("UTF-8");
	
	/* 
	클라이언트가 전송한 폼값이 1개인 경우 getParameter()메서드로 받을 수 있다.
	input태그의 text, hidden, radio 속성 등에서 사용할 수 있다.
	*/
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	
	/* 
	클라이언트가 전송한 폼값이 2개 이상인 경우 getParameterValues()메서드로 받을 수 있다.
	input태그의 checkobx 속성, textarea 태그,
	select태그의 multiple 속성이 부여되어있을 때 사용할 수 있다.
	*/
	String[] favo = request.getParameterValues("favo");
	String favoStr = "";
	if (favo != null) {
		for (int i = 0; i < favo.length; i++) {
			favoStr += favo[i] + " ";
		}
	}
	
	String[] grade = request.getParameterValues("grade");
	String gradeStr = " ";
	if(grade != null){
		for (int i = 0; i < grade.length; i++){
			gradeStr += grade[i] + " ";
		}
	}
	
	/* 
	textarea 태그는 2줄 이상 엔터를 통해 입력할 수 있으므로,
	웹브라우저에 출력시 <br>태그로 변경해야한다.
	*/
	String intro = request.getParameter("intro").replace("\r\n", "<br/>");
	%>
	<ul>
		<li>아이디 : <%= id %></li>
		<li>성별 : <%= sex %></li>
		<li>관심사항 : <%= favoStr %></li>
		<li>학력 : <%= gradeStr %></li>
		<li>자기소개 : <%= intro %></li>
	</ul>

</body>
</html>