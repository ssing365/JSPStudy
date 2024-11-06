<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>List컬렉션 이용하기</h4>
	<%
	//Person 인스턴스를 저장할 수 있는 List 생성
	ArrayList<Person> pList = new ArrayList<Person>();
	pList.add(new Person("성삼문", 55));
	pList.add(new Person("박팽년", 60));
	%>
	<!-- request영역에 List를 저장한다. -->
	<c:set var="personList" value="<%= pList %>" scope="request"></c:set>
	<!-- 2개의 값중 0번 인덱스 출력. 
	List이므로 인덱스로 접근 가능, 차후 forEach 태그를 사용하면 전체 반복 출력 -->
	<ul>
		<li>이름 : ${requestScope.personList[0].name }</li>
		<li>나이 : ${personList[0].age }</li>
	</ul>
	
	<h4>Map 컬렉션 이용하기</h4>
	<!-- 
	Map의 Key는 Stirng, Value는 Person타입으로 정의한 후 2개의 인스턴스 저장 -->
	<%
	Map<String, Person> pMap = new HashMap<String, Person>();
	pMap.put("personArgs1", new Person("하위지", 65));
	pMap.put("personArgs2", new Person("이개", 67));
	%>
	<!-- request영역에 Map을 저장한다. -->
	<c:set var="personMap" value="<%= pMap %>" scope="request" />
	<ul>
		<!-- Map은 Key로 접근해 값을 출력한다.  -->
		<li>아이디 : ${ requestScope.personMap.personArgs2.name }</li>
		<li>비번 : ${ personMap.personArgs2.age }</li>
	</ul>
</body>
</html>