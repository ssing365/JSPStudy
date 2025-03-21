<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - choose/when/otherwise</title>
</head>
<body>
	<!-- 
	choose~when~otherwise 태그
		: 여러 개의 조건이 있는 경우 사용할 수 있는 태그로 if 태그를 보완하는 기능을 가지고 있다. -->
	<!-- 변수선언 -->
	<c:set var="number" value="100"></c:set>
	
	<h4>choose 태그로 홀짝 판단하기</h4>
	<!-- number를 2로 나눈 나머지가 0이면 짝수로 판단하고 아니면 홀수로 판단하는 문장 -->
	<c:choose>
		<c:when test="${number mod 2 eq 0 }">${number }는 짝수입니다.
		</c:when>
		<c:otherwise>
			<!-- if문의 else와 동일한 역할을 한다. 위의 조건에 만족하지 않을 때 실행된다. -->
			${number }는 홀수입니다.
		</c:otherwise>
	</c:choose>
	<!-- 
	choose태그와 when태그 사이에 HTML주석을 기술하면 에러가 발생한다.
	또한 when과 otherwise사이에도 기술하면 안된다. -->
	
	<h4>국영수 점수를 입력하면 평균 내어 학점 출력</h4>
	<form>
		국어 : <input type="number" max='100' name="kor" required /><br/>
		영어 : <input type="number" max='100' name="eng" required /><br/>
		수학 : <input type="number" max='100' name="math" required/><br/>
		<input type="submit" value="학점 구하기"/>
	</form>
	
	<c:if test="${not (empty param.kor or empty param.eng or empty param.math) }">
		<!-- 평균 계산. EL은 자동형변환이 지원되므로 경우에 따라 실수의 결과가 나올 수 있다. -->
		<c:set var="avg" value="${(param.kor+ param.eng + param.math) / 3  }"></c:set>
		평균점수는 ${avg }로
		<c:choose>
			<c:when test="${avg >= 90 }"> A학점</c:when>
			<c:when test="${avg >= 80 }"> B학점</c:when>
			<c:when test="${avg >= 70 }"> C학점</c:when>
			<c:when test="${avg >= 60 }"> D학점</c:when>
			<c:otherwise>F학점</c:otherwise>
		</c:choose>
		입니다.
	</c:if>
</body>
</html>