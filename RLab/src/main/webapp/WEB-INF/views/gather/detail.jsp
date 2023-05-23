<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/gather/detail.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<style>
 .note-editable {
 	background-color: white;
 }
</style>

<!-- main -->
<main>
	<div id="main_container">
		<div class="board_title">${ga.ga_title}
			<input type="hidden" value="${ga.ga_me_id}">
			
		</div>
		<div class="title_bottom">
			<div class="writer_box">
				<a href="#" class="writer">
					<c:if test="${meList.me_profile == null}">
						<img class="icon_writer" src="<c:url value='/resources/img/user.png'></c:url>"> 
					</c:if>
					<c:if test="${meList.me_profile != null}">
		    			<img class="icon_writer" src="<c:url value='/download${meList.me_profile}'></c:url>">
	    			</c:if> 

				</a>
			</div>
			
			<span class="write_date">${ga.ga_reg_date_str}</span>
			<div class="view_box">
				<img class="icon_view" src="<c:url value='/resources/img/view_lightgray.png'></c:url>">
				<span class="view">${ga.ga_views}</span>
			</div>
			
		</div>
		<h2>내용</h2>
		<div class="main_total_box">
			<div class="main_left_box">${ga.ga_content}</div>	
			<div class="main_right_box">
				<div class="rc_img_box">
					<c:if test="${file == null}">
						<div class="rc_img"></div>
					</c:if>
					<c:if test="${file != null}">
						<img style=" margin-top: 25px;  width: 200px;  height: 200px;  border-radius: 50%;  border: 1px solid black;  place-items: center;" 
							src="<c:url value='/download${file.fi_name}'></c:url>">
					</c:if>
				</div>
				<div class="rc_info_box">
					<div class="study_recruit_content_box">
						<span class="rc_title">${st.st_name}</span>
					</div>
					<div class="study_content">
						<c:if test="${st.st_state == 1 }">
							<div class="study_recruiting">
								<span>모집중</span> <span class="now_pp">${st.st_now_people}</span> <span>/</span> <span>${st.st_total_people}</span>
							</div>
						</c:if>
						<c:if test="${st.st_state == 0 }">
							<div class="study_recruiting">
								<span>모집완료</span>
							</div>
						</c:if>
							<div class="want_icon" >
								<c:if test="${user == null}" >
									<div class="unlike_img" id="userNull"></div>
								</c:if>	
								<c:if test="${user != null}">
									<c:if test="${waList.contains(st_num)}">
										<div class="like_img"></div>	
									</c:if>
									<c:if test="${!waList.contains(st_num)}">
										<div class="unlike_img"></div>	
									</c:if>
								</c:if>
							</div>
					</div>
					<div class="study_tag_info">
						<c:forEach items="${tgList}" var="ta" varStatus="vs">
							<c:if test="${ta.tr_st_num==st.st_num}">
								<span href="#" class="study_tag">${ta.tr_name}</span>
							</c:if>
						</c:forEach>
					</div>
					<div class="join_study">
				   		<c:if test="${user == null }">
						</c:if>
						<c:if test="${user != null && st.st_state == 1}">
							<c:if test="${smList != null && smList.sm_authority == 1}">
								<button class="already_apply_btn">스터디 가입 완료</button>
							</c:if>
							<c:if test="${smList == null}">
								<button class="apply_btn">스터디 가입</button>
							</c:if>
						</c:if>
						
					</div>
				</div>
				<c:if test="${user != null && user.me_id == ga.ga_me_id}">
					<div class="btns_leader">
						<a class="btn_edit" href="<c:url value='/gather/update/${ga.ga_num}'></c:url>" >모집글 수정</a>
						<button class="btn_delete" type="button">모집글 삭제</button>
					</div>
				</c:if>
			</div>
		</div>
	  <!-- 정현 댓글 작업 -->
		<div class="main_bottom_box">
			<h2>Q&A</h2>
            <div class="add_comment_box">
                <div class="cm_input_box">
                    <input type="text" class="cm_write" placeholder="궁금한 점을 댓글로 작성해보세요!">
                </div>
               
               
                <button class="cm_upload_btn">등록</button>
           
            </div>
            <div class="comment_box">
              
            </div>
        </div>
    </div>	
</main>

<script>
const userId1 = '${user.me_id}'; 
const gatherNum = '${ga.ga_num}';
const studyNum = '${st_num}';
let joinCount = '${joinCount}';

