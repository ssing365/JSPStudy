<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 동일한 속성명으로 4가지 영역에 속성을 저장한다. -->
<!-- 영역명 지정이 없으면 가장 좁은 page영역에 저장된다. -->
<c:set var="scopeVar" value="Page Value"></c:set>
<c:set var="scopeVar" value="Request Value" scope="request"></c:set>
<c:set var="scopeVar" value="Session Value" scope="session"></c:set>
<c:set var="scopeVar" value="Application Value" scope="application"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - remove</title>
</head>
<body>
<h4>출력하기</h4>
<ul>
	<li>scopeVar : ${scopeVar }</li>
	<li>requestScope.scopeVar : ${requestScope.scopeVar }</li>
	<li>sessionScope.scopeVar : ${sessionScope.scopeVar }</li>
	<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
</ul>

<h4>session 영역에서 삭제하기</h4>
<!-- JSP의 removeAttribute()와 동일하게 지정된 영역의 속성값을 제거한다. -->
<c:remove var="scopeVar" scope="session"></c:remove>
<ul>
<li>sessionScope.scopeVar : ${sessionScope.scopeVar }</li>
</ul>

<h4>scope 지정없이 삭제하기</h4>
<!-- remove 태그는 영역지정없이 삭제하는 경우 동일한 이름의 모든 속성이 한꺼번에 삭제된다.  -->
<c:remove var="scopeVar"></c:remove>
<ul>
	<li>scopeVar : ${scopeVar }</li>
	<li>requestScope.scopeVar : ${requestScope.scopeVar }</li>
	<li>applicaionScope.scopeVar : ${applicationScope.scopeVar }</li>
</ul>
</body>
</html>