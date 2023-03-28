<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/css/board/detailBoard.css'></c:url>">
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<style>
 .note-editable {
 	background-color: white;
 }
</style>
<div class="left_menu_container_top" style="margin-left: 360px;float:left;">
<div class="left_menu_container">
                    <nav class="left_menu">
                        <a href="study_basic.html" class="list_item">스터디홈</a>
                        <a href="#" class="list_item">스터디 달력</a>
                        <a href="to_do_list.html" class="list_item">투두 리스트</a>
                        <a href="Daily Mission.html" class="list_item">데일리 미션</a>
                        <a href="certification_board.html" class="list_item">인증 게시판</a>
                        <a href="<c:url value='/board/list'></c:url>" class="list_item">자유 게시판</a>
                        <a href="#" class="list_item">스터디 관리</a>
                        <a href="#" class="leave">탈퇴하기</a>
                    </nav>
                </div>
</div>
  <div class="home_container">
                        <h2>자유게시판</h2>
                        <div class="inner_board_box" >
                            <h1 class="board_title">${bd.bo_title}</h1>
                            <div class="writer_and_scrap">
                                <div class="writer_main">
                                    <div class="writer_box">
                                        <a href="#" class="writer"> 
                                        <img class="icon_writer" src="<c:url value='/resources/img/profile_img.png'></c:url>">
                                        <input type="hidden" id="me_id" value="${bd.bo_me_id}">
                                        <span class="writer_name">${bd.me_name}</span></a>
                                    </div> 
                                    <span class="write_date">${bd.bo_reg_date_str}</span>
                                    <div class="view_box">
                                        <img class="icon_view" src="<c:url value='/resources/img/view_lightgray.png'></c:url>">
                                        <span class="view">${bd.bo_views}</span>
                                    </div>
                                </div>
                                <div class="sc_and_mo_main">
                                    <div class="scrap_box">
                                        <img class="icon_scrap" src="<c:url value='/resources/img/favorite_tag_white.png'></c:url>">
                                    </div>
                                <div class="more_box">
								  <img class="icon_more" src="<c:url value='/resources/img/dot_menu.png'></c:url>">
								  <div class="dropdown-menu">
								    <button type="button" id="update-btn" data-id="${bd.bo_num}">수정하기</button>
								 <c:if test="${user != null && user.me.id == board.bo_me_id}">
								    	<button id="delete-btn" type="button">삭제하기</button>
								 </c:if>
								  </div>
								</div>
                                </div>
                            </div>
                            <div class="board_content">
                                <span>${bd.bo_content}</span>
                            </div>
                            <div class="scrap_and_comment">
                                <div class="scrap_bottom">
                                    <img class="icon_scrap" src="<c:url value='/resources/img/favorite_tag_white.png'></c:url>">
                                    <span>스크랩</span>
                                    <span class="scrap_num"></span>
                             </div>
                                <div class="comment_bottom">
                                    <img class="icon_comment" src="<c:url value='/resources/img/speech_bubble.png'></c:url>">
                                    <span>댓글</span>
                                    <span class="comment_num">12</span>
                                </div>
                            </div>
                            <div class="main_bottom_box">
                                <div class="add_comment_box">
                                    <div class="cm_input_box">
                                        <input type="text" class="cm_write" placeholder="궁금한 점을 댓글로 작성해보세요!">
                                    </div>
                                    <button class="cm_upload_btn">등록</button>
                                </div>
                                <div class="comment_box">    
                                    <div class="cm_main_box">
                                        <div class="cm_top_box">
                                            <div class="cm_writer">
                                                <a href="#" class="cm_mypage"> 
                                                    <i class="img_mypage"></i> 
                                                    <span class="nick_name">도라미</span>
                                                    <span class="write_date">2023.02.28</span>
                                                </a> 
                                            </div> 
                                            <div class="comment_btn_box">
                                                <button class="cm_plus_btn"> <img class="reply_icon" src="<c:url value='/resources/img/reply.png'></c:url>">답글달기</button>
                                                <button class="cm_delete_btn">X삭제하기</button>
                                            </div>
                                            <div class="already_comment">안녕하세요!언제까지 모집하시나요?제가이번주에는 일이있어서 당장 참여는 불가능해요.</div>
                                        </div>
                                    </div> 
                                    <div class="re_reply_main_box">
                                        <div class="re_reply_top_box">
                                            <img class="re_reply_icon src=""<c:url value='/resources/img/reply.png'></c:url>">
                                            <div class="re_writer">
                                                <a href="#" class="re_mypage"> 
                                                    <i class="img_mypage"></i> 
                                                    <span class="re_nick_name">김돌탕</span>
                                                    <span class="re_write_date">2023.02.28</span>
                                                </a> 
                                            </div>
                                            <div class="reply_btn_box">
                                                <button class="re_edit_btn">수정하기</button>
                                                <button class="re_delete_btn">X삭제하기</button>
                                            </div>
                                            <div class="re_reply_comment">안녕하세요!언제까지 모집하시나요?제가이번주에는 일이있어서 당장 참여는 불가능해요.</div>
                                        </div>
                                    </div>
                                    
                                </div>
                             </div> 
                        </div>
                     </div>
                     
