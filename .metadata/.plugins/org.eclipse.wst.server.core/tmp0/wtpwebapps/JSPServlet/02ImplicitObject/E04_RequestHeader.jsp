<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력하기</h2>
	<%
	/* 
	getHeaderNames() 
	: 사용자의 요청 헤더를 얻어올 때 사용하는 메서드로 반환 타입은 Enumeration 인스턴스이다.
	 - hasMoreElements() : 출력할 요청헤더 정보가 남았는지 확인하여 boolean으로 반환.
	 - nextElement() : 헤더명을 반환. 
	*/
	Enumeration headers = request.getHeaderNames();
	while (headers.hasMoreElements()){
		String headerName = (String)headers.nextElement();
		String headerValue = request.getHeader(headerName);
		out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br/>");
	}
	%>
	<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
	<!-- 
	요청헤더를 통해 확인할 수 있는 값
	user-agent
	: 사용자가 접속한 웹브라우저의 종류를 알 수 있다.
	크롬, 파이어폭스 등 다른 웹브라우저로 테스트해보면 차이가 있다.
	referer
	: 웹 서핑을 통해 특정한 사이트를 방문할 경우 남는 흔적을 말한다.
	어떤 사이트를 통해 유입되었는지 알 수 있다.
	cookie
	: 웹 서버가 브라우저를 통해 클라이언트의 컴퓨터에 남기는 흔적으로 텍스트 파일 형태로 저장된다. -->
</body>
</html>