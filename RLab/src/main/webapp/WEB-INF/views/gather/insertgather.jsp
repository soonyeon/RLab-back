<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"	href="<c:url value='/resources/css/gather/insertgather.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<style>
#summernote {
	width: 750px;
}
}
</style>
<!-- main -->
<main>
	<div id="main_container">
		<div class="main_title">
			<h1>모집글 작성</h1>
		</div>
		<div class="temporary_storage_box">
			<button class="call_temporary_storage" >
				임시저장 불러오기
			</button>
		</div>
		<form action="<c:url value='/gather/insertgather'></c:url>" method="post">			
			<h2>모집할스터디</h2>
			<select id="choose_study" name="ga_st_num">
			 	<c:forEach var="study" items="${studies}">
                	<option value="${study.st_num}">${study.st_name}</option>
           		</c:forEach>
			</select>
			<h2>제목</h2>
			<div class="recruit_title_box">
				<input type="text" class="recruit_title" placeholder="제목 10자 이내" maxlength="10" name="ga_title">
			</div>
			<h2>내용</h2>
			<textarea id="summernote" name="ga_content" ></textarea>
			<div class="btn_box">
				<button type="button" class="ts_btn">임시저장</button>
				<button type="submit" class="write_complete_btn">작성완료</button>
			</div>
		</form>
	</div>
</main>
<script>
	$('#summernote').summernote(
			{
				tabsize : 2,
				height : 500,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
	
	
</script>