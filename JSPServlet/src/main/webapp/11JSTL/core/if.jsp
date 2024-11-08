<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - if</title>
</head>
<body>
	<!-- if 태그 : 조건을 확인해 실행여부 판단 
속성
	test : EL을 이용해 조건식을 삽입한다.
	var : test속성에서 판단한 결과값을 저장한다.
-->
	<!-- 변수선언 -->
	<c:set var="number" value="101"></c:set>
	<c:set var="string" value="JSP"></c:set>

	<h4>JSTL의 if태그로 홀짝 판단하기</h4>
	<c:if test="${number mod 2 eq 0 }" var="result"> 
		${number} 는 짝수입니다.<br />
	</c:if>
	result: ${result }
	<br />

	<!-- 
	JSTL의 if태그는 else구문이 별도로 없으므로 if문과 반대의 조건을 만들어 
	2개의 if태그를 사용해야한다. -->
	<h4>문자열 비교와 else 구문 흉내내기</h4>
	<c:if test="${string eq 'Java' }" var="result2"> 문자열은 Java입니다.</c:if>
	<c:if test="${not result2 }">
	문자열은 Java가 아닙니다. <br />
	</c:if>

	<h4>조건식 주의사항</h4>
	<c:if test="100" var="result3">EL이 아닌 정수를 지정하면 false</c:if>
	result3:${result3}
	<br />
	<c:if test="tRuE" var="result4">대소문자 구분없이 true인 경우 true</c:if>
	result4:${result4}
	<br /> @@@@@@@ 각별 주의 @@@@@@@@ test(조건식) 앞뒤에 공백이 하나라도 들어가면 조건식에 상관없이
	무조건 false. ->
	<c:if test="${true} " var="result5">EL 양쪽에 공백 있는 경우 false</c:if>
	result5:${result5}
	<br />

	<h4>연습문제 : if태그</h4>
	<!--  
    아이디, 패스워드를 입력후 submit버튼을 누르면 EL식을 통해 파라미터를
    받은 후 kosmo/1234 인 경우에는 'kosmo님, 하이룽~'이라고 출력한다. 
    만약 틀렸다면 "아이디/비번을 확인하세요"라고 출력한다. 
    EL과 JSTL의 if태그만을 이용해서 구현하시오.
    -->
	<form method="get">
		아이디 : <input type="text" name="user" /> <br /> 패스워드 : <input
			type="text" name="pass" /> <br /> <input type="submit" value="로그인" />
	</form>
	<!-- 전송된 파라미터가 있을때만 실행되도록 하는 조건 -->
	<c:if test="${not empty param.user}"> 
		<!-- 아이디, 비번 일치 여부 판단 후 결과를 loginResult에 저장 -->
		<c:if test='${param.user eq "kosmo" and param.pass eq "1234"}'
			var="loginResult">${param.user}님, 하이룽~<br /></c:if>
		<c:if test='${not loginResult}'><script>alert("아이디/비번 확인하세요");</script><br /></c:if>
	</c:if>
</body>
</html>