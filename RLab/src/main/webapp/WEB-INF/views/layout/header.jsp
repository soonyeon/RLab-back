<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'></c:url>">
<!-- header -->
<!-- 모달 -->
    <header>
    <!-- 로그인 모달창 -->
      <div class="modal_container">
        <div class="modal_area">
          <a href="#" class="close_btn">x</a>
          <div class="login_box">
            <h1>로그인</h1>
            
            <form action="<c:url value='/login'></c:url>" method="post">
              <div class="form_group">
                <!-- <label for="id"></label> -->
                <input type="text" class="form_control" id="id" name="me_id" placeholder="아이디">
              </div>
              <div class="form_group">
                <!-- <label for="pw">비번:</label> -->
                <input type="password" class="form_control" id="pw" name="me_pw" placeholder="비밀번호">
              </div>
              <button class="btn_outline_success col-12">로그인</button>
              <hr>
              <p class="more_action">
                <a href="#" class="more_action_item 1">아이디 찾기</a> |
                <a href="#" class="more_action_item 2">비밀번호 찾기</a> |
                <a href="#" class="more_action_item 3">회원가입</a>
              </p>
            </form>
            
          </div>
        </div>
      </div>


  
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
	    		<c:if test="${user == null}">
            		<div class="join_box">
            			<a href="#" class="login_modal">로그인</a>
           				<a href="<c:url value='/signup'></c:url>" class="signup_btn">회원가입</a>
           			</div>
        		</c:if> 
		        <c:if test="${user != null}">		  		       
     				<form action="<c:url value='/logout'></c:url>" method="post">     
		  				<div class="logout_box">
		  		    		<a href="<c:url value='/mypage/mypage'></c:url>" class="icon_mypage">
		  		    			<c:if test="${user.me_profile == null}">
		  		    				<img class="mypage_img" src="<c:url value='/resources/img/user.png'></c:url>" width="auto" height="40">
		  		    				<span class="blind">마이페이지</span>
		  		    			</c:if>
		  		    			<c:if test="${user.me_profile != null}">
			  		    			<img class="mypage_img" src="<c:url value='/download${user.me_profile}'></c:url>" width="auto" height="40">
			  		    			<span class="blind">마이페이지</span>
		  		    			</c:if>
			  		    	</a>
              				<a class="logout_btn" href="<c:url value='/logout'></c:url>">로그아웃</a>
            			</div>    
              		</form>
		        </c:if>
        	</div>
        </div>
      </div>
    </header>
<script>

	$('.login_modal').click(function(){
		$('.modal_container').show();
	});
	$('.close_btn').click(function(){
		$('.modal_container').hide();
	});


</script>
    
    
    
    
    
    
    
    
    
    