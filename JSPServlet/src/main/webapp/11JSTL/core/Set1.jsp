<%@page import="java.util.Date"%>
<%@ page import="common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 이전 버전에서 사용했던 taglib지시어로 호환성을 위해 남겨져 있는 상태이다. 
따라서 현재 사용해도 문제는 없다. -->
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"--%>

<!-- JSTL 최신 버전에서 사용하는 지시어. 
Tomcat10.1부터 jakarta로 시작하는 패키지명을 사용하는 것에 따른 변화 -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 1</title>
</head>
<body>
<!-- 
set태그
: 변수를 선언할때 사용한다. JSP의 setAttribute()메서드와 동일한 기능을 수행한다.
즉 4가지 영역에 속성을 추가하게 된다.
	var : 속성명. 즉 영역에 저장할 이름
	value : 속성에 저장될 값
	scope : 4가지 영역명을 지정. 지정하지 않으면 가장 좁은 page영역에 저장됨
	target : set태그를 통해 생성된 자바빈즈의 이름을 지정
	property : target으로 지정한 자바빈즈의 멤버변수값을 지정한다.
-->
	<!-- 
	변수 선언 : 여기서는 가장 좁은 page영역에 저장된다.
	value에는 일반값, EL, 표현식을 모두 사용할 수 있다.
	또한 태그 사이에 value를 삽입할 수 있다. -->
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value="${directVar mod 5}" />
	<c:set var="expVar" value="<%=new Date()%>" />
	<c:set var="betweenVar">변수값 요렇게 설정</c:set> 

	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<!-- 속성명이 중복되지 않는다면 영역을 표시하는 내장객체(pageScope)를 생략할 수 있다. -->
		<li>directVar : ${pageScope.directVar}</li>
		<li>elVar : ${elVar}</li>
		<li>expVar : ${expVar}</li>
		<li>betweenVar : ${betweenVar}</li>
	</ul>


	<!-- 클래스의 인수생성자를 통해 인스턴스를 생성한 후 request영역에 저장한다.-->
	<h4>자바빈즈 생성 1 - 생성자 사용</h4>
	<!-- 아래 문장 작성 시 JSTL은 JSP코드이므로 value속성을 기술할 때
	인스턴스 생성을 위한 더블쿼테이션이 겹치는 경우가 발생할 수 있다.
	이때는 value를 싱글쿼테이션으로 감싸 겹치지 않게 처리해야한다. -->
	<c:set var="personVar1" value='<%=new Person("박문수", 50)%>'
		scope="request"></c:set>
	<!-- 자바빈의 getter를 통해 멤버변수의 값이 출력된다.
	Person.java 파일에서 getAge(getter)를 주석처리하면 age를 읽을수 없다고 한다.  
	멤버변수에 age가 50으로 되어있는데 오류 나는거 보면 getter로 가져오는걸 알 수 있음. -->
	<ul>
		<li>이름 : ${requestScope.personVar1.name }</li>
		<li>나이 : ${personVar1.age }</li>
	</ul>
	
	<h4>자바빈즈 생성 2 - target, property 사용</h4>
	<!-- 
	멤버변수 초기화 하지 않은 빈 인스턴스를 먼저 생성한 후 target, property를 통해 멤버변수 값 설정
	이때 자바빈의 setter를 사용하게 된다. -->
	<c:set var="personVar2" value="<%= new Person() %>" scope="request"></c:set>
	<c:set target="${personVar2 }" property="name" value="정약용"></c:set>
	<c:set target="${personVar2 }" property="age" value="60"></c:set>	
	<ul>
		<!-- requestScope 생략가능 -->
		<li>이름 : ${personVar2.name }</li>
		<li>나이 : ${requestScope.personVar2.age }</li>
	</ul>

</body>
</html>