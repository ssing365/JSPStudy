<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL-import</title>
</head>
<body>
<!-- 
import 태그
: 외부 문서를 현재 문서에 포함시킨다. 
	include 지시어처럼 외부문서를 먼저 포함시킨 후 컴파일하는 형식이 아니라,
	include 액션태그처럼 컴파일이 완료된 결과물을 포함시킨다.
	서로 다른 페이지이므로 page영역은 공유되지 않고, request영역만 공유된다.
	url속성에 절대경로를 사용하는 경우 컨텍스트루트(여기선 JSPServlet)는 포함하지 않는다. -->
<c:set var = "requestVar" value="MustHave" scope="request"></c:set>
<!-- 
import 태그에서 var속성을 
	미 사용 시 : include와 동일하게 현재 위치에 즉시 외부문서를 포함시킨다.
	사용 시 : var에 지정한 변수에 문서의 내용이 저장된다.
			이 변수를 필요한 위치에서 EL을 통해 출력하면 됨.
			선언과 출력을 별도로 할 수 있어 코드의 가독성이 높아진다.
-->
<c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
	<c:param name="user_param1" value="JSP"></c:param>
	<c:param name="user_param2" value="기본서"></c:param>
</c:import>
<!-- import태그의 하위태그로 param을 사용할 수 있다. 
	쿼리스트링을 통해 전달하듯 페이지로 파라미터를 전달한다.-->

<h4>다른 문서 삽입하기</h4>
<!-- 앞에서 import한 문서의 내용이 여기서 출력된다. -->
${contents }
<h4>외부 자원 삽입하기</h4>
<iframe src="../inc/GoldPage.jsp" style="width:100%; height:600px;"
frameborder="1"></iframe>

</body>
</html>