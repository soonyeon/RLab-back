<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
    <header>
      <div id="header_container">
        <div class="header_left">
          <a href="#" class="btn_home"><i class="icon_home"></i>LAB</a>
          <nav class="top_menu_container">
         	<a href="#" class="list_item">예약하기</a>
            <a href="#" class="list_item">스터디</a>
            <a href="#" class="list_item">모집 게시판</a>
          </nav>
        </div>
        <div class="header_right">
	    	<div class="mypage_container">
	    		<c:if test="${user == null }">
            		<div class="join_box">
            			<a href="#" class="login_modal">로그인</a>
           				<a href="../html/signup.html" class="signup_btn">회원가입</a>
           			</div>
        		</c:if> 
		        <c:if test="${user != null }">   
		            <a href="#" class="mypage"><i class="icon_mypage"></i><span class="blind">마이페이지</span></a>
		        </c:if>
        	</div>
        </div>
      </div>
    </header>