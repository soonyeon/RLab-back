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
<div class="left_menu_container_top">
    <div class="left_menu_container" style="float:left;">
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
    <div class="inner_board_box">
        <h1 class="board_title">${bd.bo_title}</h1>
        <div class="writer_and_scrap">
            <div class="writer_main">
                <div class="writer_box">
                    <a href="#" class="writer">
                        <img class="icon_writer" src="<c:url value='/resources/img/profile_img.png'></c:url>">
                        <input type="hidden" id="me_id" value="${bd.bo_me_id}">
                        <input type="hidden" id="current_page" value="1" />
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
                        <c:if test="${user != null && user.me_id == bd.bo_me_id}">
                        
                        <button type="button" id="update-btn" data-id="${bd.bo_num}">수정하기</button>
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
                <span class="comment_num"></span>
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
                <%--  <div class="cm_main_box">
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
                                     --%>
            </div>
        </div>
    </div>
    <div class="right-container">
        <!-- 메뉴바 3개 -->
        <div class="study_link_container">
            <div class="circle_now cc">
                <div class="now">NOW</div>
            </div>
            <div class="circle_star cc">

                <img class="star" src="<c:url value='/resources/img/favorite_star_on.png'></c:url>">
            </div>
            <div class="my_study_container">
                <div class="my_list_title">

                    <div class="my">MY</div>

                    <!-- <div class="my_study" >나의 스터디<button id="dropdown_btn">▼</button></div> -->
                </div>
                <div id="dropdown_list" style="display: none;">
                    <ul class="dropdown_list_ul">
                        <li class="dropdown_list_li">
                            <div class="dropdown_list_contents">
                                <p class="dropdown_list_contents_title">정보처리기사 스터디</p>
                                <div class="dropdown_list_contents_on_img"></div>
                                <div class="dropdown_hr"></div>
                            </div>
                        </li>
                        <li class="dropdown_list_li">
                            <div class="dropdown_list_contents">
                                <p class="dropdown_list_contents_title">정보처리기사 스터디</p>
                                <div class="dropdown_list_contents_off_img"></div>
                                <div class="dropdown_hr"></div>
                            </div>
                        </li>
                        <li class="dropdown_list_li">
                            <div class="dropdown_list_contents">
                                <p class="dropdown_list_contents_title">정보처리기사 스터디</p>
                                <div class="dropdown_list_contents_off_img"></div>
                                <div class="dropdown_hr"></div>
                            </div>
                        </li>
                        <li class="dropdown_list_li">
                            <div class="dropdown_list_contents">
                                <p class="dropdown_list_contents_title">정보처리기사 스터디</p>
                                <div class="dropdown_list_contents_off_img"></div>
                                <div class="dropdown_hr"></div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 접속상태 -->
    <div class="accessor">
        <div class="study_title">정보처리기사 스터디</div>
        <div class="accessor_container">
            <div class="circle_accessor">
                <div class="accessor_on"></div>
            </div>
            <div class="study_name">김돌탕</div><span class="your">YOU</span>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">김순연</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">김세영</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">김도현</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">이정현</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">가나다</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">라마바</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">사아나</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">s아나</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">s아나</div>
        </div>
        <div class="accessor_container">
            <div class="circle_accessor"></div>
            <div class="study_name">s아나</div>
        </div>

    </div>
</div>

<script>
    let page = 1; //댓글 페이지
    const boardNum = '${bd.bo_num}';
    const userId = '${user.me_id}';
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
        let currentPage = 1;
        let isLoading = false;

        $(window).scroll(function() {
            if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
                if (!isLoading) {
                    isLoading = true;
                    loadComments(currentPage + 1);
                }
            }
        });

        function loadComments(page) {
            // 기존 댓글 목록을 지우고 시작
            $('.comment_box').empty();
            $.ajax({
                url: '<c:url value="/comment/list/' + boardNum + '?page=' + page + '" />',
                type: 'POST',
                dataType: 'json',
                success: function(response) {
                    let comments = response.commentList;
                    let pageHandler = response.pageHandler;
                    let count = response.commentCount;



                    $.each(comments, function(index, comment) {
                        console.log(comment);
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
                    });
                    // 현재 페이지 값을 갱신
                    $('#current_page').val(page);

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
                co_me_id: me_id,
                co_content: commentContent,
                co_table: "board", //게시판 구분
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
                co_table: 'board',
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
                    loadComments(1); // 댓글 다시 불러오기
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

            updateComment(comment, $('#current_page').val());
        });

        $(document).on('click', '.cm_update_cancel_btn', function() {
            let originalContent = $(this).closest('.cm_top_box, .re_reply_top_box').find('.cm_update').val();
            $(this).closest('.cm_top_box, .re_reply_top_box').find('.cm_update').replaceWith('<div class="already_comment">' + originalContent + '</div>');

            $(this).siblings('.cm_update_confirm_btn').text('수정').addClass('cm_update_btn re_edit_btn').removeClass('cm_update_confirm_btn');
            $(this).remove();
        });

        function updateComment(comment, page) {
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
                        loadComments(page);
                    } else {
                        alert("댓글 수정에 실패했습니다. 다시 시도해주세요.");
                    }
                },
            });
        }


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