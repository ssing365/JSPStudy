<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>

	<table border="1" width="90%">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>
		<tr>
			<td>번호</td>
			<td>${dto.idx }</td>
			<td>작성자</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.postdate }</td>
			<td>조회수 ${ext}</td>
			<td>${dto.visitcount}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">${dto.content }
			<!-- 게시물 작성시 등록한 첨부파일이 있는 경우 -->
			<c:if test="${not empty dto.ofile}">
				<c:choose>	
					<c:when test="${mimeType eq 'img' }">
						<!-- 이미지출력 -->
						<img src="../Uploads/${dto.sfile }" style="max-width: 100%"/>
					</c:when>
					<c:when test="${mimeType eq 'audio'}">
						<!-- 오디오출력 -->
						<audio  controls="controls" >
							<source src="../Uploads/${dto.sfile }" type="audio/mp3" />
						</audio>
					</c:when>
					<c:when test='${ mimeType eq "video" }' >
					<!-- 동영상 출력 -->
					<br>
					<video src="../Uploads/${dto.sfile }" controls type="video/mp4">
						</video>
					</c:when>
				</c:choose> 
			</c:if>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<!-- 첨부한 파일이 있다면 다운로드 링크를 출력한다. --> <c:if
					test="${not empty dto.ofile }">
        	${dto.ofile }
        	<!-- 링크는 반드시 공백없이 한줄로! -->
					<a
						href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&idx=${dto.idx}">
						[다운로드] </a>
				</c:if>
			</td>
			<td>다운로드수</td>
			<td>${dto.downcount }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button"
					onclick="location.href = '../mvcboard/edit.do?idx=${param.idx}';">
					수정하기</button>
				<button type="button"
					onclick="location.href='../mvcboard/delete.do?idx=${param.idx}';">
					삭제하기</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">
					목록 바로가기</button>
			</td>
		</tr>
	</table>
</body>
</html>
<h3>퀴즈 1 삭제 컨펌</h3>


<script>
            function deleteConfirm(idx){
            	let c = confirm("게시물을 삭제하시겠습니까?")
            	if(c){
            		location.href = "../mvcboard/delete.do?idx="+idx;
            	}
            } 
            </script>
<button type="button" onclick="deleteConfirm(${param.idx});">
	삭제하기(confirm)</button>
<h3>퀴즈 2 작성자에게만 보이기</h3>
<c:if test="${sessionScope.UserId eq dto.id}">
	<script>
            function deleteConfirm(idx){
            	let c = confirm("게시물을 삭제하시겠습니까?")
            	if(c){
            		location.href = "../mvcboard/delete.do?idx="+idx;
            	}
            } 
            </script>
	<button type="button"
		onclick="location.href = '../mvcboard/edit.do?idx=${param.idx}';">
		수정하기</button>
	<button type="button" onclick="deleteConfirm(${param.idx});">
		삭제하기(confirm)</button>
</c:if>