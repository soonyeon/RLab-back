<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value ='/resources/css/common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/notice/list.css'></c:url>" />
<title>RLab</title>

</head>
<body>
	<div id="total_container">
		<!-- main -->
		<main>
        <div id="main_container">
          <!-- aside(left_menu) -->
          <aside class="left_menu_container">
            <nav class="left_menu">
              <a href="#" class="list_item">마이페이지 홈</a>
              <a href="#" class="list_item">개인정보 수정</a>
              <a href="#" class="list_item">예약 관리</a>
              <a href="#" class="list_item">스터디 관리</a>
              <a href="#" class="list_item">작성글 관리</a>
            </nav>
          </aside>

          <section>
            <!-- 탭 -->
            <div class="tab-container">
              <a href="#"  class="tab selected_tab tab1"><div>전체보기</div></a>
              <a href="#" class="tab unselected_tab tab2"><div>공지사항</div></a>
              <a href="#"  class="tab unselected_tab tab3"><div>QnA</div></a>
            </div>
              <div class="my_study_container" id="my_container">
                <div class="study_card_container">

            <!-- table  -->
                  <div class="table_container">
                    <div class="select_box_area">
                      <select name="select_view">
                        <option value="전체보기">전체보기</option>
                        <option value="최신 순">최신 순</option>
                        <option value="작성일 순">작성일 순</option>
                      </select>
                    </div>

                    <div class="tab_content">
                    
                      <!-- 나의 스크랩 -->
                      <div class="table_area" id="tabs_3">
                        <table class="border_box">
                          <thead>
                            <tr class="board_title_list">
                              <td class="title_list_item">번호</td>
                              <td class="title_list_item">스터디명</td>
                              <td class="title_list_item">제목</td>
                              <td class="title_list_item">작성자</td>
                              <td class="title_list_item">작성일</td>
                            </tr>
                          </thead>
                          <tbody>
                            <tr class="board_list">
                              <td>24</td>
                              <td>프론트엔트 공부해요</td>
                              <td class="post_title">리액트 처음부터 함께 배워요! 당신도 할수있다! 아자아자 화이팅!</td>
                              <td>매미킴</td>
                              <td>2023.02.28</td>                             
                            <tr class="board_list">
                              <td>23</td>
                              <td>스프링 박살내기</td>
                              <td class="post_title">스프링을 이용한 게시판 만들기</td>
                              <td>매미킴</td>
                              <td>2023.02.28</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <!-- 페이지 이동 -->
                      <div class="page_area">
                        </div>
                          <div class="page_box clearfix">
                            <i class="btn_prev"></i>
                            <span class="page_num selected">1</span>
                            <span class="page_num">2</span>
                            <span class="page_num">3</span>
                            <i class="btn_next"></i>
                        </div>
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


</script>

</body>
</html>