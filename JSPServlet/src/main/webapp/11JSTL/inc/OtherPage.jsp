<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OtherPage.jsp</title>
</head>
<body>
<h4>OtherPage.jsp</h4>
<ul>
<!-- request 영역에 저장된 변수 출력 -->
	<li>저장된 값: ${requestVar }</li>
	<!-- 해당 파라미터는 param으로 결과 받음 -->
	<li>매개변수 1 : ${param.user_param1 }</li>
	<li>매개변수 2 : ${param.user_param2 }</li>
</ul>

</body>
</html>