<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach2</title>
</head>
<body>
	<!-- 
	forEach태그의 향상된 for문 형태
	: 주로 배열이나 컬렉션에서 값을 순차적으로 접근할 때 사용한다.
	속성 ] 
		items : 사용할 배열이나 컬렉션을 지정
		var : 해당 루프에서 반환해 준 인스턴스를 저장할 변수명을 지정 -->
	<h4>향상된 for문 형태의 forEach태그</h4>
	<%
	String[] rgba = { "Red", "Green", "Blue", "Black" };
	%>
	<c:forEach items="<%=rgba%>" var="c">
		<span style="color:${c};">${c}</span>
	</c:forEach>
	<h4>varStatus 속성 살펴보기</h4>
	<table border="2">
		<!-- 
		개선된 for문에서의 varStatus속성
		 	index : 현재 루프에서의 인덱스 표현 . 0부터 시작
			current : 현재 루프의 실제 요소를 반환
		 	count : 실제 반복횟수로 1부터 시작
			first/last : 처음과 마지막에 true 반환
		-->
		<c:forEach items="<%=rgba%>" var="c" varStatus="loop">
			<tr>
				<td>count : ${loop.count}</td>
				<td>index : ${loop.index}</td>
				<td>current : ${loop.current}</td>
				<td>first : ${loop.first}</td>
				<td>last : ${loop.last}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>