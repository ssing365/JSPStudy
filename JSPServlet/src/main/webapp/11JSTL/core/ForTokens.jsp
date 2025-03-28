<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forTokens</title>
</head>
<body>
<!-- 
forTokens 태그 : 문자열에서 특정 구분자를 통해 반환된 배열의 크기만큼 반복해야할때 사용한다.
속성]
	items : 구분자를 포함한 문자열을 지정한다. 컬렉션이나 배열은 사용할 수 없다.
	delims(Delimiter) :  구분자. 여러가지 특수기호('-', '콤마', '/', ';')를 사용할 수 있다.
	var : 구분자를 통해 잘라낸 토큰을 저장한다.
	* 토큰이란? :문법적으로 의미있는 최소단위. 하이픈으로 구분되는 전화번호를 분리했을때 각 번호가 토큰. 
	-->
	<%
	String rgba = "Red, Green, Blue, Black";
	%>
	<h4>JSTL의 forTokens태그 사용</h4>
	<!-- 콤마를 기준으로 문자열을 잘라낸 뒤 하나씩 출력한다. -->
	<c:forTokens items="<%= rgba %>" delims="," var="color">
		<span style="color:${color};">${color }</span>
	</c:forTokens>
	<h4>StringTokenizer 클래스 사용</h4>
	<%
	StringTokenizer tokens = new StringTokenizer(rgba, ",");
	out.print("토큰 수 : "+tokens.countTokens()+"<br/>");
	while(tokens.hasMoreTokens()){
		String t = tokens.nextToken();
		out.print(t);
	}
	%>
	<h4>String클래스의 split메서드 사용</h4>
	<%
	/* split("구분자") : 구분자로 구분한 후 배열로 반환한다. */
	String[] colorArr = rgba.split(",");
	for(String color:colorArr){
		out.print(color + "<br/>");
	}
	%>
</body>
</html>