$(document).ready(function() {
	$('.want_icon').on('click', function() {
		want();
	});

	function want() {
    	// 데이터
	    var requestData = {
	    	wa_me_id: userId1,
	    	wa_ga_num: gatherNum
	    };
	    $.ajax({
	      url: '<c:url value="/want" />',
	      type: 'POST',
	      contentType: "application/json",
	      data: JSON.stringify(requestData),
	      success: function(response) {
	        if (response && response.wantState === 1) {
	        	 $('.unlike_img').removeClass('unlike_img').addClass('like_img');
	          alert('스터디를 찜 했습니다.');
	        } else if (response && response.wantState === 0) {
	        	 $('.like_img').removeClass('like_img').addClass('unlike_img');
	          alert('스터디 찜을 취소 했습니다.');
	        }
	      },
	      error: function(error) {
	    	  console.log(error)
	        alert('찜에 실패하였습니다. 다시 시도해주세요');
	      }
	      
	    });
	  }
});


$(document).ready(function() {
  $('.join_study').on('click', function() {
    join();
  });
  
  
  function join() {
    // 데이터
    var requestData = {
      sm_me_id: userId1,
      sm_st_num: studyNum
    };
    $.ajax({
      url: '<c:url value="/join" />',
      type: 'POST',
      contentType: "application/json",
      data: JSON.stringify(requestData),
      success: function(response) {
    	  if (response.joinState === 1) {
    	    $('.apply_btn').removeClass('apply_btn').addClass('already_apply_btn').text('스터디 가입 완료');
    	    alert('스터디를 가입했습니다.');
    	    location.reload();
    	  } else if (response.joinState === 0) {
    	    $('.already_apply_btn').removeClass('already_apply_btn').addClass('apply_btn').text('스터디 가입');
    	    alert('스터디 가입 취소했습니다.');
    	    location.reload();
    	    $('.now_pp').text(response.joinCount);
    	  } else if (response.joinState === -1) {
    	    alert(response.message);
    	  }
    	},
      error: function(error) {
    	  console.log(error)
        alert('스터디 가입에 실패하였습니다. 다시 시도해주세요');
      }
    });
  }
});

$('.btn_delete').click(function() {
    if (confirm('게시글을 삭제하시겠습니까?')) {
        $.ajax({
            url: '<c:url value="/gather/delete/${ga.ga_num}" />',
            type: 'POST',
            success: function(response) {
                alert('게시글이 삭제되었습니다.');
                window.location.href = '<c:url value="/gather/list/"/>';
            },
            error: function(error) {
                alert('게시글 삭제에 실패하였습니다.');
            }
        });
    }
});
</script>
<script>
/* 댓글 */
let page = 1; //댓글 페이지
const boardNum = '${ga.ga_num}';
const userId = '${user.me_id}';
let isLoading = false;
$(document).ready(function() {
    let currentPage = 1;

    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
            if (!isLoading) {
                isLoading = true;
                page = page+1;
                loadComments(page);
            }
        }
    })
});
function loadComments(page1) {

    $.ajax({
        url: '<c:url value="/comment/list/' + boardNum + '?page=' + page1 + '" />',
        type: 'POST',
        dataType: 'json',
        success: function(response) {
            let comments = response.commentList;
            let pageHandler = response.pageHandler;
            let count = response.commentCount;
            console.log(response);
            if(response.commentList.length == 0) {
				page = page-1;
				return;
			}

            $.each(comments, function(index, comment) {
            	 if (comment.co_table === 'gather') {
           		 if(comment.co_delete == 'Y') {
                    	 let cmStateHtml = '';
                       cmStateHtml += '<div class="cm_main_box">';
                       cmStateHtml += '<div class="cm_top_box">';
                       cmStateHtml += '<div class="already_comment">' + '삭제된 댓글입니다' + '</div>';
                       cmStateHtml += '</div>';
                       cmStateHtml += '</div>';
                       $('.comment_box').append(cmStateHtml);
                       return;
                  } 	
                if (comment.co_num == comment.co_ori_num) {
                    let listHtml = '';

                    listHtml += '<div class="cm_main_box">';
                    listHtml += '<div class="cm_top_box">';
                    listHtml += '<div class="cm_writer">';
                    listHtml += '<a href="#" class="cm_mypage">';
                    listHtml += '<i class="img_mypage"></i>';
                    listHtml += '<span class="nick_name">' + comment.me_name + '</span>';
                    listHtml += '<span class="write_date">' + comment.co_reg_date + '</span>';
                    listHtml += '</a>';
                    listHtml += '</div>';
                    listHtml += '<div class="comment_btn_box">';
                    listHtml += '<button class="cm_plus_btn" data-num="' + comment.co_num + '"> <img class="reply_icon" src="<c:url value="/resources/img/reply.png"></c:url>">답글달기</button>';
                    if (userId == comment.co_me_id) {
                        listHtml += '<button class="cm_update_btn" data-num="' + comment.co_num + '">수정하기</button>';
                        listHtml += '<button class="cm_delete_btn" data-num="' + comment.co_num + '">X삭제하기</button>';
                    }
                    listHtml += '</div>';
                    listHtml += '<div class="already_comment">' + comment.co_content + '</div>';
                    listHtml += '</div>';
                    listHtml += '</div>';

                    $('.comment_box').append(listHtml); // 생성된 HTML 문자열을 댓글 목록 영역에 추가
                } else {
                    let reReplyHtml = '';

                    reReplyHtml += '<div class="re_reply_main_box">';
                    reReplyHtml += '<div class="re_reply_top_box">';
                    reReplyHtml += '<img class="re_reply_icon" src="<c:url value="/resources/img/reply.png"></c:url>">';
                    reReplyHtml += '<div class="re_writer">';
                    reReplyHtml += '<a href="#" class="re_mypage">';
                    reReplyHtml += '<i class="img_mypage"></i>';
                    reReplyHtml += '<span class="re_nick_name">' + comment.me_name + '</span>';
                    reReplyHtml += '<span class="re_write_date">' + comment.co_reg_date + '</span>';
                    reReplyHtml += '</a>';
                    reReplyHtml += '</div>';
                    reReplyHtml += '<div class="reply_btn_box">';
                    if (userId == comment.co_me_id) {
                        reReplyHtml += '<button class="re_edit_btn" data-num="' + comment.co_num + '">수정하기</button>';
                        reReplyHtml += '<button class="re_delete_btn" data-num="' + comment.co_num + '">X삭제하기</button>';
                    }
                    reReplyHtml += '</div>';
                    reReplyHtml += '<div class="re_reply_comment">' + comment.co_content + '</div>';
                    reReplyHtml += '</div>';
                    reReplyHtml += '</div>';

                    $('.comment_box').append(reReplyHtml); // 생성된 답글 HTML 문자열을 댓글 목록 영역에 추가
                	}
            	 }
            });
            // 현재 페이지 값을 갱신
            $('#current_page').val(page1);
            isLoading = false;
            

        },
        error: function(xhr, textStatus, errorThrown) {
            console.log('댓글 목록 로딩 실패: ', textStatus);
            isLoading = false;
        }
    });
}


