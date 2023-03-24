<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>작성글 관리</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/mypost_post.css'></c:url>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/0639c8d8d2.js" crossorigin="anonymous"></script>
    <div
        id="total_container">
        <!-- main -->
        <main>
            <div class="left_menu_container_top">
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
            <div id="main_container">
                <h2>자유게시판</h2>
                <section>
                    <div class="my_study_container" id="my_container" style="margin-top:30px;">
                        <div
                            class="study_card_container">
                            <!-- table  -->
                            <div class="table_container">
                                <div class="select_box_area">
                                    <select name="select_view">
                                        <option value="전체보기">전체보기</option>
                                        <option value="최신 순">최신 순</option>
                                        <option value="작성일 순">작성일 순</option>
                                    </select>
                                </div>
                                <div
                                    class="tab_content">
                                    <!-- 나의 게시글 -->
                                    <div
                                        class="table_area_1" id="tabs_1">
                                        <!-- <div class="tab-content_tabel_area 1"> -->
                                        <table class="border_box">
                                            <tr class="board_title_list">
                                                <td class="title_list_item">번호</td>
                                                <td class="title_list_item">스터디명</td>
                                                <td class="title_list_item">제목</td>
                                                <td class="title_list_item">작성자</td>
                                                <td class="title_list_item">작성일</td>
                                                <td class="title_list_item">조회수</td>
                                                <td class="title_list_item">스크랩</td>
                                            </tr>
                                            <c:forEach var="board" items="${boardList}">
                                                <tr class="board_list_${board.bo_num}">
                                                    <td>${board.bo_num}</td>
                                                    <td>${board.st_name}</td>
                                                    <td class="post_title">
                                                        <a href="<c:url value='/board/detail/${board.bo_num}'></c:url>">
                                                            ${board.bo_title}</a>
                                                    </td>
                                                    <td>${board.me_name}</td>
                                                    <td>${board.bo_reg_date_str}</td>
                                                    <td>${board.bo_views}</td>
                                                    <td></td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <a class="write_btn" href="<c:url value="/board/insert"></c:url>" style="float:right;">작성하기</a>
                                    </div>
                                    <div class="page_box clearfix">
                                    	<c:if test="${ph.showPrev}">
                 							<a href="<c:url value='/board/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>"> <i class="btn_prev"></i></a>
           								</c:if>
           								<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                						 	<a class="page_num<c:if test="${ph.page == i}"> selected</c:if>" href="<c:url value='/board/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
            							</c:forEach>
                                        <c:if test="${ph.showNext}">
											<a href="<c:url value='/board/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>"><i class="btn_next"></i></a>
            							</c:if>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </div>
<script>
function redirectToBoardList(sortParam) {
    <c:url var="url" value="/board/list">
        <c:param name="page" value="1" />
        <c:param name="pageSize" value="10" />
    </c:url>
    window.location.href = "${url}&sort=" + sortParam;
}

document.addEventListener('DOMContentLoaded', function() {
	  var selectView = document.querySelector('select[name="select_view"]');
	  
	  var savedValue = localStorage.getItem('selectedOption');
	  if (savedValue) {
	    selectView.value = savedValue;
	  }

	  selectView.addEventListener('change', function() {
	    var selectedValue = this.value;
	    localStorage.setItem('selectedOption', selectedValue); //저장

	    var sortParam = "";
	    if (selectedValue === "최신 순") {
	      sortParam = "newest";
	    } else if (selectedValue === "작성일 순") {
	      sortParam = "oldest";
	    }

	    redirectToBoardList(sortParam);
	  });
	});
</script>