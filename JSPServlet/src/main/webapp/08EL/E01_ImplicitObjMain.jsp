<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//4가지 영역에 같은 속성명(scopeValue)으로 각기 다른 값을 저장
pageContext.setAttribute("scopeValue", "페이지 영역");
request.setAttribute("scopeValue", "리퀘스트 영역");
session.setAttribute("scopeValue", "세션 영역");
application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 내장 객체</title>
</head>
<body>
	<h2>ImplicitObjMain 페이지</h2>

	<!-- 
	4가지 영역에 접근할 때는 EL의 내장객체를 통해 값을 출력한다.
	모두 동일한 패턴으로 "영역명Scope"와 같은 형태로 되어있다.	 -->
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<li>페이지 영역 : ${ pageScope.scopeValue }</li>
		<li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
		<li>세션 영역 : ${ sessionScope.scopeValue }</li>
		<li>애플리케이션 영역 : ${ applicationScope.scopeValue }</li>
	</ul>

	<!-- 실무에서는 동일한 속성명으로 저장하는 경우가 거의 없으므로
	 대부분 이와 같이 속성명 만으로 값을 출력할 수 있다.-->
	<h3>영역 지정 없이 속성 읽기</h3>
	<ul>
		<li>${scopeValue }</li>
	</ul>
	<!--
	포워드를 사용할 때는 JSP코드 보다는 액션 태그가 좀 더 편리하다. 
	포워드란 현재 페이지가 받은 요청을 그 다음 페이지로 전달하는 것을 말한다.
	요청을 공유하는 개념이므로 request영역이 공유된다.
	-->
	<jsp:forward page="E02_ImplicitForwardResult.jsp"></jsp:forward>
	<%--
	//JSP를 이용한 포워드 방법. 위와 비교하면 길다.
	request.getRequestDispatcher("E02_ImplicitForwardResult.jsp")
	.forward(request, response);
	--%>

</body>
</html>