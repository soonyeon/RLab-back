<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/board/mypost_post.css'></c:url>">
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<style>
 .note-editable {
 	background-color: white;
 }
</style>
<div class="left_menu_container_top" style="margin-left: 118px">
<div class="left_menu_container">
                    <nav class="left_menu">
                        <a href="study_basic.html" class="list_item">스터디홈</a>
                        <a href="#" class="list_item">스터디 달력</a>
                        <a href="to_do_list.html" class="list_item">투두 리스트</a>
                        <a href="Daily Mission.html" class="list_item">데일리 미션</a>
                        <a href="certification_board.html" class="list_item">인증 게시판</a>
                        <a href="#" class="list_item">자유 게시판</a>
                        <a href="#" class="list_item">스터디 관리</a>
                        <a href="#" class="leave">탈퇴하기</a>
                    </nav>
                </div>
</div>
<div class="form-container" style="margin-left: 482px;">
	<button type="button" style="float:right">임시저장 불러오기</button><br>
<label for="st_num">스터디명</label><br>
<select name="bo_st_num" id="bo_st_num">
	<c:forEach var="study" items="${studies}">
		<option value="${study.st_num}">${study.st_name}</option>
	</c:forEach>
</select><br>
  <label for="bo_me_id">작성자</label><br>
	<input type="text" name="bo_me_id" value="${memberId}" readonly="readonly"><br>
 <label for="bo_title">제목</label><br>
	<input type="text" name="bo_title" placeholder="제목 10자 이내" maxlength="10" value="${bd.bo_title}"><br>
 <label for="bo_content">내용</label><br>
<textarea id="content" name="bo_content"></textarea>
 <div style="float: right">
	 <button type="button">임시저장</button><button type="submit">수정완료</button>
 </div>
 </div>
 
 <script>
   $('form').submit(function() {
	let title = $('[name=bo_title]').val();
	let content = $('[name=bo_content]').val();
	if(title.trim().length == 0) {
		alert('제목을 입력하세요.');
		return false;
	}
	if(content.trim().length == 0) {
		alert('내용을 입력하세요.');
		return false;
	}
})
 
   $('#content').summernote({
     tabsize: 2,
     height: 300,
     toolbar: [
       ['style', ['style']],
       ['font', ['bold', 'underline', 'clear']],
       ['color', ['color']],
       ['para', ['ul', 'ol', 'paragraph']],
       ['table', ['table']],
       ['insert', ['link', 'picture', 'video']],
       ['view', ['fullscreen', 'codeview', 'help']]
     ]
   });
 </script>