loadCommentCount();
setInterval(function() {
	loadCommentCount();
}, 10000);
loadComments(1);


$(".cm_upload_btn").click(function() {
    if ('${user.me_id}' == '') {
        alert('로그인을 해야 합니다.');
        return;
    }

    let commentContent = $(".cm_write").val();

    if (!commentContent.trim()) {
        alert("댓글을 입력 해주세요.")
        return;
    }

    let comment = {
        co_me_id: '${user.me_id}',
        co_content: commentContent,
        co_table: "gather", //게시판 구분
        co_ex_num: boardNum
    };

    $.ajax({
        url: '<c:url value="/comment/create" />',
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(comment),
        success: function(response) {
            if (response.result === "success") {
                alert("댓글이 등록되었습니다.");
                $('.comment_box').empty()
                loadComments(1);
            } else {
                alert("댓글 등록에 실패했습니다.");
            }
        }
    });
});
    
function loadCommentCount() {
	$.ajax({
	    url: '<c:url value="/comment/count/' + boardNum + '" />',
	    type: 'GET',
	    dataType: 'json',
	    success: function(response) {
	    	let count = response;
	    	$('.comment_num').text(count); 
	    },
	    error: function(xhr, textStatus, errorThrown) {
	    	console.log('댓글 수 로딩 실패: ', textStatus);
	    }
	});
}

    
//답글 버튼 클릭 이벤트
$(document).on('click', '.cm_plus_btn', function() {
    if ('${user.me_id}' == '') {
        alert('로그인을 해야 합니다.');
        return;
    }
    let co_ori_num = $(this).data('num');

    let listHtml =
        '<div class="add_comment_box">' +
        '<div class="cm_input_box">' +
        '<input type="text" class="cm_write" placeholder="답글을 작성해보세요!">' +
        '</div>' +
        '<button class="cm_reply_btn">답글등록</button>' +
        '</div>';


    $(this).closest('.cm_main_box').append(listHtml);
});

