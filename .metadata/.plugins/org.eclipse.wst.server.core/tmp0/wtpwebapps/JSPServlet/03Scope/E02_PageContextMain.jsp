<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*
page영역
: 하나의 페이지에서만 영역이 공유되고 페이지 이동,포워드된 페이지에서는 영역이 소멸되어 공유되지 않는다.
즉 해당 페이지에서만 사용할 수 있는 영역이다.
JSP에서의 영역은, 데이터를 저장하는 메모리라고 생각하면 된다.
*/
//정수형 데이터
pageContext.setAttribute("pageInteger", 1000);
//문자열 데이터
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
//개발자가 직접 정의한 클래스의 인스턴스
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
/* 
위에서는 3가지 형태의 인스턴스를 page영역에 저장한다.
저장시 setAttribute(속성명, 속성값) 메서드를 사용한다.
영역은 Object 기반으로 데이터를 저장하므로 모든 타입의 인스턴스를 저장할 수 있다.
Object클래스 : 자바 최상위 디렉터리. 모든 타입의 인스턴스를 저장할 수 있다.*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
	//정수를 읽을때는 Integer를 통해 자동언박싱한다.
	int pInteger = (Integer) (pageContext.getAttribute("pageInteger"));
	//문자열은 toString()을 통해 문자열로 반환받을 수 있다.
	String pString = pageContext.getAttribute("pageString").toString();
	//개발자가 직접 정의한 클래스는 원래의 타입으로 형변환한다.
	Person pPerson = (Person) (pageContext.getAttribute("pagePerson"));
	%>
	<ul>
		<!-- 자바의 기본클래스(integer, string)은 별도의 처리없이 내용을 출력할 수 있다. -->
		<li>Integer 객체 : <%=pInteger%>
		</li>
		<li>String 객체 : <%=pString%>
		<!-- Person클래스는 getter를 통해 내용을 출력한다. -->
		</li>
		<li>Person 객체 : <%=pPerson.getName()%>, <%=pPerson.getAge()%></li>
	</ul>

	<!-- 
	지시어를 통한 include는 포함시킬 페이지의 원본소스를 
	그대로 현재문서에 포함시킨 후 컴파일을 진행한다.
	따라서 동일한 페이지로 취급하므로 page영역이 그대로 공유된다.
	즉, include 처리한 페이지의 내용은 정상적으로 출력된다.
	 -->
	<h2>include된 파일에서 page영역 읽어오기</h2>
	<a href="E04_PageLocation.jsp">PageLocation.jsp 바로가기</a>

</body>
</html>