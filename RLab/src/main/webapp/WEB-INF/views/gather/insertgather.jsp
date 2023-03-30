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
			<button class="call_temporary_storage">
				임시저장 불러오기 <span>|</span> <span>1</span>
			</button>
		</div>
		<form action="<c:url value='/gather/insertgather'></c:url>"
			method="post">
			<h2>모집할스터디</h2>
			<select id="choose_study">
				<option value="1">정처기 준비하는 스터디</option>
				<option value="2">독서 모임 토론</option>
				<option value="3">모각코</option>
				<option value="4">모집할 스터디</option>
			</select>
			<h2>제목</h2>
			<div class="recruit_title_box">
				<input type="text" class="recruit_title" placeholder="제목 10자 이내">
			</div>
			<h2>내용</h2>
			<div id="summernote"></div>

			<div class="btn_box">
				<button class="ts_btn">임시저장</button>
				<button class="write_complete_btn">작성완료</button>
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