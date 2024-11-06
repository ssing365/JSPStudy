<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - Response</title>
</head>
<body>
	<%
	//post방식으로 전송된 폼 값을 받는다.
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	/* 
	문자열을 통한 단순비교로 로그인 정보를 확인한다. 
	이 메서드(equalsIgnoreCase)는 대소문자를 구분하지 않는다.
	*/
	if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
		/* 인수로 주어진 경로 혹은 URL로 이동한다.
		JS의 location.href와 기능적으로 완전히 동일하다.*/
		response.sendRedirect("E07_ResponseWelcome.jsp");
	} else {
		/* 
		인증에 실패한 경우 메인페이지로 포워드 한다.
		포워드란 페이지 이동과는 다르게 특정페이지가 받았던 요청을 그대로 전달하는 것을 말한다.
		포워드가 되면 웹브라우저의 주소줄에는 최초 요청을 받았던 URL이 표시되고, 
		화면상에는 요청이 전달된 페이지가 출력된다.
		아래 코드는 main페이지로 포워드하면서 loginErr라는 파라미터를 전달하고 있다.
		*/
		request
		.getRequestDispatcher("E05_ResponseMain.jsp?loginErr=3")
		.forward(request, response);
	}
	%>
</body>
</html>