<script>
const boardNum = '${bd.bo_num}';
let scrapCount = '${scrapCount}';
let mo_id = '${bd.bo_me_id}';
let me_id = $('#me_id').val();
$(document).ready(function() {
	//스크랩수 적용
	$('.scrap_num').text(scrapCount);
	
    var iconMore = $('.icon_more');
    var dropdownMenu = $('.dropdown-menu');

    iconMore.on('click', function() {
      dropdownMenu.css('display', dropdownMenu.css('display') === 'block' ? 'none' : 'block');
    });

    $(document).on('click', function(e) {
      if (!$(e.target).closest('.more_box').length) {
        dropdownMenu.css('display', 'none');
      }
    });
    
 
    $('.icon_scrap').on('click', function() {
        scrap();
    });


    function scrap() {
        // 데이터
        var requestData = {
            sc_me_id: mo_id,
            sc_bo_num: boardNum
        };

        $.ajax({
        	url: '<c:url value="/scrap" />',
            type: 'POST',
            contentType: "application/json",
            data: JSON.stringify(requestData),
            success: function(response) {
                // 스크랩 상태를 업데이트
                if (response.scrapState === 1) {
                    $('.icon_scrap').attr('src', '<c:url value="/resources/img/favorite_tag.png" />');
                    alert('스크랩을 했습니다.');
                } else {
                    $('.icon_scrap').attr('src', '<c:url value="/resources/img/favorite_tag_white.png" />');
                    alert('스크랩을 취소 했습니다.');
                }

                // 스크랩 개수를 업데이트
                $('.scrap_num').text(response.scrapCount);
            },
            error: function(error) {
                alert('스크랩에 실패하였습니다. 다시 시도해주세요');
            }
        });
    }
  });
  
$(document).ready(function() {
	<!--댓글-->
	function loadComments(page) {
	    $.ajax({
	    	url: '/comments/list/' + co_ex_num + '?page=' + page,
	        type: 'POST',
	        dataType: 'json',
	        success: function(response) {
	            var comments = response.commentList;
	            var pageHandler = response.pageHandler;

	            $.each(comments, function(index, comment) {
	                var listHtml = '';

	                listHtml += '<div class="comment_box">';
	                listHtml += '<div class="cm_main_box">';
	                listHtml += '<div class="cm_top_box">';
	                listHtml += '<div class="cm_writer">';
	                listHtml += '<a href="#" class="cm_mypage">';
	                listHtml += '<i class="img_mypage"></i>';
	                listHtml += '<span class="nick_name">' + comment.co_me_id + '</span>'; 
	                listHtml += '<span class="write_date">' + comment.write_date + '</span>'; 
	                listHtml += '</a>';
	                listHtml += '</div>';
	                listHtml += '<div class="comment_btn_box">';
	                listHtml += '<button class="cm_plus_btn"> <img class="reply_icon" src="<c:url value="/resources/img/reply.png"></c:url>">답글달기</button>';
	                listHtml += '<button class="cm_delete_btn">X삭제하기</button>';
	                listHtml += '</div>';
	                listHtml += '<div class="already_comment">' + comment.co_content + '</div>';
	                listHtml += '</div>';
	                listHtml += '</div>';
	                listHtml += '</div>'; 

	                $('#comment_list').append(listHtml); // 생성된 HTML 문자열을 댓글 목록 영역에 추가
	            });

	          
	            if (pageHandler.totalPage > pageHandler.currentPage) {
	                $('#load_more_comments').show().off('click').on('click', function() {
	                    loadComments(pageHandler.currentPage + 1);
	                });
	            } else {
	                $('#load_more_comments').hide();
	            }
	        },
	        error: function(xhr, textStatus, errorThrown) {
	            console.log('댓글 목록 로딩 실패: ', textStatus);
	        }
	    });
	}

	// 초기 페이지 로딩
	loadComments(1);
	
	
	  $(".cm_upload_btn").click(function() {
		let commentContent = $(".cm_write").val();
		
		if(!commentContent.trim()) {
			alert("댓글을 입력 해주세요.")
			return;
		}
		
		let comment = {
			co_me_id : me_id,
			co_content: commentContent,
			co_table: "자유게시판", //게시판 구분
			co_ex_num: boardNum
		};
		
		$.ajax({
			url: '<c:url value="/comment/create" />',
			type: "POST",
	        contentType: "application/json",
	        dataType: "json",
	        data: JSON.stringify(comment),
	        success: function (response) {
	        	if (response.result === "success") {
                    alert("댓글이 등록되었습니다.");
                    // 댓글 목록 불러오기
	        	}else {
	        		alert("댓글 등록에 실패했습니다.");
	        	}
	        }
		});
	});
	
	  $('#update-btn').click(function() {
		let bo_num = $(this).data('id');
		window.location.href = `<c:url value='/board/update/'/>${bo_num}`;
	   });
	  
	  $('#delete-btn').click(function() {
	    if (confirm('게시글을 삭제하시겠습니까?')) {
	      $.ajax({
	        url: '<c:url value="/board/delete/${bd.bo_num}" />',
	        type: 'POST',
	        success: function(response) {
	          alert('게시글이 삭제되었습니다.');
	          window.location.href = '<c:url value="/board/list" />';
	        },
	        error: function(error) {
	          alert('게시글 삭제에 실패하였습니다.');
	        }
	      });
	    }
	  });
	});
</script>