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
		<div class="board_title">${st.st_name}
			<input type="hidden" value="${ga.ga_me_id}">
			
		</div>
		<div class="title_bottom">
			<div class="writer_box">
				<a href="#" class="writer"> <img class="icon_writer"
					src="<c:url value='/resources/img/profile_img.png'></c:url>"> <span class="writer_name">${ga.me_name}</span></a>
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
					<div class="rc_img"></div>
				</div>
				<div class="rc_info_box">
					<div class="study_recruit_content_box">
						<span class="rc_title">${ga.ga_title}</span>
					</div>
					<div class="study_content">
						<div class="study_recruiting">
							<span>모집중</span> <span>${st.st_now_people}</span> <span>/</span> <span>${st.st_total_people}</span>
						</div>
							<div class="want_icon">
								<img class="like_icon" src="<c:url value='/resources/img/love_off.png'></c:url>" style="width: 40px; height: 40px;">
							</div>
					</div>
					<div class="study_tag_info">
						<c:forEach items="${tgList}" var="ta" varStatus="vs">
							<c:if test="${ta.tr_st_num==st.st_num}">
								<span href="#" class="study_tag">${ta.tr_name}</span>
							</c:if>
						</c:forEach>
					</div>
					<button class="apply_btn">신청하기</button>
				</div>
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
</main>

<script>
const userId = '${user.me_id}'; 
const gatherNum = '${ga.ga_st_num}';
$(document).ready(function() {
  $('.like_icon').on('click', function() {
    scrap();
  });

  function scrap() {
    // 데이터
    var requestData = {
      wa_me_id: userId,
      wa_ga_num: gatherNum
    };
    $.ajax({
      url: '<c:url value="/want" />',
      type: 'POST',
      contentType: "application/json",
      data: JSON.stringify(requestData),
      success: function(response) {
        if (response && response.wantState === 1) {
          $('.like_icon').attr('src', '<c:url value="/resources/img/love_off" />');
          alert('찜 했습니다.');
        } else if (response && response.wantState === 0) {
          $('.like_icon').attr('src', '<c:url value="/resources/img/like_on_red" />');
          alert('찜을 취소 했습니다.');
        }
      },
      error: function(error) {
    	  console.log(error)
        alert('찜에 실패하였습니다. 다시 시도해주세요');
      }
    });
  }
});
</script>