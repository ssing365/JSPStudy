<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2", "10");

pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList());
%>
<html>
<meta charset="UTF-8">
<head>
<title>표현 언어(EL) - 연산자</title>
</head>
<body>
	<!-- 
null이거나, 빈 문자열이거나, 길이가 0인 컬렉션 혹은 배열일 때
empty 연산자는 true를 반환한다. 즉 인스턴스가 비었는지 확인한다. -->
	<h3>empty 연산자</h3>
	empty nullStr : ${ empty nullStr }
	<br /> empty emptyStr : ${ empty emptyStr }
	<br /> empty lengthZero : ${ empty lengthZero }
	<br /> empty sizeZero : ${ empty sizeZero }

	<!-- EL식 내부에 Java와 동일한 형태로 기술하면 된다.  -->
	<h3>삼항 연산자</h3>
	num1 gt num2 ? "참" : "거짓" => ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }

	<!-- EL에서 +연산자로 덧셈 기능만 수행할 수 있다. 문자열의 연결에는 사용되지않는다. -->
	<h3>+ 연산자는 덧셈만 가능</h3>
	<!-- 문자열 34가 자동으로 정수로 변환되여 연산된다. Integer.ParseInt()를 적용한것과 동일한 결과가 반환된다. -->
	num1 + "34" : ${ num1 + "34" }
	<br />
	<!-- 하지만 숫자와 문자열 혹은 문자열과 문자열의 경우에는 덧셈 연산이 불가능하므로 예외가 발생한다. -->
	num2 + "이십" : \${num2 + "이십" }
	<br /> "삼십" + "사십" : \${"삼십" + "사십" }

</body>
</html>
