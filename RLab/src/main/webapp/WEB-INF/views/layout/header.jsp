<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<!-- 모달 -->
    <header>
    <!-- 로그인 모달창 -->
      <div class="modal_container" id="loginModal">
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
			  <input type="checkbox" name="autoLogin" value="true"> 자동로그인
              <hr>
              <p class="more_action">
                <a href="#" class="more_action_item 1">아이디 찾기</a> |
                <a href="#" class="more_action_item 2">비밀번호 찾기</a> |
                <a href="<c:url value="/singup"></c:url>" class="more_action_item 3">회원가입</a>
              </p>
            </form>

          </div>
        </div>
      </div>

		<div class="modal_container" id="findIDModal">
		  <div class="modal_area">
		    <a href="#" class="close_btn">x</a>
		    <div class="find_id_box">
		      <h1>아이디 찾기</h1>

		      <form action="<c:url value='/findID'></c:url>" method="post">
		        <div class="form_group">
		          <!-- <label for="email"></label> -->
		          <input type="email" class="form_control" id="email" name="email" placeholder="이메일">
		        </div>
		        <button class="btn_outline_success col-12" type="button" onclick="findID()">아이디 찾기</button>
		      </form>

		    </div>
		  </div>
		</div>

		<div class="modal_container" id="findPWModal">
		  <div class="modal_area">
		    <a href="#" class="close_btn">x</a>
		    <div class="find_pw_box">
		      <h1>비밀번호 찾기</h1>

		      <form action="<c:url value='/findPW'></c:url>" method="post">
		        <div class="form_group">
		          <input type="text" class="form_control" id="findPW_id" name="me_id" placeholder="아이디">
		        </div>
		        <div class="form_group">
		          <input type="email" class="form_control" id="findPW_email" name="email" placeholder="이메일">
		        </div>
		        <button class="btn_outline_success col-12" type="button" onclick="findPW()">전송</button>
		      </form>
		    </div>
		  </div>
</div>


      <div id="header_container">
        <div class="header_left">

  
          <a href="#" class="btn_home"><i class="icon_home"></i>LAB</a>
          <nav class="top_menu_container">
         	<a href="<c:url value='/reservation'></c:url>" class="list_item">예약하기</a>
            <a href="<c:url value='/study/'></c:url>" class="list_item">스터디</a>
            <a href="<c:url value='/gather/list'></c:url>" class="list_item">모집 게시판</a>
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
		  		    		<a href="<c:url value='/mypage'></c:url>" class="icon_mypage">
		  		    			<c:if test="${user.me_profile == null}">
		  		    				<img class="mypage_img" src="<c:url value='/resources/img/user.png'></c:url>" width="auto" height="40">
		  		    				<span class="blind">마이페이지</span>
		  		    			</c:if>
		  		    			<c:if test="${user.me_profile != null}">
			  		    			<img class="mypage_img" src="<c:url value='/download/profile/${user.me_profile}'></c:url>" width="auto" height="40">
			  		    			<span class="blind">마이페이지</span>
		  		    			</c:if>
			  		    	</a>
              				<a class="logout_btn">로그아웃</a>
            			</div>    
              		</form>
		        </c:if>
        	</div>
        </div>
      </div>
    </header>
<script>
	$(document).ready(function() {
	    $('.login_modal').click(function(e) {
	      e.preventDefault();
	      $('#loginModal').show();
	    });
	
	    $('.more_action_item.1').click(function(e) {
	      e.preventDefault();
	      $('#loginModal').hide();
	      $('#findIDModal').show();
	    });
	    $('.more_action_item.2').click(function(e) {
	      e.preventDefault();
	      $('#loginModal').hide();
	      $('#findPWModal').show();
	    });
	
	    $('.close_btn').click(function(e) {
	      e.preventDefault();
	      $('.modal_container').hide();
	    });
	  });
		
    function findID() {
        let email = $("#email").val();
        $.ajax({
            type: "POST",
            url: "<c:url value='/findID'/>",
            data: {
                email: email
            },
            success: function(response) {
                if (response === "found") {
                    alert("이메일로 아이디를 보냈습니다.");
                } else {
                    alert("해당 이메일로 등록된 아이디가 없습니다.");
                }
            },
            error: function() {
                alert("이메일로 전송이 실패 했습니다.");
            }
        });
    }
    
    function findPW() {
    	let id = $("#findPW_id").val();
    	let email = $("#findPW_email").val();
        $.ajax({
            type: "POST",
            url: "<c:url value='/findPW'/>",
            data: {
                id: id,
                email: email
            },
            success: function(response) {
                if (response === "found") {
                    alert("이메일로 임시번호를 보냈습니다.");
                } else {
                    alert("해당 아이디와 이메일로 등록된 정보가 없습니다.");
                }
            },
            error: function() {
                alert("이메일로 전송이 실패 했습니다.");
            }
        });
    }
    $('.logout_btn').click(function(e) {
        e.preventDefault();
        $(this).closest('form').submit();
    });
    
</script>