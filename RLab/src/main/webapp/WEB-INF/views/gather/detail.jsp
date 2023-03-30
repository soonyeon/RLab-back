<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/gather/detail.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<style>
 .note-editable {
 	background-color: white;
 }
</style>

<!-- main -->
<main>
	<div id="main_container">
		<div class="board_title">
			<span>[서울]</span> <span>정처기 같이 준비해요!</span>
		</div>
		<div class="title_bottom">
			<div class="writer_box">
				<a href="#" class="writer"> <img class="icon_writer"
					src="<c:url value='/resources/img/profile_img.png'></c:url>"> <span class="writer_name">김돌탕</span></a>
			</div>
			
			<span class="write_date">2023.02.27</span>
			<div class="view_box">
				<img class="icon_view" src="<c:url value='/resources/img/view_lightgray.png'></c:url>">
				<span class="view">60</span>
			</div>
			
		</div>
		<h2>내용</h2>
		<div class="main_total_box">
			<div class="main_left_box"></div>
			<div class="main_right_box">
				<div class="rc_img_box">
					<div class="rc_img"></div>
				</div>
				<div class="rc_info_box">
					<div class="study_recruit_content_box">
						<span class="rc_title">정처기 같이 공부해요 </span>
					</div>
					<div class="study_content">
						<div class="study_recruiting">
							<span>모집중</span> <span>1</span> <span>/</span> <span>5</span>
						</div>
						<div class="like_img"></div>
					</div>
					<div class="study_tag_info">
						<span href="#" class="study_tag">#자격증</span> <span href="#"
							class="study_tag">#프로젝트</span> <span href="#" class="study_tag">#컴퓨터</span>
						<span href="#" class="study_tag">#독서토론</span> <span href="#"
							class="study_tag">#운동</span> <span href="#" class="study_tag">#경제학과</span>
					</div>

					<button class="apply_btn">신청하기</button>
				</div>
			</div>
		</div>

		<div class="main_bottom_box">
			<h2>Q&A</h2>
			<div class="comment_box">
				<div class="add_comment_box">
					<div class="cm_input_box">
						<input type="text" class="cm_write"
							placeholder="궁금한 점을 댓글로 작성해보세요!">
					</div>
					<button class="cm_upload_btn">등록</button>
				</div>
				<div class="reply_main_box">
					<div class="reply_top_box">
						<div class="cm_writer">
							<a href="#" class="cm_mypage"> <i class="img_mypage"></i> <span
								class="nick_name">도라미</span> <span class="write_date">2023.02.28</span>
							</a>
						</div>
						<div class="btn_box">
							<button class="reply_btn">답글달기</button>
							<button class="reply_btn">X삭제하기</button>
						</div>
						<div class="already_comment">안녕하세요!언제까지 모집하시나요?제가이번주에는 일이있어서
							당장 참여는 불가능해요.</div>
					</div>
				</div>
				<div class="re_reply_main_box">
					<div class="re_reply_top_box">
						<div class="cm_writer">
							<a href="#" class="cm_mypage"> <i class="img_mypage"></i> <span
								class="nick_name">도라미</span> <span class="write_date">2023.02.28</span>
							</a>
						</div>
						<div class="btn_box">
							<button class="reply_btn">답글달기</button>
							<button class="reply_btn">X삭제하기</button>
						</div>
						<div class="already_comment">안녕하세요!그럼 불가능하시겠네요. ㅃ2</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</main>
