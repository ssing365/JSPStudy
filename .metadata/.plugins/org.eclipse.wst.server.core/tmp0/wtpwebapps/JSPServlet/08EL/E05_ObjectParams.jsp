<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 객체 매개변수</title>
</head>
<body>
	<%
	//세가지 인스턴스를 request영역에 각각 저장한다. 
	request.setAttribute("personObj", new Person("홍길동", 33));
	request.setAttribute("stringObj", "나는 문자열");
	request.setAttribute("integerObj", new Integer(99));
	%>
	<!-- 
	액션태그(:param)을 통해 포워드하면서 2개의 정수를 파라미터로 전달할 수 있다. -->
	<jsp:forward page="E06_ObjectResult.jsp">
		<jsp:param value="10" name="firstNum" />
		<jsp:param value="20" name="secondNum" />
	</jsp:forward>
	<!-- 
	위 액션태그를 일반적인 형태로 표현하면 ~
	ObjectResult.jsp?firstNum=10&secondNum=20
	이와같이 쿼리스트링으로 파라미터를 전달하는것과 동일하다. -->
</body>
</html>