<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* 응답 헤더에 값 추가 */
/*  
get 방식으로 전송된 폼값을 날짜형식을 통해 타임스탬프로 변경한다.
getTime() : 날짜를 1970-01-01부터 지금까지의 시간을 초단위로 반환해주는 메서드
*/
//날짜와 시간의 서식을 [년-월-일 시:분]으로 지정한다.
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//String타입의 폼 값을 날짜 형식으로 변경한 후 타임스탬프를 얻어온다.
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date="+add_date);

//숫자형식으로 전송된 값을 정수로 변환한다.
int add_int = Integer.parseInt(request.getParameter("add_int"));

//문자형은 그대로 사용하면 된다.
String add_str = request.getParameter("add_str");

/* 응답 헤더에 값 추가 */
//날짜 형식의 응답헤더 추가
response.addDateHeader("myBirthday", add_date);

//숫자 형식의 응답헤더 추가. 동일한 헤더병으로 2개의 값을 추가한다.
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004); //추가

//문자 형식의 응답헤더 추가.
response.addHeader("myName", add_str);
//앞에서 추가한 값을 '안중근'으로 수정한다.
response.setHeader("myName", "안중근"); //수정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - response</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames();
	for (String hName : headerNames) {
		String hValue = response.getHeader(hName);
	%>
	<li><%=hName%> : <%=hValue%></li>
	<%
	}
	/*
	헤더명을 지정하지 않고 한꺼번에 가져오는 경우 헤더명이 동일하면 첫 번째 값 하나만 출력된다.
	즉 여기서는 8282가 2번 출력된다.
	*/
	%>

	<h2>myNumber만 출력하기</h2>
	<%
	/*
	myNumber라는 헤더명으로 2개의 값을 추가했으므로 아래에서는 각각의 값이 정상적으로 출력된다.
	즉 add계열의 메서드는 헤더명이 동일하더라도 덮어쓰기 하지않고 각각 추가된다.
	*/
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
	<li>myNumber : <%=myNum%></li>
	<%
	}
	%>
</body>
</html>