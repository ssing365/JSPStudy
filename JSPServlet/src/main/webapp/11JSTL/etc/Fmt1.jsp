<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
국제화 태그를 사용하기 위해 2개의 taglib 지시어 선언 
접두어 : Core - c, 국제화 - fmt
-->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt1</title>
</head>
<body>
	<h4>숫자 포맷 설정</h4>
	<c:set var = "number1" value="12345"></c:set>
	콤마 O : <fmt:formatNumber value="${number1 }" /><br />
	<!-- 
	groupingUsed: true - 세자리마다 컴마를 출력. 
	-->
	콤마 X : <fmt:formatNumber value="${number1 }" groupingUsed="false" /><br />
	
	<!--  
	type : currency인 경우 현재 통화기호로 출력. 통화 기호 변경 가능 
	-->
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum1"/>
	통화기호(원화) : ${printNum1 } <br />
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum1"
	currencySymbol="$"/> 
	통화기호(달러) : ${printNum1 } <br />
	
	<!-- 
	type : percent - value 속성값을 %단위로 변환해 출력.
	 -->
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
	퍼센트 : ${printNum2 }
	
	<!-- 
	Integer.parseInt()와 동일한 기능으로 문자열을 숫자로 변경
	pattern : 반환할 문자열의 패턴을 지정하여 파싱
	integerOnly : 소수점 이하를 절삭하여 정수부만 출력
	-->
	<h4>문자열을 숫자로 변경</h4>
	<c:set var="number2" value="6123,78901" />
	<!-- 
	pattern으로 주어진 부분을 분석하여 문자열을 숫자형식으로 파싱한다.
	-->
	<fmt:parseNumber value="${number2 }" pattern="00,000.00" var="printNum3"/>
	소수점까지 : ${printNum3 } <br />
	<fmt:parseNumber value="${number2 }" integerOnly="true" var="printNum4"/>
	정수 부분만 : ${printNum4} <br />
</body>
</html>