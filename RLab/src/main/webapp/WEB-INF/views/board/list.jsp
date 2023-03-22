<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    


    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>작성글 관리</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/board/mypost_post.css'></c:url>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/0639c8d8d2.js" crossorigin="anonymous"></script>


    <div id="total_container">
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
               
          <section>
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
                      <!-- 나의 게시글 -->
                      <div class="table_area_1" id="tabs_1">
                      <!-- <div class="tab-content_tabel_area 1"> -->
                        <table class="border_box">
                          <tr class="board_title_list">
                            <td class="title_list_item">번호</td>
                            <td class="title_list_item">스터디명</td>
                            <td class="title_list_item">제목</td>
                            <td class="title_list_item">작성자</td>
                            <td class="title_list_item">작성일</td>
                          </tr>
                          <c:forEach  var="board" items="${boardList}">
                          <tr class="board_list_${board.bo_num}">
                            <td>${board.bo_num}</td>
                            <td>${board.st_name}</td>
                            <td class="post_title">
                            	<a href="<c:url value='/board/detail/${board.bo_num}'></c:url>"> ${board.bo_title}</a>
                           	</td>
                            <td>${board.me_name}</td>
                            <td>${board.bo_reg_date}</td>
                          </tr>
                          </c:forEach>
                          
                        </table>
                        <a href="<c:url value="/board/insert"></c:url>" style="float:right;">작성하기</a>
                      </div>

                    <!-- 페이지 이동 -->
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

  
      
  
