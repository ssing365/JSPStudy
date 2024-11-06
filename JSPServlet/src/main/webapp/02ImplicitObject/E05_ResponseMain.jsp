<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 로그인 폼</h2>
	<%
	/* 
	get방식으로 전달된 loginErr 파라미터가 있는 경우에만 "로그인 실패"를 출력한다.
	첫 실행시에는 파라미터가 없는 상태이므로 메시지를 출력하지 않는다.
	*/
	String loginErr = request.getParameter("loginErr");
	if (loginErr != null)
		out.print("로그인 실패");
	%>
	<form action="./E06_ResponseLogin.jsp" method="post">
		아이디 : <input type="text" name="user_id" /><br /> 
		패스워드 : <input type="text" name="user_pwd" /><br /> 
		<input type="submit" value="로그인" />
	</form>

	<h2>2. HTTP 응답 헤더 설정하기</h2>
	<form action="./E08_ResponseHeader.jsp" method="get">
		날짜 형식 : <input type="text" name="add_date" value="2020-12-12 11:30" /><br />
		숫자 형식 : <input type="text" name="add_int" value="8282" /><br /> 
		문자 형식 : <input type="text" name="add_str" value="홍길동" /><br /> 
		<input type="submit" value="응답 헤더 설정 & 출력" />
	</form>
</body>

</html>