<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnnoMapping.jsp</title>
</head>
<body>
	<h2>애너테이션으로 매핑하기</h2>
	<p>
		<strong>${message }</strong> <br /> 
		<!-- 
		request내장객체를 이용해 현재 프로젝트의 컨텍스트루트를 얻어온 후
		링크에 적용한다. 이런 경우 절대경로로 링크 설정 가능 -->
		<a href="<%=request.getContextPath()%>/12Serrvlet/AnnoMaping.kosmo">
		바로가기</a>
	</p>
</body>
</html>