$(document).on('click', '.cm_reply_btn', function() {
    let replyContent = $(this).siblings('.cm_input_box').find('.cm_write').val();

    if (!replyContent) {
        alert('답글을 입력 해주세요');
        return;
    }

    //클릭한 답글 버튼의 댓글번호를 가져옴
    let co_ori_num = $(this).closest('.cm_main_box').find('.cm_plus_btn').data('num');

    let Data = {
        co_me_id: '${user.me_id}',
        co_content: replyContent,
        co_ori_num: co_ori_num,
        co_table: 'gather',
        co_ex_num: boardNum
    }

    $.ajax({
        url: '<c:url value="/comment/create" />',
        type: 'POST',
        data: JSON.stringify(Data),
        contentType: 'application/json',
        dataType: 'json',
        success: function(Data) {
            alert('대댓글 등록에 성공하였습니다.');
            $('.comment_box').empty()
            loadComments(1);
        },
        error: function(error) {
            alert('대댓글 등록에 실패했습니다. 다시 시도해주세요.');
        },
    })

})
//댓글,답글 삭제
$(document).on('click', '.cm_delete_btn, .re_delete_btn', function() {
    let co_num = $(this).data('num');
    let comment = {
        co_num: co_num
    }
    deleteComment(comment, page);
    console.log(comment);
});

function deleteComment(comment, page) {
    $.ajax({
        url: '<c:url value="/comment/delete" />',
        type: 'POST',
        data: JSON.stringify({
            co_num: comment.co_num
        }),
        contentType: 'application/json',
        dataType: 'json',
        success: function(response) {
            if (response.result == "success") {
                alert("댓글이 삭제되었습니다.");
                // 댓글 목록을 다시 불러옴
                 $('.comment_box').empty();
                loadComments(page);
            } else {
                alert("댓글 삭제에 실패했습니다. 다시 시도해주세요.");
            }
        },
        error: function(xhr, status, error) {
            console.error("Status:", status);
            console.error("Error:", error);
            alert("댓글 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
}
$(document).on('click', '.cm_update_btn, .re_edit_btn', function() {
    let co_num = $(this).data('num');
    let currentContentElement = $(this).closest('.cm_top_box, .re_reply_top_box').find('.already_comment, .re_reply_comment');
    let currentContent = currentContentElement.text();

    currentContentElement.replaceWith('<input type="text" class="cm_update" value="' + currentContent + '" style="border: none; background-color: transparent;">');

    $(this).text('수정완료').addClass('cm_update_confirm_btn').removeClass('cm_update_btn re_edit_btn');
    $(this).after('<button class="cm_update_cancel_btn">취소하기</button>');
    $(this).siblings('.cm_delete_btn, .re_delete_btn').css('visibility', 'hidden'); // 삭제하기 버튼 숨기기
});

$(document).on('click', '.cm_update_cancel_btn', function() {
    let originalContent = $(this).closest('.cm_top_box, .re_reply_top_box').find('.cm_update').val();
    $(this).closest('.cm_top_box, .re_reply_top_box').find('.cm_update').replaceWith('<div class="already_comment">' + originalContent + '</div>');

    let updateButton = $(this).siblings('.cm_update_confirm_btn');
    updateButton.text('수정').addClass('cm_update_btn re_edit_btn').removeClass('cm_update_confirm_btn');
    updateButton.siblings('.cm_delete_btn, .re_delete_btn').css('visibility', 'visible'); // 삭제하기 버튼 다시 보이게 만들기
    $(this).remove();
});

$(document).on('click', '.cm_update_confirm_btn', function() {
    let co_num = $(this).data('num');
    let updatedContent = $(this).closest('.cm_top_box, .re_reply_top_box').find('.cm_update').val();

    if (!updatedContent) {
        alert('댓글을 입력 해주세요');
        return;
    }

    let comment = {
        co_num: co_num,
        co_content: updatedContent
    };

    updateComment(comment, page);
});

$(document).on('click', '.cm_update_cancel_btn', function() {
    let originalContent = $(this).closest('.cm_top_box, .re_reply_top_box').find('.cm_update').val();
    $(this).closest('.cm_top_box, .re_reply_top_box').find('.cm_update').replaceWith('<div class="already_comment">' + originalContent + '</div>');

    $(this).siblings('.cm_update_confirm_btn').text('수정').addClass('cm_update_btn re_edit_btn').removeClass('cm_update_confirm_btn');
    $(this).remove();
});

function updateComment(comment, page) {
    $('.comment_box').empty();
    $.ajax({
        url: '<c:url value="/comment/update" />',
        type: 'POST',
        data: JSON.stringify({
            co_num: comment.co_num,
            co_content: comment.co_content
        }),
        contentType: 'application/json',
        dataType: 'json',
        success: function(response) {
            if (response.result == "success") {
                alert("댓글이 수정되었습니다.");
                // 댓글 목록을 다시 불러옴
                for(i=1;i<=page;i++){
                loadComments(i);
                console.log(i);
                }
            } else {
                alert("댓글 수정에 실패했습니다. 다시 시도해주세요.");
            }
        },
    });
}
</script>