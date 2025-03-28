<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach1</title>
</head>
<body>
	<!-- 
	forEach태그의 일반 for문 형태
		속성]
			begin : 반복문의 시작값
			end : 종료값
			step : 증가치(생략할 경우 1로 고정)
			var : 반복에 사용할 변수
	 -->
	<h4>일반 for문 형태의 forEach태그</h4>
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${i} 입니다.</p>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<!-- 
	일반 for문에서의 varStatus 속성
	: 반복과 관련된 정보를 추상화한 클래스를 통해 정보를 반환한다.
		count : 실제 반복횟수 반환. 1부터 시작
		index : 변수 i의 변환하는 값을 반환
		first : 루프의 처음일 때 true를 반환
		last : 루프의 마지막에 true
		current : 현재 루프의 변수값을 반환(var속성에 지정된 변수)
		* 즉, 일반 for문에서는 index와 current는 동일한 값을 반환한다.
	 -->
	<table border="1">
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<tr>
			<td>count : ${loop.count }</td>
			<td>index : ${loop.index }</td>
			<td>current : ${loop.current }</td>
			<td>first: ${loop.first }</td>
			<td>last : ${loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<!-- 변수 j가 1~100까지 1씩 증가한다. step은 생략시 1로 지정됨 -->
	<c:forEach begin="1" end="100" var="j">
		<!-- if(j%2 ! =0)와 동일한 조건식. 즉 2로 나눠떨어지지 않는경우 -->
		<c:if test="${j mod 2 ne 0 }">
			<!-- sum에 증가하는 j를 누적해서 더해준다. -->
			<c:set var="sum" value="${sum + j }"></c:set>
		</c:if>
	</c:forEach>
	1~100 사이 정수 중 홀수의 합은? ${sum}
	
	<h2>퀴즈 01</h2>
	<p>패턴 찍기</p>
	<c:forEach begin="1" end="5" var="i" >
		<c:forEach begin="1" end="5" var="j">
			<c:if test="${ i eq j }" var="result">1</c:if>
			 <c:if test="${not result }" >0</c:if>
		</c:forEach>
		<br/>
	</c:forEach>
	
	<h2>퀴즈 02</h2>
	<p>위를 choose태그로 변경하기</p>
	<c:forEach begin="1" end="5" var="i" >
		<c:forEach begin="1" end="5" var="j">
			<c:choose>
				<c:when test="${ i eq j }">1
				</c:when>
				<c:otherwise>
				0
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<br/>
	</c:forEach>

</body>
</html>