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
	<!-- 
	영역에 저장된 속성에 EL로 접근할 때는 속성명이 중복되지 않는다면
	EL내장객체 없이 속성명 만으로 출력할 수 있다.
	Person 인스턴스의 경우 속셩명.멤버변수 형태로 기술하면 
	클래스에 선언된 getter를 자동으로 호출하여 값을 출력한다. -->
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<ul>
		<li>Person 객체 => 이름 : ${ personObj.name }, 나이 : ${personObj.age }</li>
		<li>String 객체 => ${ requestScope.stringObj}</li>
		<li>Integer 객체 => ${integerObj }</li>
	</ul>
	<h2>매개변수로 전달된 값 읽기</h2>
	<!-- 
	파라미터로 전달된 값을 읽을 때 아래 3가지 방법을 사용할 수 있다.
	1. param.파라미터명
	2. param['파라미터명'] (자바에선 아래 더블쿼트만 허용하는데, 싱글쿼트도 가능. 좀 더 발전된 언어라 생각할 수 있음)
	3. param["파라미터명"] 
	-->
	<ul>
		<!--
		파라미터로 전달되는 값은 항상 String타입으로 반환된다. 
		따라서 산술연산을 위해서는 반드시 숫자형식으로 변환해야한다.
		하지만 EL에서는 자동으로 형변환되므로 아래와같이 즉시 연산할 수 있다.(출력: 30)  -->
		<li>${ param.firstNum + param['secondNum'] }</li>
		<!-- 파라미터를 문자형식으로 (출력: 10 + 20) -->
		<li>${ param.firstNum } + ${ param["secondNum"] }</li>
	</ul>

</body>
</html>