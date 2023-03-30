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
</style>
<!-- main -->
<main>
	<div id="main_container">
	<input type="hidden" value="${user.me_id}" name="userId">
	<input type="hidden" value="gather" name="ga_table">
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

	<!-- Modal -->
	<div id="temporary-save-modal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; border: 1px solid #ccc; padding: 20px; z-index: 9999;">
	    <h2>임시등록이 완료되었습니다.</h2>
	</div>
	<div id="modal-background" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 9998;"></div>
<script>
$(document).ready(function() {
    // 임시 저장 버튼 클릭시
	$(".ts_btn").on("click", function() {
		
		 const ga_title = $("input[name='ga_title']").val();
		 const ga_content = $("textarea[name='ga_content']").val();
		 	alert(ga_title);
		 	alert(ga_content);
			if (!ga_title || !ga_content) {
		        alert('제목과 내용을 모두 입력해주세요.');
		        return;
		    }
		const data = {
				te_title: $("input[name='ga_title']").val(),
			    te_content: $("textarea[name='ga_content']").val(),
			    te_me_id: $("input[name='userId']").val(),
			    te_st_num: $("#choose_study").val(),
			    te_table: $("input[name='ga_table']").val()
			};
			//ajax
			$.ajax({
			    url: '<c:url value="/temporary/save"/>',
			    method: 'POST',
			    data: JSON.stringify(data), //
			    contentType: 'application/json', //
			    success: function (response) {
			        if (response == "success") {
			            $("#temporary-save-modal").show();
			            $("#modal-background").show();
			        } else {
			            alert('임시저장에 실패하였습니다1');
			        }
			    },
			    error: function () {
			        alert('임시저장에 실패했습니다2');
			    }
			});
    });
    
	// 모달창 외를 클릭했을때 닫기
    $("#modal-background").on("click", function() {
        $("#temporary-save-modal").hide();
        $("#modal-background").hide();
    });
	
    
  
});


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