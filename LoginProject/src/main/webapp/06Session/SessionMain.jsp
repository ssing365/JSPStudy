<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
//아래 2개의 시간(세션 생성, 마지막 접근 시간)을 우리가 정한 서식을 적용하여 문자열로 변환

//세션 생성 시간
long creationTime = session.getCreationTime();
String creationTimeStr = dateFormat.format(new Date(creationTime));

//세션에 마지막으로 접근한 시간
long lastTime = session.getLastAccessedTime();
String lastTimeStr = dateFormat.format(new Date(lastTime)); 

//session 내장객체를 통해 세션 유지시간 설정 : 초 단위
//session.setMaxInactiveInterval(60*20);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Session 설정 확인</h2>

	<ul>
		<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
		<li>세션 아이디 : <%= session.getId() %></li>
		<li>최초 요청 시각 : <%= creationTimeStr %></li>
		<li>마지막 요청 시각 : <%= lastTimeStr %></li>
	</ul>
</body>
</html>