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
                                    <span class="scrap_num">12</span>
                                </div>
                                <div class="comment_bottom">
                                    <img class="icon_scrap" src="<c:url value='/resources/img/speech_bubble.png'></c:url>">
                                    <span>댓글</span>
                                    <span class="comment_num">12</span>
                                </div>
                            </div>
                        </div>
                     </div>