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
	<input type="hidden" value="${ga.ga_st_num}" name="ga_st_num">
		<div class="main_title">
			<h1>모집글 수정</h1>
		</div>
		<div class="temporary_storage_box">
			<c:if test="${user != null }">
				<button class="call_temporary_storage" id="openModal">
					임시저장 불러오기
				</button>
			</c:if>
			
			  <!-- Modal -->
			    <div id="temporary-list-modal" class="modal-style" style="display: none;">
			      <h2>임시 게시글<button id="deleteAll">전체 삭제</button></h2>
			      <ul id="itemList">
				        <li>
				            <span class="temp-title" data-title="${temp.te_title}" data-content="${temp.te_content}"></span>
               				<button class="deleteBtn" data-id="${temp.te_num}">삭제</button>
				        </li>
			      </ul>
			      
			    </div>
			    <div id="modal-background" class="modal-background" style="display: none;"></div>
			  </div>
		
		<form action="<c:url value='/gather/update/${ga.ga_num}'></c:url>" method="post">			
			<h2>모집할스터디</h2>
			<select id="choose_study" name="ga_st_num">
			 	<c:forEach var="study" items="${studies}">
                	<option value="${study.st_num}" <c:if test="${ga.ga_st_num == study.st_num}">selected</c:if>>${study.st_name}</option>
           		</c:forEach>
			</select>	
			<h2>제목</h2>
			<div class="recruit_title_box">
				<input type="text" class="recruit_title" placeholder="제목 10자 이내" maxlength="10" name="ga_title" value="${ga.ga_title}">
			</div>
			<h2>내용</h2>
			<textarea id="summernote" name="ga_content" value="${ga.ga_content}"></textarea>
			<div class="btn_box">
				<button type="button" class="ts_btn">임시저장</button>
				<button type="submit" class="write_complete_btn">수정완료</button>

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
    
	function loadTemporaryList() {
	    $.ajax({
	        url: '<c:url value="/temporary/list"/>',
	        method: 'GET',
	        success: function(response) {
	            // 임시저장 목록을 업데이트
	            $('#itemList').empty(); // 기존 목록 삭제
	            response.forEach(function(temp) {
	                $('#itemList').append('<li><span class="temp-title" data-title="' + temp.te_title + '" data-content="' + temp.te_content + '">' + temp.te_title + '</span><button class="deleteBtn" data-id="' + temp.te_num + '">삭제</button></li>');
	            });
	        },
	        error: function() {
	            alert('임시저장 목록을 가져오는데 실패했습니다.');
	        }
	    });
	}
    //임시저장 불러오기를 클릭했을때
    $("#openModal").click(function () {
	    loadTemporaryList();
	    $("#temporary-list-modal").show();
	    $("#modal-background").show();
	});
    
    	

	$("#modal-background").click(function () {
		$("#temporary-list-modal").hide();
		$("#modal-background").hide();
		  });
    
	// 모달창 외를 클릭했을때 닫기
    $("#modal-background").on("click", function() {
        $("#temporary-save-modal").hide();
        $("#modal-background").hide();
    });
  //전체 삭제
    $('#deleteAll').on('click', function() {
        $.ajax({
            url: '<c:url value="/temporary/deleteAll" />',
            type: 'POST',
            success: function(response) {
                if (response == "success") {
                    $('#itemList').empty();
                } else {
                    alert('전체 삭제에 실패하였습니다.');
                }
            },
            error: function(error) {
                alert('전체 삭제에 실패하였습니다.');
            }
        });
    });
  //개별 삭제
      $(document).on('click', '.deleteBtn', function() {
      const id = $(this).data('id');
    
    	$.ajax({
        url: '<c:url value="/temporary/delete/' + id + '" />',
        type: 'POST',
        success: function(response) {
            loadTemporaryList();
        },
        error: function(error) {
            alert('삭제 실패');
        }
    });
});
	
    $('#itemList').on('click', '.temp-title', function() {
        const title = $(this).data('title');
        const content = $(this).data('content');

    
        $('input[name=ga_title]').val(title);
        $('#summernote').summernote('code', content);

        
        $("#temporary-list-modal").hide();
        $("#modal-background").hide();
    });
    
    
  
});

$('form').submit(function(){
	let user = $('[name=userId]').val();
	let title = $('[name=ga_title]').val();
	let content = $('[name=ga_content]').val();
	if(title.trim().length == 0){
		alert('제목을 입력하세요.');
		return false;
	}
	if(content.trim().length == 0){
		alert('내용을 입력하세요.');
		return false;
	}

})

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
	
	$('#summernote').summernote('code',`${ga.ga_content}`);
	
</script>