<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/board/insertBoard.css'></c:url>">
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
<div id="main_container" style="width: 800px;margin-left: 630px;">
			   
              <div class="main_title"> 
                <h1>자유게시판 작성</h1> 
              </div> 
              <div class="temporary_storage_box"> 
                <button class="call_temporary_storage">임시저장 불러오기
									<span>|</span> 
									<span>1</span> 
								</button> 
              </div> 
              <form action="<c:url value='/board/insert'></c:url>" method="post"> 
              	 <input type="hidden" value="${memberId}}">
                <h2>스터디명</h2> 
                <select id="choose_study" name="bo_st_num">
                	<c:forEach var="study" items="${studies}">
                		<option value="${study.st_num}">${study.st_name}</option>
           			</c:forEach>
                </select> 
                <h2>제목</h2> 
                <div class="recruit_title_box"> 
                  <input type="text" class="bo_title" name="bo_title" placeholder="제목 10자 이내" maxlength="10"> 
                </div> 
                <h2>내용</h2> 
								<textarea id="content" name="bo_content"></textarea>  
              
							<div class="btn_box">
								<button class="ts_btn" type="button">임시저장</button>
								<button class="write_complete_btn" type="submit">작성완료</button>
							</div>
			</form>
</div> 
<script>
    $('form').submit(function() {
        let title = $('[name=bo_title]').val();
        let content = $('[name=bo_content]').val();
        if (title.trim().length == 0) {
            alert('제목을 입력하세요.');
            return false;
        }
        if (content.trim().length == 0) {
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